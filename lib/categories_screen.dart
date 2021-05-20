import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import './models/category.dart';
import './category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MealsApp')),
      body: GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          children: DUMMY_CATEGORIES
              .map((catData) => CategoryItem(
                    catData.title,
                    catData.color,
                  ))
              .toList()),
    );
    // Mapping DUMMY_CATEGORIES to the children of CategoriesScreen
  }
}

// * Notes
// Slivers are just scrollable area on the screen.
// Grid Delegate takes care of the grid structing.
// the mainAxisSpacing and crossAxisSpacing get the some spacing between items
// the maxCrossAxisExtent gives the max cross axis length of 200
// the childAspectRation 3 / 2 gives the 300 / 200
