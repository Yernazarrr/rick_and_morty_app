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
import '../bloc/episodes_list/episodes_list_cubit.dart';
import '../widgets/episode_list_tile.dart';

class EpisodesPage extends StatelessWidget {
  const EpisodesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EpisodesListCubit>()..load(),
      child: const _EpisodesView(),
    );
  }
}

class _EpisodesView extends StatelessWidget {
  const _EpisodesView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<EpisodesListCubit, EpisodesListState>(
          builder: (context, state) {
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: context.contentMaxWidth),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                      child: SearchField(
                        hint: context.l10n.searchEpisodeHint,
                        onChanged: (q) =>
                            context.read<EpisodesListCubit>().search(q),
                      ),
                    ),
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

  Widget _buildBody(BuildContext context, EpisodesListState state) {
    switch (state.status) {
      case EpisodesStatus.initial:
      case EpisodesStatus.loading:
        return const LoadingIndicator();
      case EpisodesStatus.failure:
        return ErrorView(
          message: state.failure?.message ?? context.l10n.errorTitle,
          onRetry: () => context.read<EpisodesListCubit>().load(),
        );
      case EpisodesStatus.success:
        final seasons = state.seasons;
        final bySeason = state.bySeason;
        if (seasons.isEmpty || bySeason.values.every((l) => l.isEmpty)) {
          return EmptyView(message: context.l10n.errorNotFound);
        }
        return DefaultTabController(
          length: seasons.length,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelStyle: context.textTheme.titleMedium,
                tabs: [
                  for (final s in seasons)
                    Tab(text: context.l10n.seasonTab(s).toUpperCase()),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    for (final s in seasons)
                      _SeasonList(
                        episodes: bySeason[s] ?? const [],
                        state: state,
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
    }
  }
}

class _SeasonList extends StatelessWidget {
  const _SeasonList({required this.episodes, required this.state});
  final List<dynamic> episodes;
  final EpisodesListState state;

  @override
  Widget build(BuildContext context) {
    if (episodes.isEmpty) {
      return EmptyView(message: context.l10n.errorNotFound);
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: episodes.length,
      separatorBuilder: (_, _) => Divider(
        height: 1,
        indent: 86,
        endIndent: 20,
        color: Theme.of(context).dividerColor,
      ),
      itemBuilder: (context, index) {
        final episode = episodes[index];
        return EpisodeListTile(
          episode: episode,
          coverImages: state.coverImagesFor(episode),
          onTap: () => EpisodeDetailRoute(id: episode.id).push(context),
        );
      },
    );
  }
}
