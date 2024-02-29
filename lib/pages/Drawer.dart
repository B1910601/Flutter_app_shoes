import 'package:flutter/material.dart';

import './home_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('HELLO'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Trang chủ'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProductsScreen()));
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Giới thiệu về shop'),
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Đăng xuất'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
