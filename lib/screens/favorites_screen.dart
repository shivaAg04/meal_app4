import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  List<Meal> favoriteMeal;
  FavoriteScreen(this.favoriteMeal);
  @override
  Widget build(BuildContext context) {
    List<Meal> categoryMeals = favoriteMeal;
    if (favoriteMeal.isEmpty) {
      return Center(
        child: Text('first add some favorites'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: categoryMeals[index].id,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              imageUrl: categoryMeals[index].imageUrl,
              title: categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      );
    }
  }
}
