import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipes/model/recipe_model.dart';
import 'package:recipes/provider/recipe_provider.dart';

class RecipeDetail extends StatefulWidget {
  RecipeDetail({super.key, required this.recipe});

  final Recipe recipe;

  @override
  recipeDetail createState() => recipeDetail();
}

class recipeDetail extends State<RecipeDetail>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    //control the time
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    //the animation
    scaleAnimation = Tween<double>(begin: 1.0, end: 1.5)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
  }

  //finish the animation
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recipe = widget.recipe;
    final int id = recipe.id;
    final String name = recipe.name;
    final String author = recipe.author;
    final String urlImg = recipe.img;
    final String description = recipe.description;

    return Consumer<recipeProvider>(builder: (context, provider, child) {
      return Scaffold(
          appBar: AppBar(
              title: Text(name,
                  style: GoogleFonts.quicksand(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white)),
              backgroundColor: Color.fromARGB(255, 63, 92, 115),
              leading: IconButton(
                  onPressed: () {
                    provider.getMyRecipes();
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white),
              actions: [
                IconButton(
                    onPressed: () {
                      if (provider.isAdded) {
                        provider.deleteMyRecipe(id);
                      } else {
                        provider.addFavorite(recipe);
                      }
                    },
                    icon: ScaleTransition(
                        scale: scaleAnimation,
                        child: Icon(
                            provider.isAdded
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: Colors.red)))
              ]),
          body: Center(
            child: Container(
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(154, 0, 0, 0),
                          spreadRadius: 2,
                          blurRadius: 70,
                          offset: Offset(0, 3))
                    ]),
                margin:
                    EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 50),
                padding:
                    EdgeInsets.only(top: 30, left: 12, right: 12, bottom: 20),
                child: Center(
                  child: Container(
                    width: 260,
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              urlImg,
                              fit: BoxFit.cover,
                              width: 300,
                            )),
                        SizedBox(height: 14),
                        Text('Author: $author',
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 18)),
                        SizedBox(height: 14),
                        Expanded(
                          child: SingleChildScrollView(
                              child: Text(
                            description,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.justify,
                          )),
                        )
                      ],
                    ),
                  ),
                )),
          ));
    });
  }
}
