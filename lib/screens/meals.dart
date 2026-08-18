import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app_05/models/meals.dart';
import 'package:meals_app_05/screens/meal_detail_screen.dart';
import 'package:meals_app_05/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, this.title,required this.onAddFavorite});

  final List<Meal> meals;
  final String? title;
  final void Function(Meal meal) onAddFavorite;

  void selectMeal(BuildContext context, Meal meal) {
    // Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal,onToggleFavorite: onAddFavorite,)),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(meals.length);
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Text("Uh oh .. nothing here!",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),),
          const SizedBox(height: 20),
          Text(
            "Try selecting different category!",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) =>
            MealItem(meal: meals[index], onSelectMeal: selectMeal,),
      );
    }

    if (title == null){
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      body: content,
    );
  }
}
