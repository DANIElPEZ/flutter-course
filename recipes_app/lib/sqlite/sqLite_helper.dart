import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  // Inicializa la base de datos
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  // Abre o crea la base de datos
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'MyRecipes.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute(
          '''
      CREATE TABLE IF NOT EXISTS favorites_recipes (
        id INTEGER PRIMARY KEY,
        name TEXT,
        author TEXT,
        img TEXT,
        description TEXT
      )
    '''
      );
    },
        onOpen: (db) {
          db.execute(
              '''
      CREATE TABLE IF NOT EXISTS favorites_recipes (
        id INTEGER PRIMARY KEY,
        name TEXT,
        author TEXT,
        img TEXT,
        description TEXT
      )
      '''
          );
        });
  }

  // Inserta una nueva receta
  Future<void> insertRecipe(Map<String, dynamic> recipe) async {
    final db = await database;
    await db.insert(
      'favorites_recipes',
      recipe,
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  // Consulta todas las recetas
  Future<List<Map<String, dynamic>>> getRecipes() async {
    final db = await database;
    return await db.query('favorites_recipes');
  }

  // Elimina una receta por su id
  Future<void> deleteRecipe(int id) async {
    final db = await database;
    await db.delete(
      'favorites_recipes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Obtener receta por ID
  Future<List<Map<String, dynamic>>> getRecipeById(int id) async {
    final db = await database;
    return await db.query(
      'favorites_recipes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
