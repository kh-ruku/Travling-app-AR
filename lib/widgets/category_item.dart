import 'package:flutter/material.dart';
import 'package:travling_app/screens/trips_screen.dart';

class CategoryItem extends StatelessWidget {
  late final String id;
  late final String title;
  late final String urlImg;
  CategoryItem(this.title, this.urlImg, this.id);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      TripScreen.screenRoute,
      arguments: {
        'id': id,
        'title': title
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              urlImg,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black.withOpacity(0.35),
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          )
        ],
      ),
    );
  }
}
