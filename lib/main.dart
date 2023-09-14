import 'package:flutter/material.dart';
import 'package:travling_app/app_data.dart';
import 'package:travling_app/models/trip.dart';
import 'package:travling_app/screens/details_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travling_app/screens/filters_screen.dart';
import 'package:travling_app/screens/tabs_screen.dart';
import 'package:travling_app/screens/trips_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "summer": false,
    "winter": false,
    "family": false,
  };

  List<Trip> _availbleTrips = tripsData;
  List<Trip> _favTrips = [];

  void _changedFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availbleTrips = tripsData.where(
        (trip) {
          if (_filters["summer"] == true && trip.isInSummer != true) {
            return false;
          }
          if (_filters["winter"] == true && trip.isInWinter != true) {
            return false;
          }
          if (_filters["family"] == true && trip.isForFamily != true) {
            return false;
          }
          return true;
        },
      ).toList();
    });
  }

  void _manageFav(String tripId) {
    final exIndex = _favTrips.indexWhere((trip) => trip.id == tripId);
    if (exIndex > 0) {
      setState(() {
        _favTrips.removeAt(exIndex);
      });
    } else {
      setState(() {
        _favTrips.add(
          tripsData.firstWhere((trip) => trip.id == tripId),
        );
      });
    }
  }

  bool _isFav(String id) {
    return _favTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travling app',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'), // English
      ],
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: "ElMessiri",
        textTheme: ThemeData.light().textTheme.copyWith(
              headlineSmall: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontFamily: "ElMessiri",
                  fontWeight: FontWeight.bold),
              headlineMedium: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: "ElMessiri",
                  fontWeight: FontWeight.bold),
            ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.amber,
        ),
      ),
      // home: const ExploreScreen(),
      initialRoute: 'home',
      routes: {
        'home': (context) => TabsScreen(_favTrips),
        TripScreen.screenRoute: (context) => TripScreen(
              availbleTrips: _availbleTrips,
            ),
        DetailsScreen.screenRoute: (context) => DetailsScreen(_manageFav,_isFav),
        FiltersScreen.screenRoute: (context) => FiltersScreen(
              saveFilters: _changedFilters,
              currentFilters: _filters,
            ),
      },
    );
  }
}
