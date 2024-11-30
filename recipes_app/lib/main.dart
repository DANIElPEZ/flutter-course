import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:recipes/provider/recipe_provider.dart';
import 'package:recipes/sqlite/sqLite_helper.dart';
import 'views/home.dart';
import 'views/favorites.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL'] ?? '',
      anonKey: dotenv.env['SUPABASE_KEY'] ?? ''
  );
  await DatabaseHelper().database;
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_)=> recipeProvider())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage(), debugShowCheckedModeBanner: false);
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              title: Text('Recipes', style: TextStyle(color: Colors.white)),
              backgroundColor: Color.fromARGB(255, 63, 92, 115),
              bottom: TabBar(
                  indicatorColor: Colors.lightBlueAccent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white70,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.home, color: Colors.white),
                      text: 'Home',
                    ),
                    Tab(
                      icon: Icon(Icons.favorite, color: Colors.white),
                      text: 'Favorites',
                    )
                  ])),
          body: TabBarView(children: [Home(),favorite()])),
    );
  }
}
