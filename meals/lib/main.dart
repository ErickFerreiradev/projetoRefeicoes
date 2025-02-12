import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';
import 'screens/mael_detail_screen.dart';
import 'screens/tabs_screen.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
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
        AppRoutes.home: (ctx) => TabsScreen(),
        AppRoutes.categories_meals: (ctx) => CategoriesMealsScreen(),
        AppRoutes.meal_detail: (ctx) => MealDetailScreen(),
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
