import 'package:flutter/cupertino.dart';

import '../../../../app/api/api.dart';
import '../../../../app/constants/app_icons.dart';
import '../widgets/character_grid_card.dart';
import '../widgets/character_list_tile.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final CharacterService _service = CharacterService();

  bool isLoading = false;
  bool isRefreshing = false;

  bool isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  final List<Character> _characters = [];

  bool isGrid = true;

  CharacterFilters? _filters;

  @override
  void initState() {
    super.initState();
    _loadInitial();
  }

  Future<void> _loadInitial() async {
    if (!isRefreshing) {
      setState(() => isLoading = true);
    }

    _characters.clear();

    String? nextUrl =
        '${Constants.baseURL}${Constants.characterEndpoint}'
        '${_filters == null ? '' : _service.buildFiltersForUI(_filters)}';

    while (nextUrl != null) {
      final (characters, info) = await _service.getCharacters(url: nextUrl);

      _characters.addAll(characters);
      nextUrl = info.next;
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _refresh() async {
    setState(() => isRefreshing = true);
    await _loadInitial();
    setState(() => isRefreshing = false);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            _header(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  CupertinoSliverRefreshControl(onRefresh: _refresh),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    sliver: isGrid ? _grid() : _list(),
                  ),
                  SliverToBoxAdapter(
                    child: isLoading
                        ? Padding(
                            padding: const EdgeInsets.all(16),
                            child: (isLoading && !isRefreshing)
                                ? const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: CupertinoActivityIndicator(),
                                  )
                                : const SizedBox.shrink(),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Всего персонажей: ${_characters.length}'.toUpperCase()),
              Row(
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() => isSearching = !isSearching);
                    },
                    child: const Icon(CupertinoIcons.search),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: _openFilters,
                    child: const Icon(CupertinoIcons.slider_horizontal_3),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => setState(() => isGrid = !isGrid),
                    child: isGrid ? AppIcons.list() : AppIcons.grid(),
                  ),
                ],
              ),
            ],
          ),

          if (isSearching) _searchField(),
        ],
      ),
    );
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: CupertinoSearchTextField(
        controller: _searchController,
        placeholder: 'Поиск по имени',
        onChanged: (value) {
          if (value.isEmpty) {
            _filters = null;
          } else {
            _filters = CharacterFilters(name: value);
          }
          _loadInitial();
        },
      ),
    );
  }

  void _openFilters() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => CupertinoActionSheet(
        title: const Text('Фильтры'),
        actions: [
          _filterAction(
            title: 'Alive',
            onTap: () => _applyStatus(CharacterStatus.alive),
          ),
          _filterAction(
            title: 'Dead',
            onTap: () => _applyStatus(CharacterStatus.dead),
          ),
          _filterAction(
            title: 'Male',
            onTap: () => _applyGender(CharacterGender.male),
          ),
          _filterAction(
            title: 'Female',
            onTap: () => _applyGender(CharacterGender.female),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            _filters = const CharacterFilters();
            _loadInitial();
            Navigator.pop(context);
          },
          child: const Text('Сбросить фильтры'),
        ),
      ),
    );
  }

  CupertinoActionSheetAction _filterAction({
    required String title,
    required VoidCallback onTap,
  }) {
    return CupertinoActionSheetAction(
      onPressed: () {
        onTap();
        Navigator.pop(context);
      },
      child: Text(title),
    );
  }

  void _applyStatus(CharacterStatus status) {
    _filters = CharacterFilters(name: _filters?.name, status: status);

    if (_filters!.isEmpty) {
      _filters = null;
    }

    _loadInitial();
  }

  void _applyGender(CharacterGender gender) {
    _filters = CharacterFilters(name: _filters?.name, gender: gender);

    if (_filters!.isEmpty) {
      _filters = null;
    }

    _loadInitial();
  }

  SliverGrid _grid() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return CharacterGridCard(character: _characters[index]);
      }, childCount: _characters.length),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.7,
      ),
    );
  }

  SliverList _list() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: CharacterListTile(character: _characters[index]),
        );
      }, childCount: _characters.length),
    );
  }
}
