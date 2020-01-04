import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoriesMealsScreen extends StatefulWidget {
  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;

      final categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      final displayedMeals = DUMMY_MEALS
          .where((meal) => meal.categories.contains(categoryId))
          .toList();

      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return MealItem(
              id: displayedMeals[i].id,
              title: displayedMeals[i].title,
              imageUrl: displayedMeals[i].imageUrl,
              duration: displayedMeals[i].duration,
              affordability: displayedMeals[i].affordability,
              complexity: displayedMeals[i].complexity,
              removeItem: _removeMeal);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
