import 'package:flutter/material.dart';

import '../models/trip.dart';
import '../widgets/trip_item.dart';

class FavorietsScreen extends StatelessWidget {
  final List<Trip> favTrips;
  FavorietsScreen(this.favTrips);
  @override
  Widget build(BuildContext context) {
    if (favTrips.isEmpty) {
      return const Center(
        child: Text("fav page"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            id: favTrips[index].id,
            title: favTrips[index].title,
            imgUrl: favTrips[index].imgUrl,
            duration: favTrips[index].duration,
            tripType: favTrips[index].tripType,
            season: favTrips[index].season,
            // removeItem: _removeTrip,
          );
        },
        itemCount: favTrips.length,
      );
    }
  }
}
