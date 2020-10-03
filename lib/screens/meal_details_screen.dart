import 'package:flutter/material.dart';
class MealDetails extends StatelessWidget {
  static const routeName = '/meal_detail';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    //the argument here use is the argument from meal item select
    //meal method which is use for navigation pushnamed
    return Scaffold(
      appBar: AppBar(title: Text('$mealId',),),
      body: Center(
        child: Text('The meal - $mealId'),
      ) ,);
  }
}
