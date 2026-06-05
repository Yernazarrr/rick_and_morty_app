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
import '../../domain/entities/location.dart';
import '../bloc/location_detail/location_detail_cubit.dart';

class LocationDetailPage extends StatelessWidget {
  const LocationDetailPage({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LocationDetailCubit>()..load(id),
      child: const _LocationDetailView(),
    );
  }
}

class _LocationDetailView extends StatelessWidget {
  const _LocationDetailView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationDetailCubit, LocationDetailState>(
        builder: (context, state) {
          return switch (state.status) {
            LocationDetailStatus.initial ||
            LocationDetailStatus.loading => const LoadingIndicator(),
            LocationDetailStatus.failure => Scaffold(
              appBar: AppBar(),
              body: ErrorView(
                message: state.failure?.message ?? context.l10n.errorTitle,
              ),
            ),
            LocationDetailStatus.success => _Content(
              location: state.location!,
              residents: state.residents,
            ),
          };
        },
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({required this.location, required this.residents});
  final Location location;
  final List<dynamic> residents;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final subtitle = [
      if (location.type.isNotEmpty) context.trLocationType(location.type),
      if (location.dimension.isNotEmpty) context.trDimension(location.dimension),
    ].join(' · ');

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _Hero(
            seed: location.id,
            imageUrls:
                residents.take(4).map((r) => r.image as String).toList(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
            child: Text(
              context.trLocationName(location.name),
              style: context.textTheme.headlineMedium,
            ),
          ),
        ),
        if (subtitle.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(subtitle, style: context.textTheme.bodyMedium),
            ),
          ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Text(
              l10n.locationSummary(
                context.trLocationName(location.name),
                location.type.isEmpty
                    ? '—'
                    : context.trLocationType(location.type),
                location.dimension.isEmpty
                    ? '—'
                    : context.trDimension(location.dimension),
                location.residentIds.length,
              ),
              style: context.textTheme.bodyLarge,
            ),
          ),
        ),
        if (residents.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: SectionHeader(title: l10n.sectionResidents),
          ),
          SliverList.builder(
            itemCount: residents.length,
            itemBuilder: (context, index) => CharacterListTile(
              character: residents[index],
              onTap: () =>
                  CharacterDetailRoute(id: residents[index].id).push(context),
            ),
          ),
        ],
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero({required this.seed, this.imageUrls = const []});
  final int seed;

  /// Аватары жителей для обложки-коллажа; пусто — пока грузятся или их нет.
  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    final hue = (seed * 47) % 360;
    final base = HSLColor.fromAHSL(1, hue.toDouble(), 0.45, 0.4).toColor();
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: imageUrls.isEmpty
              ? DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [base, AppColors.darkBackground],
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.public, color: Colors.white70, size: 72),
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
