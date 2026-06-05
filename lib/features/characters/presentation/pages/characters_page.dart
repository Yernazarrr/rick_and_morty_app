import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/empty_view.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../core/widgets/search_field.dart';
import '../bloc/characters_list/characters_list_bloc.dart';
import '../widgets/character_grid_card.dart';
import '../widgets/character_list_tile.dart';
import '../widgets/characters_filter_sheet.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<CharactersListBloc>()..add(const CharactersStarted()),
      child: const _CharactersView(),
    );
  }
}

class _CharactersView extends StatefulWidget {
  const _CharactersView();

  @override
  State<_CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<_CharactersView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 400) {
      context.read<CharactersListBloc>().add(
        const CharactersNextPageRequested(),
      );
    }
  }

  Future<void> _openFilters() async {
    final bloc = context.read<CharactersListBloc>();
    final result = await CharactersFilterSheet.show(
      context,
      status: bloc.state.filter.status,
      gender: bloc.state.filter.gender,
    );
    if (result == null) return;
    if (result.reset) {
      bloc.add(const CharactersFilterReset());
    } else {
      bloc.add(
        CharactersFilterApplied(status: result.status, gender: result.gender),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CharactersListBloc, CharactersListState>(
          builder: (context, state) {
            final bloc = context.read<CharactersListBloc>();
            // Ограничиваем ширину контента на больших экранах, чтобы
            // список/сетка и поиск не растягивались на всю ширину.
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: context.contentMaxWidth),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                      child: SearchField(
                        hint: context.l10n.searchCharacterHint,
                        onChanged: (q) => bloc.add(CharactersSearchChanged(q)),
                        onFilterTap: _openFilters,
                      ),
                    ),
                    _Header(state: state),
                    Expanded(child: _buildBody(context, state)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, CharactersListState state) {
    switch (state.status) {
      case CharactersStatus.initial:
      case CharactersStatus.loading:
        return const LoadingIndicator();
      case CharactersStatus.failure:
        return ErrorView(
          message: state.failure?.message ?? context.l10n.errorTitle,
          onRetry: () =>
              context.read<CharactersListBloc>().add(const CharactersStarted()),
        );
      case CharactersStatus.success:
        if (state.characters.isEmpty) {
          return EmptyView(message: context.l10n.errorNotFound);
        }
        return RefreshIndicator(
          onRefresh: () async {
            context.read<CharactersListBloc>().add(const CharactersRefreshed());
          },
          child: state.viewMode == CharactersViewMode.list
              ? _buildList(context, state)
              : _buildGrid(context, state),
        );
    }
  }

  Widget _buildList(BuildContext context, CharactersListState state) {
    return ListView.separated(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: state.characters.length + (state.isLoadingMore ? 1 : 0),
      separatorBuilder: (_, _) => Divider(
        height: 1,
        indent: 96,
        endIndent: 16,
        color: Theme.of(context).dividerColor,
      ),
      itemBuilder: (context, index) {
        if (index >= state.characters.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: LoadingIndicator(size: 22),
          );
        }
        final character = state.characters[index];
        return CharacterListTile(
          character: character,
          onTap: () => CharacterDetailRoute(id: character.id).push(context),
        );
      },
    );
  }

  Widget _buildGrid(BuildContext context, CharactersListState state) {
    return GridView.builder(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      // Число колонок подстраивается под ширину экрана: 2 на телефоне,
      // 3 на планшете, 4 на десктопе.
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.gridColumns(),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.74,
      ),
      itemCount: state.characters.length,
      itemBuilder: (context, index) {
        final character = state.characters[index];
        return CharacterGridCard(
          character: character,
          onTap: () => CharacterDetailRoute(id: character.id).push(context),
        );
      },
    );
  }
}

/// Строка «Всего персонажей: N» и кнопка переключения список/сетка.
class _Header extends StatelessWidget {
  const _Header({required this.state});
  final CharactersListState state;

  @override
  Widget build(BuildContext context) {
    final isList = state.viewMode == CharactersViewMode.list;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 8, 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              context.l10n.totalCharacters(state.totalCount),
              style: context.textTheme.labelSmall,
            ),
          ),
          IconButton(
            icon: Icon(
              isList ? Icons.grid_view_rounded : Icons.view_agenda_outlined,
            ),
            color: context.statusColors.secondaryText,
            onPressed: () => context.read<CharactersListBloc>().add(
              const CharactersViewModeToggled(),
            ),
          ),
        ],
      ),
    );
  }
}
