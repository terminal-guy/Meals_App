# Meals App

Pro Info: Instructor

Status: Done

Url: https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/15033798#overview

- ***Introduction***

    Section 7: Navigation & Multiple Screens [Meals App]

    In this module learning about navigation and multiple screens and how to build a beautiful User Interface.

- ***Planning the App***

    There are going to be several screens on the app like favourites, categories and settings pages and we are going to learn how add some funcationlity to the app.

- ***Starting With The App - Adding Base Data***

    Slivers are just scrollable area on the screen. Grid Delegate takes care of the grid structing. 

    ### Process through this lecture:

    - Added a base and a simple main.dart with comments removed and slightly modified.
    - Added a model (category)
    - Added a dummy data file cuz we don't have a database or a server to get info.

    - Code

        ```dart
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

        // Slivers are just scrollable area on the screen. 
        // Grid Delegate takes care of the grid structing. 
        // the mainAxisSpacing and crossAxisSpacing get the some spacing between items
        // the maxCrossAxisExtent gives the max cross axis length of 200
        // the childAspectRation 3 / 2 gives the 300 / 200
        ```

- ***Creating a Grid & Working with Linear Gradients.***

    Linear Gradients are useful to generate gradients in linear way. 

    ### Process through this lecture:

    - Added a category_item widget to make a category item.
    - Mapped CategoriesScreen children to DUMMY_CATEGORIES.

    - Code for categories_screen.dart

        ```dart
        import 'package:flutter/material.dart';
        import 'package:meals_app/dummy_data.dart';
        import './models/category.dart';
        import './category_item.dart';

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
                children: DUMMY_CATEGORIES
                    .map((catData) => CategoryItem(
                          catData.title,
                          catData.color,
                        ))
                    .toList());
            // Mapping DUMMY_CATEGORIES to the children of CategoriesScreen
          }
        }
        ```

    - Code for category_item.dart

        ```dart
        import 'package:flutter/material.dart';

        class CategoryItem extends StatelessWidget {
          final String title;
          final Color color;

          CategoryItem(this.title, this.color);

          @override
          Widget build(BuildContext context) {
            return Container(
              padding: const EdgeInsets.all(15),
              child: Text(title),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color.withOpacity(0.7), color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            );
          }
        }
        ```

- ***Registering a screen as main Screen***

    A scaffold is need to make a screen in the app.

    ### Process through this lecture:

    - Removing homepage and adding categories_screen as homepage.
    - Adding scaffold and a appbar to the categories_screen

    - Code for categories_screen.dart

        ```dart
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
        ```

    - Code for main.dart\

        ```dart
        import 'package:flutter/material.dart';
        import 'package:meals_app/categories_screen.dart';

        void main() => runApp(MyApp());

        class MyApp extends StatelessWidget {
          @override
          Widget build(BuildContext context) {
            return MaterialApp(
              title: 'DeliMeals',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: CategoriesScreen(),
            );
          }
        }
        ```

- ***Navigating to a New Page***

    We can navigate with screens or pages using Navigator. Navigator needs a context. MaterialPageRoute can be used give navigator to the screen.

    Inkwell is the basically widget like gesturedector but it has the ripple effect that gesturedector doesn't have.

    ### Process through this lecture:

    - Learned some basics about Navigator.
    - And Yet to learn named arguments for navigator.
    - And Learned how to use Inkwell.

    - Code for categories_item.dart

        ```dart
        import 'package:flutter/material.dart';
        import 'package:meals_app/category_meals_screen.dart';

        class CategoryItem extends StatelessWidget {
          final String title;
          final Color color;

          CategoryItem(this.title, this.color);

          void selectCategory(BuildContext ctx) {
            Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
              return CategoryMealsScreen();
            }));
          }

          @override
          Widget build(BuildContext context) {
            return InkWell(
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
              onTap: () => selectCategory(context),
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color.withOpacity(0.7), color],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            );
          }
        }
        ```

- ***Using Named Routes & Passing Data With Named Routes***

    Notes are in lecture are explained by their file so for explaination review the files.

    - Code for main.dart

        ```dart
        import 'package:flutter/material.dart';
        import 'package:meals_app/categories_screen.dart';
        import 'package:meals_app/category_meals_screen.dart';

        void main() => runApp(MyApp());

        class MyApp extends StatelessWidget {
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
                        color: Color.fromRGBO(20, 51, 51, 1),
                      ),
                      headline6: TextStyle(
                        fontSize: 20,
                        fontFamily: 'RobotoCondensed',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              )
              home: CategoriesScreen(),
              routes: {
                '/category-meals': (ctx) => CategoryMealsScreen(),
              },
            );
          }
        }

        // routes are used in order to navigate and pass data through the screens.
        // / notation is used cuz the web dev use it so while navigation through screens
        ```

    - Code for category_item.dart

        ```dart
        import 'package:flutter/material.dart';
        import 'package:meals_app/category_meals_screen.dart';

        class CategoryItem extends StatelessWidget {
          final String id;
          final String title;
          final Color color;

          CategoryItem(this.id, this.title, this.color);

          void selectCategory(BuildContext ctx) {
            Navigator.of(ctx).pushNamed('/category-meals', arguments: {
              'id': id,
              'title': title,
            });
          }
        // * NOTES
        // routes are needed for pushnamed 
        // the route id like /category-meals must be correct
        // Or maybe a error that cannot be identified easily.
        // * IMP
        // Like passing data through can be done using ARGUMENTS argument.
        // arguments can be anything but we are using maps cuz there are more things to pass through.

          @override
          Widget build(BuildContext context) {
            return InkWell(
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
              onTap: () => selectCategory(context),
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color.withOpacity(0.7), color],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            );
          }
        }

        // * NOTES
        // We can navigate with screens or pages using Navigator. Navigator needs a context. MaterialPageRoute can be used give navigator to the screen.
        //Inkwell is the basically widget like gesturedector but it has the ripple effect that gesturedector doesn't have.
        ```

    - Code for category_meals_screen.dart

        ```dart
        import 'package:flutter/material.dart';

        class CategoryMealsScreen extends StatelessWidget {
          // final String categoryId;
          // final String categoryTitle;

          // CategoryMealsScreen(this.categoryId, this.categoryTitle);

          @override
          Widget build(BuildContext context) {
            final routeArgs =
                ModalRoute.of(context).settings.arguments as Map<String, String>;
            final categoryTitle = routeArgs['title'];
            final categoryId = routeArgs['id'];

        // * IMP
        // ModalRoute can be used to get title and id from the other screen.
        // we can get map the items through variables

            return Scaffold(
              appBar: AppBar(
                title: Text(categoryTitle),
              ),
              body: Center(
                child: Text('The Recipes For The Category'),
              ),
            );
          }
        }
        ```

- ***Dive Deeper into Named Routes***
    - Code for main.dart

        ```dart
        import 'package:flutter/material.dart';
        import 'package:meals_app/categories_screen.dart';
        import 'package:meals_app/category_meals_screen.dart';

        void main() => runApp(MyApp());

        class MyApp extends StatelessWidget {
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
                '/': (ctx) => CategoriesScreen(),
                CategoryMealsScreen.screenName: (ctx) => CategoryMealsScreen(),
              },
        // * NOTES
        // In routes '/' will be the default home page.
        // You can also override it with initialRoute
        // In case of any typos in the routename it will cumbersome to find the bug.
        // So we use a static const variable to use it.

            );
          }
        }

        ```

    - Code for category_meals_screen.dart

        ```dart
        import 'package:flutter/material.dart';

        class CategoryMealsScreen extends StatelessWidget {
          static const screenName = '/category-meals';
        // static const for screenname or routename to for navigating to this page.

          // final String categoryId;
          // final String categoryTitle;

          // CategoryMealsScreen(this.categoryId, this.categoryTitle);

          @override
          Widget build(BuildContext context) {
            final routeArgs =
                ModalRoute.of(context).settings.arguments as Map<String, String>;
            final categoryTitle = routeArgs['title'];
            final categoryId = routeArgs['id'];

            // * IMP
            // ModalRoute can be used to get title and id from the other screen.
            // we can get map the items through variables

            return Scaffold(
              appBar: AppBar(
                title: Text(categoryTitle),
              ),
              body: Center(
                child: Text('The Recipes For The Category'),
              ),
            );
          }
        }
        ```

    - Code for category_item.dart

        ```dart
        // THE CODE THAT IS CHANGED IS MENTIONED 
        void selectCategory(BuildContext ctx) {
        // CHANGING THE PUSHNAMED ARGUMENT TO THE STATIC CONST VARIALBE THAT IS DEFINED IN THE CLASS
            Navigator.of(ctx).pushNamed(CategoryMealsScreen.screenName, arguments: {
              'id': id,
              'title': title,
            });

        ```

- ***Adding a meal model and Data***

    ### Process through this lecture

    - Made a meal model.
    - Made some dummy data for meals model.
    - Code for meals model

        ```dart
        import 'package:flutter/foundation.dart';

        enum Complexity {
          Simple,
          Challenging,
          Hard,
        }

        enum Affordability {
          Affordable,
          Pricey,
          Luxurious,
        }

        class Meal {
          final String id;
          final String title;
          final String imageUrl;
          final List<String> ingredients;
          final List<String> steps;
          final int duration;
          final Complexity complexity;
          final Affordability affordability;
          final bool isGlutenFree;
          final bool isLactoseFree;
          final bool isVegan;
          final bool isVegetarian;

          const Meal({
            @required this.id,
            @required this.title,
            @required this.imageUrl,
            @required this.ingredients,
            @required this.steps,
            @required this.duration,
            @required this.complexity,
            @required this.affordability,
            @required this.isGlutenFree,
            @required this.isLactoseFree,
            @required this.isVegan,
            @required this.isVegetarian,
            List<String> categories,
          });
        }

        // enum is very useful in case of using bool for if checks enum has the . annotation which can be easily used
        // enum numbers for computers that start from 0 to infinity no of items.
        // foundation.dart is minimal package. 
        // Which has the @required annoation
        ```

- ***Selecting Meals for a chosen category***

    In this lecture category_meals_screen.dart is only changed so the notes will on it.

    ```dart
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

    // * NOTES 
    // From dummy_meals data we are iterating it from where keyword.
    // We are returning meals.categories and checking it has contains the categoryId
    // category id is DUMMY_CATEGORIES id value like c1, c2, c3....
    ```

- ***Displaying Recipe item & using network images***

    ### Proccess through this lecture:

    ---

    - Added MealItem widget and added constructor which accept arguments.
    - And In category_meal_screen.dart listview.builder returning mealitem with arguments
    - As iterable list **categoryMeals[index]**  with the properties.
- ***On Generated Routes and unknown routes***

    ```dart
    // THIS FILE IS ALREADY HAS NOTES BUILD INTO IT.

    import 'package:flutter/material.dart';
    import 'package:meals_app/screens/categories_screen.dart';
    import 'package:meals_app/screens/category_meals_screen.dart';
    import 'package:meals_app/screens/meal_detail_screen.dart';

    void main() => runApp(MyApp());

    class MyApp extends StatelessWidget {
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
            '/': (ctx) => CategoriesScreen(),
            CategoryMealsScreen.screenName: (ctx) => CategoryMealsScreen(),
            MealDetailScreen.screenname: (ctx) => MealDetailScreen(),
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
    ```

- ***Replacing Pages (instead of screen)***

    ### PushReplacement:

    ---

    Sometimes you don't want to stack pages on top of another one. cuz i can get cumbersome in memory if you stack pages for that you can .pushReplacement cuz it deletes the old page and add a new one the stack.

    ```dart
    buildListTile(
                'Filters',
                Icons.settings,
                () {
                  Navigator.of(context)
                      .pushReplacementNamed(FiltersScreen.screenName);
                },
              ),
    ```

- ***Popping pages & passing data back***

    ### Passing data back

    ---

    - Code for meal_detail_screen.dart

        ```dart
        floatingActionButton: FloatingActionButton(
                child: Icon(Icons.delete),
                onPressed: () {
                  Navigator.of(context).pop(mealId);
                },
              ),
        ```

    Passing Data by poping the screen. to the meal_items pages 

    - Code for meal_item.dart

        ```dart
        void selectMeal(BuildContext context) {
            Navigator.of(context)
                .pushNamed(
              MealDetailScreen.screenname,
              arguments: id,
            )
                .then((result) {
              print(result);
            });
          }
        ```

    Getting data from meal_detail_screen. We get the data when the meal_detail_screen is popped off.
