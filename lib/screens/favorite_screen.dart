import 'package:delimeals/models/meal.dart';
import 'package:delimeals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorite yet - start adding some!'),
      );
    } else {
      return Scaffold(
        body: ListView.builder (
            itemCount: favoriteMeals.length,
            itemBuilder: (context, index) {
              return MealItem(
                id: favoriteMeals[index].id,
                title: favoriteMeals[index].title,
                duration: favoriteMeals[index].duration,
                complexity: favoriteMeals[index].complexity,
                affordability: favoriteMeals[index].affordability,
                imageUrl: favoriteMeals[index].imageUrl,
              );
            }),
        );
    }

  }
}

