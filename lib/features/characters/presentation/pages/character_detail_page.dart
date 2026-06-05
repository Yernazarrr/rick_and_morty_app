import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/localization/ru_glossary.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/app_network_image.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/fact_pair.dart';
import '../../../../core/widgets/info_tile.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/status_badge.dart';
import '../../../episodes/presentation/widgets/episode_list_tile.dart';
import '../../domain/entities/character.dart';
import '../bloc/character_detail/character_detail_cubit.dart';
import '../widgets/character_display.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CharacterDetailCubit>()..load(id),
      child: const _CharacterDetailView(),
    );
  }
}

class _CharacterDetailView extends StatelessWidget {
  const _CharacterDetailView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CharacterDetailCubit, CharacterDetailState>(
        builder: (context, state) {
          return switch (state.status) {
            DetailStatus.initial ||
            DetailStatus.loading => const _LoadingScaffold(),
            DetailStatus.failure => Scaffold(
              appBar: AppBar(),
              body: ErrorView(
                message: state.failure?.message ?? context.l10n.errorTitle,
              ),
            ),
            DetailStatus.success => _Content(
              character: state.character!,
              episodes: state.episodes,
            ),
          };
        },
      ),
    );
  }
}

class _LoadingScaffold extends StatelessWidget {
  const _LoadingScaffold();
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: LoadingIndicator());
}

class _Content extends StatelessWidget {
  const _Content({required this.character, required this.episodes});

  final Character character;
  final List<dynamic> episodes;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _HeroHeader(character: character)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: Text(
              l10n.characterSummary(
                character.name,
                context.trSpecies(character.species),
                context.genderLabel(character.gender),
                context.statusLabel(character.status),
                context.trLocationName(character.origin.name),
                context.trLocationName(character.location.name),
                character.episodeIds.length,
              ),
              style: context.textTheme.bodyLarge,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: FactPair(
            leftLabel: l10n.fieldGender,
            leftValue: context.genderLabel(character.gender),
            rightLabel: l10n.fieldSpecies,
            rightValue: context.trSpecies(character.species),
          ),
        ),
        SliverToBoxAdapter(
          child: InfoTile(
            label: l10n.fieldOrigin,
            value: context.trLocationName(character.origin.name),
            onTap: character.origin.hasLocation
                ? () => LocationDetailRoute(
                    id: character.origin.locationId!,
                  ).push(context)
                : null,
          ),
        ),
        SliverToBoxAdapter(
          child: InfoTile(
            label: l10n.fieldLocation,
            value: context.trLocationName(character.location.name),
            onTap: character.location.hasLocation
                ? () => LocationDetailRoute(
                    id: character.location.locationId!,
                  ).push(context)
                : null,
          ),
        ),
        if (episodes.isNotEmpty) ...[
          SliverToBoxAdapter(child: SectionHeader(title: l10n.sectionEpisodes)),
          SliverList.builder(
            itemCount: episodes.length,
            itemBuilder: (context, index) => EpisodeListTile(
              episode: episodes[index],
              onTap: () =>
                  EpisodeDetailRoute(id: episodes[index].id).push(context),
            ),
          ),
        ],
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}

/// Размытое hero-изображение с круглым аватаром, именем и статусом персонажа.
class _HeroHeader extends StatelessWidget {
  const _HeroHeader({required this.character});
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 220,
              width: double.infinity,
              child: AppNetworkImage(url: character.image, fit: BoxFit.cover),
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
            Positioned(
              bottom: -52,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: AppNetworkImage(
                    url: character.image,
                    width: 104,
                    height: 104,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 60),
        Text(character.name, style: context.textTheme.headlineMedium),
        const SizedBox(height: 6),
        StatusBadge(
          label: context.statusLabel(character.status),
          color: context.statusColor(character.status),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
