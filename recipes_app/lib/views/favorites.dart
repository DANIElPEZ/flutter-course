import 'package:flutter/material.dart';
import 'package:recipes/provider/recipe_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes/components/recipe_card.dart';

class favorite extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<recipeProvider>(context, listen: false).getMyRecipes();
    });

    return Scaffold(
      body: Consumer<recipeProvider>(
          builder: (context, provider, child) {
            if(provider.isLoading){
              return Center(child: CircularProgressIndicator());
            }else if (provider.myRecipes.isEmpty) {
              return Center(
                child: Text('No recipes found.',
                    style: GoogleFonts.kanit(
                        fontSize: 18, color: Colors.blueGrey)),
              );
            } else {
              final recipes = provider.myRecipes;
              return ListView.builder(
                  itemCount: recipes!.length,
                  itemBuilder: (context, index) {
                    return recipeCard(recipe: recipes[index]);
                  });
            }
          })
    );
  }
}