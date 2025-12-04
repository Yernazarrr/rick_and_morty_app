import 'package:flutter/cupertino.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Locations Page')),
      child: Center(child: Text('Locations Page!')),
    );
  }
}
