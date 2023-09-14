import 'package:flutter/material.dart';
import 'package:travling_app/screens/explore_screen.dart';
import 'package:travling_app/screens/favoriets_screen.dart';
import 'package:travling_app/widgets/app_drawer.dart';
import '../models/trip.dart';

class TabsScreen extends StatefulWidget {
  final List<Trip> favTrips;
  TabsScreen(this.favTrips);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _screens;
  @override
  void initState() {
   _screens = [
    {"Screen": ExploreScreen(), "Title": "التصنيفات"},
    {"Screen": FavorietsScreen(widget.favTrips), "Title": "المفضلات"}
  ];
    super.initState();
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedIndex]["Title"]),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: _screens[_selectedIndex]["Screen"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "التصنيفات",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "المفضلة",
          )
        ],
      ),
    );
  }
}
