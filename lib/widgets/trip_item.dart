import 'package:flutter/material.dart';
import 'package:travling_app/app_data.dart';
import 'package:travling_app/models/trip.dart';
import 'package:travling_app/screens/details_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  // final Function removeItem;

  const TripItem({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.duration,
    required this.tripType,
    required this.season,
    required this.id,
    // required this.removeItem,
  });

  String get seasonText {
    switch (season) {
      case Season.winter:
        return "شتاء";
        break;
      case Season.spring:
        return "ربيع";
        break;
      case Season.summer:
        return "صيف";
        break;
      case Season.autumn:
        return "خريف";
      default:
        return "null";
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.exploration:
        return "استكشاف";
        break;
      case TripType.activities:
        return "انشطة";
        break;
      case TripType.recovery:
        return "نقاهة";
        break;
      case TripType.therapy:
        return "معالجة";
        break;
      default:
        return "null";
    }
  }

  void selectTrip(BuildContext context) {
    Navigator.of(context)
        .pushNamed(DetailsScreen.screenRoute, arguments: id)
        .then(
      (value) {
        if (value != null) {
          // removeItem(value);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  child: Image.network(
                    imgUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.8)
                    ],
                    // stops: [
                    //   0.6,
                    //   1
                    // ]
                  )),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium,
                    overflow: TextOverflow.fade,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration ايام')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(seasonText)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(tripTypeText)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
