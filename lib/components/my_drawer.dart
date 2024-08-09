import 'package:flutter/material.dart';
import 'package:fooddelivery/components/my_drawer_tile.dart';
import 'package:fooddelivery/pages/setting_page.dart';
import 'package:fooddelivery/services/auth/auth_services.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(){
    final authService=AuthServices();
    authService.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // App Logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          // home list tile
          MyDrawerTile(
            onTap: () => Navigator.pop(context),
            text: "H O M E",
            icon: Icons.settings,
          ),

          //setting list tile
          MyDrawerTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingPage()),
              );
            },
            text: "S E T T I N G",
            icon: Icons.home,
          ),
          const Spacer(),
          // Logout list tile
          MyDrawerTile(
            onTap:logout,
            text: "L O G O U T",
            icon: Icons.logout,
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
