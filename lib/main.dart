import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/screens/filters_screen.dart';
import 'package:flutter_complete_guide/screens/meal_detail_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import './screens/tabs_screen.dart';

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

  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  void _setfilters(Map<String, bool> filterDAta) {
    setState(() {
      _filters = filterDAta;
      _availableMeal = DUMMY_MEALS.where((meal) {
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

  void _toggleFavorites(mealId) {
    final existtingIndex =
        _favoriteMeal.indexWhere((element) => element.id == mealId);
    if (existtingIndex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(existtingIndex);
      });
    } else {
      setState(() {
        _favoriteMeal
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isfav(String id) {
    return _favoriteMeal.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              subtitle1: TextStyle(
                fontSize: 19,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeal),
        '/category-meals': (ctx) => CategoryMealsScreen(_availableMeal),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavorites, _isfav),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setfilters),
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
      },
    );
  }
}

// flutter build apk --build-name=1.0.1 --build-number=1
