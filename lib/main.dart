import 'package:delimeals/meal_data.dart';
import 'package:delimeals/models/meal.dart';
import 'package:delimeals/screens/Filter_screen.dart';
import 'package:delimeals/screens/category_meals_screen.dart';
import 'package:delimeals/screens/meal_detail_screen.dart';
import 'package:delimeals/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lastose': false,
    'vegetarian': false,
    'vegan': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
          if (_filters['gluten'] && !meal.isGlutenFree) {
            return false;
          }
          if (_filters['lastose'] && !meal.isLactoseFree) {
            return false;
          }
          if (_filters['vegetarian'] && !meal.isVegetarian) {
            return false;
          }
          if (_filters['vegan'] && !meal.isVegan) {
            return false;
          }
          return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delimeals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          headline6: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          )
        )
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.route: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.route: (ctx) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FilterScreen.route: (ctx) => FilterScreen(_setFilter, _filters),
      },
      onGenerateRoute: (settings) {

      },
      onUnknownRoute: (settings) {

      },
    );
  }
}

