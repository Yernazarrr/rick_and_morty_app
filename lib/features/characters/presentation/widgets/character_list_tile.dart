import 'package:flutter/cupertino.dart';

import '../../../../app/api/api.dart';

class CharacterListTile extends StatelessWidget {
  final Character character;

  const CharacterListTile({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              character.image,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  '${character.status} • ${character.species}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
