import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vamos Cozinhar?'),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorColor: Theme.of(context).colorScheme.secondary,
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categorias',
                ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favoritos',
                ),
            ],
            ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoriteScreen(),
          ]
          ),
      ),
    );
  }
}