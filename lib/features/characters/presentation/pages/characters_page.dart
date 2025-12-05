import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/api/api.dart';
import '../../../../app/constants/globals.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Characters Page'),
      ),
      child: FutureBuilder<List<Character>>(
        future: charactersClass.getAllCharacters(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text('Error Loading Data.'));
          } else {
            var characters = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: characters.length,
              itemBuilder: (context, index) {
                return CupertinoListTile(
                  title: CircleAvatar(
                    child: Image.asset(characters[index].image),
                  ),
                  subtitle: Text('Index Number - ${index + 1}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
// characters[index].name