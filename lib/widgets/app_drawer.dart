import 'package:flutter/material.dart';
import 'package:travling_app/screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              "تطبيق السياحة",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            context,
            "الرحلات",
            Icons.card_travel,
            () {
              Navigator.of(context).pushReplacementNamed('home');
            },
          ),
          buildListTile(
            context,
            "التصفية",
            Icons.filter_list,
            () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.screenRoute);
            },
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(
      BuildContext context, String title, IconData icon, Function onTab) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontFamily: "ElMessiri"),
      ),
      leading: Icon(
        icon,
        size: 30,
        color: Theme.of(context).primaryColor,
      ),
      onTap: () {
        onTab();
      },
    );
  }
}
