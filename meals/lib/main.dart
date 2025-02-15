import 'package:flutter/material.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/settings_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/mael_detail_screen.dart';
import 'screens/tabs_screen.dart';

import 'utils/app_routes.dart';

import 'models/meal.dart';
import 'data/dummy_data.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  Settings settings = Settings();
  List<Meal> _avalibeMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _avalibeMeals = dummyMeals.where((meal){
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.white, 
          secondary: Colors.amber,
        ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.pink,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'RobotoCondensed',
          fontSize: 20,
          ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
        fontFamily: 'Raleway',
        canvasColor: const Color.fromARGB(255, 241, 238, 147),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.home: (ctx) => TabsScreen(_favoriteMeals),
        AppRoutes.categories_meals: (ctx) => CategoriesMealsScreen(_avalibeMeals),
        AppRoutes.meal_detail: (ctx) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.settings: (ctx) => SettingsScreen(settings, _filterMeals),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) {
            return CategoriesScreen();
          }
          );
      },
    );
  }
}
