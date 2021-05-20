import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: [],
    );
  }
}



// * Notes
// Slivers are just scrollable area on the screen.
// Grid Delegate takes care of the grid structing.
// the mainAxisSpacing and crossAxisSpacing get the some spacing between items
// the maxCrossAxisExtent gives the max cross axis length of 200
// the childAspectRation 3 / 2 gives the 300 / 200
