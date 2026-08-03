import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app_05/models/meals.dart';
import 'package:meals_app_05/screens/meal_detail_screen.dart';
import 'package:meals_app_05/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, this.title,required this.onToggleFavorite});

  final List<Meal> meals;
  final String? title;
  final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) =>
            MealDetailScreen(meal: meal, onToggleFavorite: onToggleFavorite),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        children: [
          Text(
            "Uh oh ... nothing here!",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Try selecting a diffrent category!",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: meals[index], onSelectMeal: selectMeal);
        },
      );
      ;
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!), centerTitle: true),
      body: content,
    );
  }
}
