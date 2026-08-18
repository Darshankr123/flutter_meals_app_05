import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app_05/data/dummy_data.dart';
import 'package:meals_app_05/models/meals.dart';
import 'package:meals_app_05/screens/categories.dart';
import 'package:meals_app_05/screens/meals.dart';
import 'package:meals_app_05/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final List<Meal> _favoriteList = [];

  void _toggleMealFavoriteStatus(Meal meal) {
    final bool isExisting = _favoriteList.contains(meal);

    if (isExisting) {
      setState(() {
        _favoriteList.remove(meal);
      });
      _showInfMessage("Meal is no longer a favorite.");
    } else {
      setState(() {
        _favoriteList.add(meal);
      });
      _showInfMessage("Marked as favorite");
    }

    print(_favoriteList);
  }

  void _showInfMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(  SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleMealFavoriteStatus,
    );
    String activePageTitle = "Categories";

    if (_selectedPageIndex == 1) {
      print(_favoriteList);
      activePage = MealsScreen(
        meals: _favoriteList,
        onAddFavorite: _toggleMealFavoriteStatus,
      );
      activePageTitle = "Favorites";
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectPage(index);
        },
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
      ),
    );
  }
}
