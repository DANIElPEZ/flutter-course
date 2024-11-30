import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes/provider/recipe_provider.dart';
import 'package:provider/provider.dart';
import 'package:recipes/components/recipe_card.dart';

class Home extends StatefulWidget{
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final recipe_provider = Provider.of<recipeProvider>(context, listen: false);
      recipe_provider.fetchRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Consumer<recipeProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (provider.recipes.isEmpty) {
                return Center(
                  child: Text('No recipes found.',
                      style: GoogleFonts.kanit(
                          fontSize: 18, color: Colors.blueGrey)),
                );
              } else {
                final recipes = provider.recipes;
                return ListView.builder(
                    itemCount: recipes!.length,
                    itemBuilder: (context, index) {
                      return recipeCard(recipe: recipes[index]);
                    });
              }
            }),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              addRecipeModal(context);
            }));
  }

  Future<void> addRecipeModal(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Add New Recipe',
                  style:
                      GoogleFonts.kanit(fontSize: 24, color: Colors.blueGrey)),
              content: SingleChildScrollView(child: RecipeModalForm()),
            ));
  }


}

class RecipeModalForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>(); //similar a useState de react

    final TextEditingController recipeNameField = TextEditingController();
    final TextEditingController recipeAuthorField = TextEditingController();
    final TextEditingController recipeImgUrlField = TextEditingController();
    final TextEditingController recipeDescriptionField =
        TextEditingController();

    return Padding(
      padding: EdgeInsets.all(12),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              label: 'Recipe Name',
              controller: recipeNameField,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the name';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            CustomTextField(
              label: 'Author',
              controller: recipeAuthorField,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the author';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            CustomTextField(
              label: 'Image URL',
              controller: recipeImgUrlField,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the recipe image url';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            CustomTextField(
              label: 'Recipe',
              controller: recipeDescriptionField,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the description';
                }
                return null;
              },
              lines: 4,
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    final Map newRecipe = {
                      'name': recipeNameField.text,
                      'author': recipeAuthorField.text,
                      'img': recipeImgUrlField.text,
                      'description': recipeDescriptionField.text,
                    };

                    final recipe_provider = Provider.of<recipeProvider>(context, listen: false);
                    recipe_provider.insertRecipe(newRecipe);
                    Navigator.pop(context);
                  }
                },
                child: Text('Save Recipe',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CustomTextField(
      {required String label,
      required TextEditingController controller,
      required String? Function(String?) validator,
      int lines = 1}) {
    return TextFormField(
        controller: controller,
        validator: validator,
        maxLines: lines,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: GoogleFonts.quicksand(color: Colors.blue),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1),
                borderRadius: BorderRadius.circular(10))));
  }
}
