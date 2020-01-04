import 'package:flutter/material.dart';
import 'package:third_app/screens/filters_screen.dart';
import 'package:third_app/screens/meal_detail_screen.dart';
import 'package:third_app/screens/tabs_screen.dart';

import './screens/categories_screen.dart';
import './screens/categories_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            title: TextStyle(
              fontSize: 16,
              fontFamily: 'RobotoCondensed',
              // fontWeight: FontWeight.w300
            )),
      ),
      // home: CategoriesScreen(),
      home: TabsScreen(),
      routes: {
        '/categories': (ctx) => CategoriesMealsScreen(),
        '/meal': (ctx) => MealDetailsScreen(),
        '/filters': (ctx) => FiltersScreen(),
      },
    );
  }
}
