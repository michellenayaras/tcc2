// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  // armazena a instância do banco de dados
  static Database? _database;

  // nome do arquivo do banco de dados
  static const _databaseName = 'study_database.db';

  // versão do banco de dados
  static const _databaseVersion = 1;

  // construtor privado
  MyDatabase._();

  // retorna a instância do banco de dados
  Future<Database> createDatabase() async {
    String path = join(await getDatabasesPath(), "study_database.db");
    return await openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE study(
          id INTEGER PRIMARY KEY,
          title TEXT,
          content TEXT,
          image BLOB
        )
      ''');
      },
      version: 1,
    );
  }

  // função para inserir dados no banco de dados
  Future<void> insertData() async {
    final Database db = await createDatabase();

    await db.insert(
      'study',
      {
        'title': 'Estudo sobre programação',
        'content': 'Conteúdo sobre programação em geral',
        //'image': yourImageBytes
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //função para recuperar os dados do banco de dados
  Future<List<Map<String, dynamic>>> getData() async {
    final Database db = await createDatabase();

    return await db.query('study');
  }
}
