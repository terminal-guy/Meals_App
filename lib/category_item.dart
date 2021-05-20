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
