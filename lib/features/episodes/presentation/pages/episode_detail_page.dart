import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/localization/ru_glossary.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/avatar_collage.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../characters/presentation/widgets/character_list_tile.dart';
import '../../domain/entities/episode.dart';
import '../bloc/episode_detail/episode_detail_cubit.dart';

class EpisodeDetailPage extends StatelessWidget {
  const EpisodeDetailPage({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EpisodeDetailCubit>()..load(id),
      child: const _EpisodeDetailView(),
    );
  }
}

class _EpisodeDetailView extends StatelessWidget {
  const _EpisodeDetailView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<EpisodeDetailCubit, EpisodeDetailState>(
        builder: (context, state) {
          return switch (state.status) {
            EpisodeDetailStatus.initial ||
            EpisodeDetailStatus.loading => const LoadingIndicator(),
            EpisodeDetailStatus.failure => Scaffold(
              appBar: AppBar(),
              body: ErrorView(
                message: state.failure?.message ?? context.l10n.errorTitle,
              ),
            ),
            EpisodeDetailStatus.success => _Content(
              episode: state.episode!,
              characters: state.characters,
            ),
          };
        },
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({required this.episode, required this.characters});
  final Episode episode;
  final List<dynamic> characters;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _Hero(
            imageUrls: characters.take(4).map((c) => c.image as String).toList(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
            child: Text(
              context.trEpisodeName(episode.name),
              style: context.textTheme.headlineMedium,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            child: Text(
              l10n.episodeSummary(
                episode.season,
                episode.numberInSeason,
                episode.code,
                episode.airDate,
                episode.characterIds.length,
              ),
              style: context.textTheme.bodyLarge,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.premiere, style: context.textTheme.labelSmall),
                const SizedBox(height: 4),
                Text(episode.airDate, style: context.textTheme.titleMedium),
              ],
            ),
          ),
        ),
        if (characters.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: SectionHeader(title: l10n.sectionCharacters),
          ),
          SliverList.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) => CharacterListTile(
              character: characters[index],
              onTap: () =>
                  CharacterDetailRoute(id: characters[index].id).push(context),
            ),
          ),
        ],
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}

/// Hero эпизода: коллаж из аватаров персонажей эпизода. У эпизодов нет
/// собственного изображения в API, поэтому пока персонажи не загрузились
/// показываем декоративный градиент.
class _Hero extends StatelessWidget {
  const _Hero({this.imageUrls = const []});

  /// Аватары персонажей эпизода для обложки-коллажа.
  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 220,
          width: double.infinity,
          child: imageUrls.isEmpty
              ? const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.accentDark, AppColors.accent],
                    ),
                  ),
                  child: Center(
                    child: Icon(Icons.movie_outlined,
                        color: Colors.white70, size: 56),
                  ),
                )
              : AvatarCollage(imageUrls: imageUrls),
        ),
        const Positioned(
          left: 12,
          top: 8,
          child: SafeArea(
            child: CircleAvatar(
              backgroundColor: Colors.black26,
              child: BackButton(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
