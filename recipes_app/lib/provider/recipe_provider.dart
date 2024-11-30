import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:recipes/model/recipe_model.dart';
import 'package:recipes/sqlite/sqLite_helper.dart';

class recipeProvider extends ChangeNotifier {
  DatabaseHelper dbHelper = DatabaseHelper();
  bool isLoading = false;
  bool isAdded = false;
  List<Recipe> recipes = [];
  List<Recipe> myRecipes = [];

  //supabase get cloud recipes
  Future<void> fetchRecipes() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await Supabase.instance.client.from('recipes').select();
      recipes =
          List<Recipe>.from(response.map((recipe) => Recipe.fromJSON(recipe)));
    } catch (e) {
      print('Error fetching recipes: $e');
      recipes = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  //supabase insert new recipe
  Future<void> insertRecipe(newRecipe) async {
    try {
      await Supabase.instance.client.from('recipes').insert(newRecipe);
    } catch (e) {
      print(e);
    }
  }

  //sqlite add to favorites
  Future<void> addFavorite(Recipe myRecipe) async {
    try {
      List<Map<String, dynamic>> isExist =
          await dbHelper.getRecipeById(myRecipe.id);

      if (isExist.isEmpty) {
        Map<String, dynamic> recipe = {
          'id': myRecipe.id,
          'name': myRecipe.name,
          'author': myRecipe.author,
          'img': myRecipe.img,
          'description': myRecipe.description
        };

        await dbHelper.insertRecipe(recipe);
        isAdded=true;
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  //sqlite check if the recipe is added
  Future<void> myRecipeIsAdded(Recipe myRecipe) async {
    try {
      List<Map<String, dynamic>> isExist =
          await dbHelper.getRecipeById(myRecipe.id);

      if (isExist.isNotEmpty) {
        isAdded = true;
      } else {
        isAdded = false;
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  //sqlite load my recipes
  Future<void> getMyRecipes() async {
    isLoading=true;
    notifyListeners();
    try {
      List<Map<String, dynamic>> data = await dbHelper.getRecipes();
      myRecipes =
          data.map((recipeData) => Recipe.fromJSON(recipeData)).toList();
    } catch (e) {
      print(e);
    }finally{
      isLoading=false;
      notifyListeners();
    }
  }

  //sqlite delete my recipe
  Future<void> deleteMyRecipe(int id) async {
    try {
      await dbHelper.deleteRecipe(id);
      isAdded=false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
