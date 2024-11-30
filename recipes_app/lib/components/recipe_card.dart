import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes/views/recipe_detail.dart';
import 'package:recipes/provider/recipe_provider.dart';
import 'package:provider/provider.dart';
import 'package:recipes/model/recipe_model.dart';


class recipeCard extends StatelessWidget{
  recipeCard({required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final String name = recipe.name;
    final String author = recipe.author;
    final String urlImg = recipe.img;

    return GestureDetector(
      onTap: () {
        context.read<recipeProvider>().myRecipeIsAdded(recipe);

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RecipeDetail(recipe: recipe)));
      },
      child: Padding(
          padding: EdgeInsets.all(12),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 125,
            child: Card(
                color: Colors.blueAccent,
                child: Row(children: [
                  Container(
                      height: 125,
                      width: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(urlImg, fit: BoxFit.cover))),
                  SizedBox(width: 20),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                            style: GoogleFonts.lora(
                                color: Colors.white, fontSize: 20)),
                        Container(height: 2, width: 220, color: Colors.white),
                        SizedBox(
                          height: 4,
                        ),
                        Text(author,
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 18))
                      ])
                ])),
          )),
    );
  }
}