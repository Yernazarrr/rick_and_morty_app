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

  final List<Character> _characters = [];
  Info? _info;

  bool isGrid = true;
  bool isLoading = false;

  final CharacterFilters _filters = CharacterFilters();

  @override
  void initState() {
    super.initState();
    _loadInitial();
  }

  Future<void> _loadInitial() async {
    setState(() => isLoading = true);

    final (characters, info) = await _service.getCharacters(filters: _filters);

    setState(() {
      _characters
        ..clear()
        ..addAll(characters);
      _info = info;
      isLoading = false;
    });
  }

  Future<void> _refresh() async {
    await _loadInitial();
  }

  Future<void> _loadMore() async {
    if (_info?.next == null || isLoading) return;

    setState(() => isLoading = true);

    final (characters, info) = await _service.getCharacters(url: _info!.next);

    setState(() {
      _characters.addAll(characters);
      _info = info;
      isLoading = false;
    });
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
                        ? const Padding(
                            padding: EdgeInsets.all(16),
                            child: CupertinoActivityIndicator(),
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
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Всего персонажей: ${_characters.length}'.toUpperCase()),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => setState(() => isGrid = !isGrid),
            child: isGrid ? AppIcons.list() : AppIcons.grid(),
          ),
        ],
      ),
    );
  }

  SliverGrid _grid() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index == _characters.length - 1) {
          _loadMore();
        }
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
        if (index == _characters.length - 1) {
          _loadMore();
        }
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: CharacterListTile(character: _characters[index]),
        );
      }, childCount: _characters.length),
    );
  }
}
