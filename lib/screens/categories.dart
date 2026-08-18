import 'package:flutter/material.dart';
import 'package:meals_app_05/data/dummy_data.dart';
import 'package:meals_app_05/models/category.dart';
import 'package:meals_app_05/models/meals.dart';
import 'package:meals_app_05/screens/meals.dart';
import 'package:meals_app_05/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,required this.onToggleFavorite});

  final void Function(Meal meal) onToggleFavorite;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    // print(meals);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(meals: filteredMeals, title: category.title,onAddFavorite: onToggleFavorite,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          ...availableCategories
              .map(
                (category) => CategoryGridItem(
                  category: category,
                  onSelectCategory: (Category category) {
                    _selectCategory(context, category);
                  },
                ),
              )
              .toList(),
        ],
      );
  }
}
