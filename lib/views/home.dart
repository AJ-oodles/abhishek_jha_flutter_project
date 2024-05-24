import 'package:flutter/material.dart';
import 'package:abhishek_jha_flutter_project/views/widgets/recipe_card.dart';
import 'package:abhishek_jha_flutter_project/models/recipe.dart'; // Assuming Recipe class is in this path

class HomePage extends StatelessWidget {
  final bool isLoading;
  final List<Recipe> recipes;

  HomePage({required this.isLoading, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('Food Recipes'),
          ],
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return RecipeCard(
            title: recipes[index].name,
            cookTime: recipes[index].totalTime,
            rating: recipes[index].rating.toString(),
            thumbnailUrl: recipes[index].image,
          );
        },
      ),
    );
  }
}
