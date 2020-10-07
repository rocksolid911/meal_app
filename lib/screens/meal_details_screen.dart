import 'package:flutter/material.dart';
import '../dummy_data .dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/meal_detail';
  final Function toggleFavorite;
  final Function isFavorite;
  MealDetails(this.toggleFavorite,this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    //the argument here use is the argument from meal item select
    //meal method which is use for navigation pushnamed
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${selectMeal.title}',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                selectMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'ingredients',
                // ignore: deprecated_member_use
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 200,
              width: 300,
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        selectMeal.steps[index],
                      ),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
         isFavorite(mealId) ? Icons.thumb_up : Icons.thumb_up_outlined,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
