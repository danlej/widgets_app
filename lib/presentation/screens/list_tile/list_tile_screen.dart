// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/widgets/profile_avatar.dart';

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
            padding: const EdgeInsets.all(5.0),
            child: Material(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.amber[400],
                  child: const Text(
                    'A',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                title: const Row(
                  children: [
                    Text('America ', style: TextStyle(fontSize: 15)),
                    Icon(
                      Icons.people_alt,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ],
                ),
                subtitle: const Text(
                  'Not Shared',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                trailing: const Icon(Icons.share, color: Colors.black54),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Material(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue[600],
                  child: const Icon(
                    Icons.wifi_outlined,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  'Network & Internet',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Wi-Fi, mobile, data usage, and hotspot',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Material(
              child: ListTile(
                leading: const ProfileAvatar(backgroundImage: 'assets/images/woman.png'),
                title: const Text(
                  'Madelaine Stone',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Row(
                  spacing: 2,
                  children: [
                    Stack(children: [
                      Icon(Icons.check, size: 20, color: Colors.blue),
                      Positioned(right: 4, child: Icon(Icons.check, size: 20, color: Colors.blue)),
                    ]),
                    Icon(Icons.camera_alt_rounded, color: Colors.grey),
                    Text(' Photo', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Column(
                    spacing: 5,
                    children: [
                      Text(
                        '11:31 PM',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.green[700]),
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green[700]),
                        child: const Center(
                          child: Text('2', style: TextStyle(fontSize: 13, color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
                tileColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
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
