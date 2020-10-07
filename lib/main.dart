import 'package:flutter/material.dart';
import 'dummy_data .dart';
import 'models/meal.dart';
import 'screens/category_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_details_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/filters_Screen.dart';

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
  List<Meal> _favoriteMeals = [];

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
          primarySwatch: Colors.green,
          accentColor: Colors.deepPurpleAccent,
          canvasColor: Colors.white70,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                  // ignore: deprecated_member_use
                  body1: TextStyle(
                // ignore: deprecated_member_use
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            // ignore: deprecated_member_use
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            // ignore: deprecated_member_use
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'Robotocondensed',
            ),
          )),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(),
        //'/' represent the home page of application so if we use tab
        //then tabscreen must be that home page and remember
        //to remove scafold from those page as it brings its own to the page
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetails.routeName: (ctx) => MealDetails(),
        FilterScreen.routeName:(ctx) => FilterScreen(_filters, _setFilters),
      },
    );
  }
}
