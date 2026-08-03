import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app_05/data/dummy_data.dart';
import 'package:meals_app_05/models/category.dart';
import 'package:meals_app_05/models/meals.dart';
import 'package:meals_app_05/screens/meals.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onToggleFavorite,
  });

  final Category category;

  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    final List<Meal> filterMeal = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => MealsScreen(
              meals: filterMeal,
              title: category.title,
              onToggleFavorite: onToggleFavorite,
            ),
          ),
        );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withValues(alpha: 0.55),
              category.color.withValues(alpha: 0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
