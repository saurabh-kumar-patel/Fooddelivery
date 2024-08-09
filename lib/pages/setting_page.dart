import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text("Setting"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // dark Mode
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),

            margin: const EdgeInsets.only(left: 25,top: 10,right: 25),
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Mode",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                //Switch
                CupertinoSwitch(
                  value:Provider.of<ThemeProvider>(context,listen: false).isDarkMode,
                  onChanged: (value)=>Provider.of<ThemeProvider>(context,listen: false).toggleTheme(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
