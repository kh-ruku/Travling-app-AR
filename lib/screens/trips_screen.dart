import 'package:flutter/material.dart';
import 'package:travling_app/models/trip.dart';
import 'package:travling_app/widgets/trip_item.dart';

class TripScreen extends StatefulWidget {
  static const screenRoute = 'trips screen';
  final List<Trip> availbleTrips;

  TripScreen({this.availbleTrips = const []});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  late String categoryTitle = "";
  late List<Trip> displayTrips;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeAgrument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeAgrument['id'];
    final categoryTitle = routeAgrument['title'];
    displayTrips = widget.availbleTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();

    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
  setState(() {
    displayTrips.removeWhere((element) => element.id == tripId);
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            id: displayTrips[index].id,
            title: displayTrips[index].title,
            imgUrl: displayTrips[index].imgUrl,
            duration: displayTrips[index].duration,
            tripType: displayTrips[index].tripType,
            season: displayTrips[index].season,
            // removeItem: _removeTrip,
          );
        },
        itemCount: displayTrips.length,
      ),
    );
  }
}
