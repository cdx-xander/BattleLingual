import 'package:battlelingual/features/characters/data/character_data.dart';
import 'package:battlelingual/features/characters/models/character_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class StorageService {
  static final StorageService instance = StorageService._init();
  static Database? _database;

  StorageService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('battlelingual.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE characters (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        image_path TEXT NOT NULL,
        health INTEGER NOT NULL,
        max_health INTEGER NOT NULL,
        defense INTEGER NOT NULL,
        max_defense INTEGER NOT NULL,
        attack INTEGER NOT NULL,
        max_attack INTEGER NOT NULL,
        is_unlocked INTEGER NOT NULL
      )
    ''');

    for (final character in CharacterData.initialCharacters) {
      await db.insert('characters', character.toMap());
    }
  }

  Future<List<CharacterModel>> getAllCharacters() async {
    final db = await instance.database;
    final result = await db.query('characters', orderBy: 'id ASC');
    return result.map((json) => CharacterModel.fromMap(json)).toList();
  }

  Future<int> updateCharacter(CharacterModel character) async {
    final db = await instance.database;
    return await db.update(
      'characters',
      character.toMap(),
      where: 'id = ?',
      whereArgs: [character.id],
    );
  }
}
