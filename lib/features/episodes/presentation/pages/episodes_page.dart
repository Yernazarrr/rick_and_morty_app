import 'package:flutter/cupertino.dart';

class EpisodesPage extends StatelessWidget {
  const EpisodesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Characters Page')),
      child: Center(child: Text('Characters Page!')),
    );
  }
}
