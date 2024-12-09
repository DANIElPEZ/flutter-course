import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

//Setup
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => appState(),
        child: MaterialApp(
            title: 'First app',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Color.fromARGB(255, 77, 184, 202)),
              useMaterial3: true,
            ),
            home: IndexPage(),
            debugShowCheckedModeBanner: false));
  }
}

//Provider
class appState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

//main page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var setState = context.watch<appState>();
    var pair = setState.current;

    IconData icon;
    if(setState.favorites.contains(pair)){
      icon=Icons.favorite;
    }else{
      icon=Icons.favorite_border;
    }

    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('App basics'),
        BigCard(pair: pair),
        SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
                onPressed: (){
                  setState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
                onPressed: () {
                  setState.getNext();
                },
                child: Text('Next')),
          ],
        )
      ],
    )));
  }
}

class LikePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var setState=context.watch<appState>();

    if (setState.favorites.isEmpty){
      return Center(
        child: Text('No favorites yet')
      );
    }

    return ListView(
      children: [
        Padding(
            padding: EdgeInsets.all(20),
          child: Text('You have ${setState.favorites.length} favorites :v'),
        ),
        for (var pair in setState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase)
          )
      ]
    );
  }
}

//index page
class IndexPage extends StatefulWidget{
  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  var selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    Widget? page;
    switch(selectedIndex){
      case 0:
        page=HomePage();
        break;
      case 1:
        page=LikePage();
        break;
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          body: Row(
              children: [
                SafeArea(
                    child: NavigationRail(
                        extended: constraints.maxWidth >= 600,
                        destinations: [
                          NavigationRailDestination(
                              icon: Icon(Icons.home),
                              label: Text('Home')
                          ),
                          NavigationRailDestination(
                              icon: Icon(Icons.favorite),
                              label: Text('Favorite')
                          )
                        ],
                        selectedIndex: selectedIndex,
                        onDestinationSelected: (value){
                          setState(() {
                            selectedIndex=value;
                          });
                        }
                    )
                ),
                Expanded(
                    child: Container(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        child: page
                    )
                )
              ]
          )
      );
    });
  }
}

//other classes
class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.pair});

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final styletext = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.onPrimary);

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          style: styletext,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
