import 'package:flutter/material.dart';
import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
// static const for screenname or routename to for navigating to this page.
  static const screenName = '/category-meals';

  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}

// *NOTES
// * IMP
// ModalRoute can be used to get title and id from the other screen.
// we can get map the items through variables
// * NOTES
// From dummy_meals data we are iterating it from where keyword.
// We are returning meals.categories and checking it has contains the categoryId
// category id is DUMMY_CATEGORIES id value like c1, c2, c3....
