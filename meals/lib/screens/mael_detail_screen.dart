import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(this.onToggleFavorite, this.isFavorite, {super.key});

  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) isFavorite;


  _createSectionTitle(BuildContext context, String title) {
    return Container(
            margin: EdgeInsets.symmetric(vertical: 10,),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
  }

  Widget _createSectionContainer(Widget child) {
        return Container(
            width: 330,
            height: 250,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 241, 238, 147),
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: child,
          );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(meal.title, style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.ingredients[index]),
                    ),
                  );
                },
                ),
            ),
            _createSectionTitle(context, 'Passos'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors. pink,
                          child: Text('${index + 1}'),
                        ),
                        title: Text(meal.steps[index]),
                      ),
                      Divider(color: Colors.grey,),
                    ],
                  );
                },
                ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: Icon(isFavorite(meal) ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          onToggleFavorite(meal);
        },

        ),
    );
  }
}