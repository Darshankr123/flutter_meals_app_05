import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app_05/models/meals.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14.0),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            ...meal.ingredients
                .map(
                  (ingredient) => Text(
                    ingredient,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                )
                .toList(),
            const SizedBox(height: 24.0),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),
            ...meal.steps
                .map(
                  (step) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Text(
                      step,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
