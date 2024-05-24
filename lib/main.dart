import 'package:abhishek_jha_flutter_project/views/home.dart';
import 'package:flutter/material.dart';

import 'models/api.dart';
import 'models/recipe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FOOD APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        // textTheme: TextTheme(
        //   bodyText2: TextStyle(color: Colors.white),
        // ),

      ),
      home:  HomePage(isLoading: _isLoading, recipes: _recipes),

    );
  }
}
