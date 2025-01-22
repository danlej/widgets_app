// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ListTileScreen extends StatelessWidget {
  static const String name = 'list_tile';

  const ListTileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListTile Screen'),
        elevation: 3,
        shadowColor: Colors.black54,
      ),
      body: const _ListTileView(),
    );
  }
}

class _ListTileView extends StatelessWidget {
  const _ListTileView();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: const EdgeInsets.all(5),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Material(
              color: Colors.grey[300],
              child: ListTile(
                title: const Text('Example Title'),
                subtitle: const Text('Example SubTitle'),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.yellow,
                  shadows: [BoxShadow(color: Colors.black, offset: Offset(1.0, 1.0), blurRadius: 4.0)],
                ),
                leading: const Icon(Icons.account_circle_rounded, size: 30),
                onTap: () => print('onTap Pressed!'),
                onLongPress: () => print('onLong Pressed!'),
                iconColor: Colors.white,
                textColor: Colors.white,
                tileColor: Colors.deepOrange,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Material(
              color: Colors.grey[300],
              child: ListTile(
                title: const Text('Example Title'),
                subtitle: const Text('Example SubTitle'),
                trailing: const Icon(Icons.arrow_forward_ios),
                leading: const Icon(Icons.account_circle_rounded, size: 30),
                onTap: () => print('onTap Pressed!'),
                onLongPress: () => print('onLong Pressed!'),
                iconColor: Colors.white,
                textColor: Colors.white,
                tileColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Card(
            elevation: 3,
            child: ListTile(
              title: const Text('Example Title'),
              subtitle: const Text('Example SubTitle'),
              trailing: const Icon(Icons.arrow_forward_ios),
              leading: const Icon(Icons.account_circle_rounded, size: 30),
              onTap: () => print('onTap Pressed!'),
              onLongPress: () => print('onLong Pressed!'),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Example Title'),
              subtitle: const Text('Example SubTitle'),
              trailing: const Icon(Icons.arrow_forward_ios),
              leading: const Icon(Icons.account_circle_rounded, size: 30),
              onTap: () => print('onTap Pressed!'),
              onLongPress: () => print('onLong Pressed!'),
            ),
          ),
          ListTile(
            title: const Text('Example Title'),
            subtitle: const Text('Example SubTitle'),
            trailing: const Icon(Icons.arrow_forward_ios),
            leading: const Icon(Icons.star_border_purple500, size: 30),
            onTap: () => print('onTap Pressed!'),
            onLongPress: () => print('onLong Pressed!'),
          ),
          const ListTile(
            title: Text('Example Title'),
            subtitle: Text('Example SubTitle'),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(Icons.star_border_purple500, size: 30),
            enabled: false,
          ),
          const ListTile(
            title: Text('Example Title'),
            subtitle: Text('Example SubTitle'),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(Icons.star_border_purple500, size: 30),
            dense: true,
          ),
          const ListTile(
            title: Text('Example Title'),
            subtitle: Text('Example SubTitle'),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(Icons.star_border_purple500, size: 30),
            contentPadding: EdgeInsets.all(20),
          ),
          const ListTile(
            title: Text('Example Title'),
            subtitle: Text('Example SubTitle'),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(Icons.star_border_purple500, size: 30),
          ),
          const ListTile(
            title: Text('Example Title'),
            subtitle: Text('Example SubTitle'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const ListTile(
            title: Text('Example Title'),
            subtitle: Text('Example SubTitle'),
          ),
          const ListTile(
            title: Text('Example Title'),
          )
        ],
      ),
    );
  }
}
