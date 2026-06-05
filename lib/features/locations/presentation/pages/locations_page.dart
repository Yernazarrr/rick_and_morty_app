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
import '../bloc/locations_list/locations_list_bloc.dart';
import '../widgets/location_card.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LocationsListBloc>()..add(const LocationsStarted()),
      child: const _LocationsView(),
    );
  }
}

class _LocationsView extends StatefulWidget {
  const _LocationsView();

  @override
  State<_LocationsView> createState() => _LocationsViewState();
}

class _LocationsViewState extends State<_LocationsView> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_controller.position.pixels >=
        _controller.position.maxScrollExtent - 400) {
      context.read<LocationsListBloc>().add(const LocationsNextPageRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<LocationsListBloc, LocationsListState>(
          builder: (context, state) {
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: context.contentMaxWidth),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                      child: SearchField(
                        hint: context.l10n.searchLocationHint,
                        onChanged: (q) => context
                            .read<LocationsListBloc>()
                            .add(LocationsSearchChanged(q)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          context.l10n.totalLocations(state.totalCount),
                          style: context.textTheme.labelSmall,
                        ),
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

  Widget _buildBody(BuildContext context, LocationsListState state) {
    switch (state.status) {
      case LocationsStatus.initial:
      case LocationsStatus.loading:
        return const LoadingIndicator();
      case LocationsStatus.failure:
        return ErrorView(
          message: state.failure?.message ?? context.l10n.errorTitle,
          onRetry: () =>
              context.read<LocationsListBloc>().add(const LocationsStarted()),
        );
      case LocationsStatus.success:
        if (state.locations.isEmpty) {
          return EmptyView(message: context.l10n.errorNotFound);
        }
        return RefreshIndicator(
          onRefresh: () async =>
              context.read<LocationsListBloc>().add(const LocationsRefreshed()),
          child: ListView.builder(
            controller: _controller,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 16),
            itemCount: state.locations.length + (state.isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= state.locations.length) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: LoadingIndicator(size: 22),
                );
              }
              final location = state.locations[index];
              return LocationCard(
                location: location,
                coverImages: state.coverImagesFor(location),
                onTap: () =>
                    LocationDetailRoute(id: location.id).push(context),
              );
            },
          ),
        );
    }
  }
}
