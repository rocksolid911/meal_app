import 'package:flutter/material.dart';
import 'screens/category_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_details_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/filters_Screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetails.routeName: (ctx) => MealDetails(),
        FilterScreen.routeName:(ctx) => FilterScreen(),
      },
    );
  }
}
