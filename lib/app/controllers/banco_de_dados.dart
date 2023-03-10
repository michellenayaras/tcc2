import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  Future<Database> createDatabase() async {
    String path = join(await getDatabasesPath(), "study_database.db");
    Database db = await openDatabase(
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
        await insertLesoesIntroducao(db);
        await insertLesoesTamanho(db);
        await insertLesoesEtiologia(db);
        await insertLesoesEvolucao(db);
        await insertLesoesInfeccao(db);
        await insertLesoesComprometimentoTecidual(db);
        await insertLesoesTiposFeridas(db);
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertLesoesIntroducao(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Lesões de pele',
        'content':
            'A pele é o maior órgão do corpo humano e merece cuidado principalmente pelo fato do aumento da expectativa de vida, ela torna-se mais suscetível devido a maior prevalência de doenças não transmissíveis e fatores de risco que podem favorecer o surgimento de lesões de pele.Lesão cutânea também denominada como ferida  cutânea,  lesão  ou ferida, é caracterizada pelo rompimento da integridade tecidual, resultando em alterações nas funções anatômicas e fisiológicas dos tecidos comprometidos. As feridas são causadas basicamente por pressão (restrição de mobilidade transitória ou permanente); isquemia (insuficiência vascular arterial ou venosa); traumas; cirurgias e neuropatias diabéticas. Além da etiologia citada anteriormente, as feridas podem ser classificadas por complexidade e tempo de reparação tecidual.'
        // 'image': yourImageBytes
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertLesoesTamanho(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Medição de lesões de pele',
        'content':
            'A medida da lesão pode ser feita de forma linear das  maiores  extensões,  na  vertical  (comprimento da ferida) e na horizontal (largura da ferida) passando dois traços de modo a formar um ângulo de 90°. Outra forma de medir é a planimetria utilizando um papel transparente estéril quadriculado para desenhar o contorno da lesão seguindo as bordas.',
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertLesoesEtiologia(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Etiologia',
        'content':
            'Etiologia é o estudo das causas ou origens de uma doença ou problema de saúde, que busca identificar os diferentes fatores que contribuem para o seu desenvolvimento, incluindo fatores genéticos, ambientais, comportamentais e sociais.',
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertLesoesEvolucao(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Evolução',
        'content':
            'A evolução de uma ferida se refere às mudanças que ocorrem na lesão ao longo do tempo, desde o momento em que a ferida é causada até o processo de cicatrização estar completo.\nA evolução das feridas é influenciada por vários fatores, como a gravidade da lesão, a idade e o estado de saúde do paciente, bem como os cuidados e tratamentos recebidos.',
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertLesoesInfeccao(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Presença de infecção',
        'content':
            'A presença de infecção em uma ferida ocorre quando há entrada de bactérias, fungos ou outros microrganismos na lesão, resultando em sintomas como vermelhidão, inchaço, dor e secreção com odor desagradável. A infecção em uma ferida pode retardar a cicatrização e levar a complicações.',
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertLesoesComprometimentoTecidual(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Comprometimento tecidual',
        'content':
            'O comprometimento tecidual em uma ferida se refere à extensão do dano causado aos tecidos ao redor da lesão. Feridas que causam danos mais profundos e extensos, como as úlceras por pressão em estágios avançados ou as feridas que atingem camadas mais profundas da pele, podem apresentar um maior comprometimento tecidual. Isso pode resultar em uma cicatrização mais lenta e em um risco maior de complicações, como infecções e necrose (morte do tecido).',
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertLesoesTiposFeridas(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Tipos de feridas',
        'content':
            'Feridas são lesões no tecido do corpo que podem ser causadas por diversos fatores, como traumas, cortes, queimaduras e pressão prolongada. Existem vários tipos de feridas, cada uma com suas próprias características e necessidades de tratamento.',
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getData(String title) async {
    final Database db = await createDatabase();
    return await db.query('study', where: 'title = ?', whereArgs: [title]);
  }
}
