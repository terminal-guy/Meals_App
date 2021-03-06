import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //  home: CategoriesScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.screenName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.screenname: (ctx) => MealDetailScreen(),
        FiltersScreen.screenName: (ctx) => FiltersScreen(_filters, _setFilters),
      },

      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      // * for onGenerateRoute
      // we don't really use this but this is useful instead of if the route is not found you can easily make this the default and not get a error.
      // this is useful if screens are generated dynamically that we don't know the timeline.

      onUnknownRoute: (settings) {},
      // * for onUnknownRoute
      // this can be really useful inorder can be used if flutter fails to render. like a 404

      // * NOTES
      // In routes '/' will be the default home page.
      // You can also override it with initialRoute
      // In case of any typos in the routename it will cumbersome to find the bug.
      // So we use a static const variable to use it.
    );
  }
}

// routes are used in order to navigate and pass data through the screens.
// / notation is used cuz the web dev use it so while navigation through screens
