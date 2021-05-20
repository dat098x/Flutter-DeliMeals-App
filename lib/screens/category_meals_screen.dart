import 'package:delimeals/meal_data.dart';
import 'package:delimeals/models/meal.dart';
import 'package:delimeals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const route = '/category_meal';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryId;
  String categoryTitle;
  List<Meal> displayedMeals;

  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement initState
    if (!_loadedInitData){
      final mealArgument = ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      categoryId = mealArgument['id'];
      categoryTitle = mealArgument['title'];
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
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
      body: ListView.builder (
        itemCount: displayedMeals.length,
          itemBuilder: (context, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              imageUrl: displayedMeals[index].imageUrl,
              removeItem: removeMeal,
            );
          }),
    );
  }
}
