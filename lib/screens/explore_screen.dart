import 'package:flutter/material.dart';
import 'package:travling_app/app_data.dart';
import 'package:travling_app/widgets/category_item.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 7 / 8,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10
            ),
        children: Categories_data.map(
          (categoryData) =>
              CategoryItem(categoryData.title, categoryData.imgUrl,categoryData.id),
        ).toList(),
      );
    
  }
}
