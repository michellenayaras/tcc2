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
        await insertTecidoAnatomiaFisiologia(db);
        await insertTecidoFuncoesPele(db);
        await insertTecidoEpitelial(db);
        await insertTecidoConjuntivo(db);
        await insertTecidoMuscular(db);
        await insertTecidoNervoso(db);
        await insertCurativoMateriaisNecessarios(db);
        await insertCurativoTecnicasCurativos(db);
        await insertCurativoTiposCoberturas(db);
        await insertCurativoEtapasExecucao(db);
        await insertCurativoAnotacaoenfermagem(db);
        await insertCurativoTiposCurativos(db);
        await insertCicatrizacaoTiposFeridas(db);
        await insertCicatrizacaoFasesFeridas(db);
        await insertCicatrizacaoFormasCicatrizacao(db);
        await insertSecrecoesTransudato(db);
        await insertSecrecoesExsudato(db);
        await insertSecrecoesExsudatoSeroso(db);
        await insertSecrecoesExsudatoSanguinolento(db);
        await insertSecrecoesExsudatoPurulento(db);
        await insertSecrecoesExsudatoFibrinoso(db);
        await insertTratamentoBotaUna(db);
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

  Future<void> insertTecidoAnatomiaFisiologia(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Anatomia e fisiologia da pele',
        'content':
            'Epiderme (1ª camada) É a camada mais externa da pele e consiste primariamente em queratinócitos, que a impermeabilizam. A epiderme está em constante renovação, as células mais antigas são substituídas por outras mais novas em uma renovação que ocorre em média a cada 12 dias.Derme (2ª camada)Localizada entre a epiderme e a hipoderme, a derme é formada por tecido conjuntivo que contém fibras protéicas, vasos sanguíneos e linfáticos, terminações nervosas, órgãos sensoriais e glândulas. As fibras são produzidas por células chamadas fibroblastos, que permitem a elasticidade, tração e conferem maior resistência à pele.Hipoderme (3ª camada) A última camada da pele é basicamente formada por células de gordura e faz conexão entre a derme e a fáscia muscular; atuando como reservatório energético, isolante térmico, proteção contra choques mecânicos, fixação dos órgãos e modelando a superfície corporal.'

        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertTecidoFuncoesPele(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Funções da pele',
        'content':
            '- Força e elasticidade\n- Regeneração\n- Resiste à perda de água e eletrólitos\n- Responsável pela produção de Vitamina D\n- Secreção e Excreção\n- Protege contra agentes químicos, físicos e biológicos\n- Recebe estímulos sensoriais externos- Armazenagem de nutrientes (lipídios, água, vitaminas etc)\n- Imunorregulação\n- Promove estímulo visual, olfatório e tátil'

        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertTecidoEpitelial(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Tecido epitelial',
        'content':
            'Tecido formado por células justapostas e uma pequena quantidade de matriz extracelular. Uma de suas funções é revestir a superfície do corpo e algumas cavidades. Esse tecido é responsável também pela formação das diversas glândulas presentes em nosso corpo.'

        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertTecidoConjuntivo(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Tecido conjuntivo',
        'content':
            'É um tecido de ligação que atua na sustentação e preenchimento das estruturas do corpo, além do transporte de substâncias, pode ser classificado de acordo com o material e o tipo de células que o compõem, cujas funções são determinadas.Tecido Conjuntivo propriamente dito (frouxo ou denso): sua matriz extracelular é abundante e rica em fibras colágenas, reticulares e elásticas, além de moléculas que atuam no papel de nutrir outros tecidos. Estão presentes diversos tipos de células, tais como: fibroblastos, macrófagos, linfócitos, adipócitos, entre outras.Tecido Hematopoiético: também denominado hemocitopoiético, é responsável pela formação das células sanguíneas e componentes do sangue. Está presente na medula óssea, no interior de alguns ossos.Tecido Cartilaginoso: composto especialmente por fibras colágenas, esse é o tecido que compõe as cartilagens. Ajuda a dar sustentação e absorve impactos nos ossos.Tecido Adiposo: constituído de adipócitos, esse tecido atua como isolante térmico e como reserva de energia.Tecido Ósseo: tecido rico em fibras colágenas e minerais que o tornam rígido, atuando na sustentação do corpo.'

        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertTecidoMuscular(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Tecido muscular',
        'content':
            'Esse tecido apresenta células alongadas com incrível capacidade de contração, esse tipo de tecido está ligado à nossa locomoção e alimentação, além de garantir que as células do corpo recebam nutrientes e oxigênio. Tecido muscular estriado esquelético: Apresenta células longas, cilíndricas e com vários núcleos, os quais estão localizados na periferia delas. Como o nome sugere, esse tecido apresenta estriações, sendo elas transversais. Seus feixes de células são longos e podem atingir até 30 cm, enquanto o diâmetro das fibras varia entre 10 µm a 100 µm. Tecido muscular estriado cardíaco: Está localizado no coração e, assim como o anterior, apresenta estriações em suas células. Elas são alongadas e ramificadas, sendo essas ramificações unidas por estruturas denominadas discos intercalares.Esses discos transmitem sinais de uma célula para outra, garantem a sincronização da contração cardíaca e atuam impedindo que as células separem-se quando ocorre o batimento do coração.Tecido muscular não estriado ou liso:É formado por células que não apresentam estriações, sendo essa uma característica que permite fácil diferenciação dos outros tipos de tecido. Suas células são longas, com centro mais espesso e extremidades afiladas. Elas apresentam apenas um único núcleo, disposto no centro de cada uma delas.'

        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertTecidoNervoso(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Tecido nervoso',
        'content':
            'É formado por células que possuem como papel principal a transmissão de impulsos nervosos.Neurônios: Os neurônios são células responsáveis pelos impulsos nervosos, altamente especializadas, dotadas de um corpo celular e numerosos prolongamentos citoplasmáticos, denominados neurofibras ou fibras nervosas.Gliócitos: Os gliócitos possuem a função de envolver e nutrir os neurônios, mantendo-os unidos. Os principais tipos de células dessa natureza são.Nervos: As fibras nervosas organizam-se em feixes. Cada feixe, por sua vez, é envolvido por uma bainha conjuntiva denominada perineuro. Vários feixes agrupados paralelamente formam um nervo. O nervo também é envolvido por uma bainha de tecido conjuntivo chamada epineuro.'

        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertCurativoTecnicasCurativos(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Técnicas de curativos utilizados',
        'content':
            'Curativo realizado na unidade de saúde, com material estéril (pinças ou luvas), solução fisiológica 0,9% aquecida e cobertura estéril. Curativo realizado no domicílio, pelo usuário e/ou familiar. Realizado com material limpo, água corrente ou soro fisiológico 0,9% e cobertura estéril.'
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertCurativoTiposCoberturas(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Tipos de coberturas de curativo',
        'content':
            'Somente protegem e cobrem as feridas. Proporcionam um micro-ambiente ótimo para a cura da ferida.  Resgatam ou estimulam a liberação de substâncias durante o processo de cura.'
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertCurativoMateriaisNecessarios(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Materiais necessários',
        'content':
            '• Frasco de SF 0,9%;\n• Álcool 70% e algodão;\n• Pacotes de gaze estéril;\n• Saco de lixo para curativo;\n• Fita adesiva hipoalergênica;\n• Agulha 40x12;\n• Lençol;\n• Impermeável.'
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertCurativoEtapasExecucao(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Etapas para execução',
        'content':
            '1. Higienizar as mãos conforme recomendações da ANVISA/OMS antes e após preparar o material;2. Reunir todo o material;3. Colocar a bandeja com o material sobre a mesa-de-cabeceira, previamente desinfetada, mantendo o ambiente livre de correntes de ar;4. Explicar o procedimento e a finalidade ao paciente;5. Garantir a privacidade do paciente, descobrir apenas a área a ser tratada;6. Colocar o cliente em posição confortável, adequada e segura;7. Colocar o recipiente de descarte próximo ao paciente;8. Colocar impermeável e/ou lençóis próximo à ferida para reter a solução drenada, evitando umedecer outras áreas;9. Paramentar-se com os EPI;10. Abrir o pacote de curativo estéril com técnica asséptica. Na ausência do pacote de curativo, realizar com luvas de procedimento e estéril;11. Abrir os pacotes de gazes esterilizadas e colocá-las sobre o campo estéril com técnica asséptica;12. Colocar as pinças sobre o campo da bandeja com os cabos voltados para a borda, manuseando-as pelo lado externo do campo. Primeiro par de pinças ( Kocher e dente de rato) posicionado próximo ao cliente;13. Fazer desinfecção da curvatura superior do frasco de SF0,9% ou do injetor de borracha do frasco de PVC do SF0,9% com algodão embebido em álcool a 70% e perfurá-los com agulha 40x12;14. Desprender a fita hipoalergênica com auxílio de pinça e gaze embebida em solução fisiológica;15.Continuar o curativo mantendo a pinça Kelly na mão dominante e a pinça anatômica permanecendo no campo para auxílio no preparo das gazes;16. Montar uma “trouxinha” de gazes esterilizadas utilizando a pinça cirúrgica, e umedecê-la com SF 0,9%;17. Iniciar a limpeza da ferida obedecendo o princípio do menos contaminado para o mais contaminado. Feridas cirúrgicas deve iniciar do leito da lesão até as bordas e feridas contaminadas a limpeza deve ser feita no sentido das bordas para o leito;18. Limpar a ferida em sentido único, utilizando as faces da “trouxinha” umedecida e trocando quantas vezes forem necessárias. Desprezá-las no recipiente de descarte;19. Remover ao máximo os exudatos (secreções, sangue), corpos estranhos e tecidos necrosados;20. Secar bem a gaze e aplicar produto adequado para cada tipo de tecido encontrado na lesão(cobertura primária), caso sejam indicados cremes e pomadas, usar a espátula ou tentacânula para a distribuição;21. Montar uma “trouxinha” de gazes esterilizadas e secas utilizando a pinça cirúrgica e passa-la sobre a ferida e depois em suas laterais, utilizando todas as faces e trocando-as quantas vezes forem necessárias;22. Ocluir a ferida com gaze, compressa ou outra cobertura externa (cobertura secundária) indicada para lesãoe fixá-las com fita adesiva hipoalergênica ou atadura;23.Identificar o curativo com nome data e hora. Realizar a troca de curativo conforme avaliação da ferida, produto realizado ou quando cobertura externa(cobertura secundária) estiver saturada(úmida);24. Recolher os materiais;25. Retirar os EPI;26. Recompor a unidade e o cliente;27. Colocar o cliente em posição confortável, adequada e segura;28. Dar destino adequado aos materiais e encaminhar bandeja, pinças, tesouras e bacias para o expurgo para posterior esterilização;29. Higienizar as mãos conforme recomendações da ANVISA/OMS;30. Proceder às anotações de enfermagem no prontuário constando: técnica do curativo, características da ferida e da pele adjacente, quantificação de materiais utilizados e ocorrências adversas e as medidas tomadas.'
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertCurativoAnotacaoenfermagem(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Anotação de enfermagem',
        'content':
            '• Local da lesão e sua dimensão;• Data e horário;• Sinais e sintomas observados (presença de secreção, coloração, odor,quantidade, etc.);• Relatar necessidade de desbridamento;• Tipo de curativo (oclusivo, aberto, simples, compressivo, presença de dreno,etc.);• Material prescrito e utilizado;• Relatar o nível de dor do paciente ao procedimento, a fim de avaliar necessidade de analgesia prévia;• Nome completo e Coren do responsável pelo procedimento.'
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertCurativoTiposCurativos(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Tipos de curativos',
        'content':
            ' A partir de 24 horas já podem ficar expostas, pois já se formou a rede de fibrina protetora impossibilitando a entrada de microorganismos, se o usuário desejar que a incisão fique coberta, poderá ser realizado apenas um curativo passivo. Irrigação com solução fisiológica 0,9%, morna (em torno de 37°C) , utilizando seringa de 20ml e agulha 40X12 (a pressão exercida no leito da lesão não deve ultrapassar 15 psi, a fim de preservar os neotecidos formados). Consiste no curativo tradicional, com uso de pinças. É considerado um curativo complexo, o dreno tem como objetivo: proporcionar a drenagem de sangue, exsudato, bile e outros fluidos corpóreos, evitando acúmulo destes na cavidade.'
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertCicatrizacaoTiposFeridas(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Tipos de cicatrização de feridas',
        'content':
            'Ocorre em feridas pequenas, nas quais as bordas não são muito afastadas, sem infecção e sem muito edema, como, por exemplo, as feridas operatórias.  Ocorre grande perda de tecidos, maior afastamento das bordas, com ou sem infecção. Nesse caso, pode-se tentar a aproximação das bordas da lesão. Porém, sendo esse um processo difícil, as lesões devem ser mantidas abertas, deixando-as se fecharem por meio de epitelização e contração.'
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertCicatrizacaoFasesFeridas(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Fases da cicatrização de feridas',
        'content':
            'Fase inflamatória: Ocorre imediatamente após o trauma e dura cerca de três a quatro dias. É caracterizada pelos sinais e sintomas inflamatórios, como edema, hiperemia, calor moderado e dor. A inflamação tem o objetivo de minimizar os efeitos do traumatismo ou bactérias patogênicas. *Fase Proliferativa: É caracterizada pela deposição do colágeno, formação do tecido de granulação, contração da ferida, reepitelização e angiogênese. Os macrófagos são importantes nessa fase, produzindo fatores de crescimento para atrair fibroblastos que produzem fibras de colágeno. *Fase de Maturação: Pode começar cerca de três semanas após o ferimento e durar vários meses ou até anos. É caracterizada pelo fortalecimento e remodelagem das fibras de colágeno, que são reorganizadas formando ângulos com as margens da ferida. A cicatriz madura pode apresentar hiperpigmentação ou hipopigmentação e espessura palpável devido à fibrose da derme.'
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertCicatrizacaoFormasCicatrizacao(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Formas de cicatrização',
        'content':
            'Cicatrização por Primeira Intenção: Ocorre quando a pele é cortada de maneira limpa e asséptica, com bordas aproximadas por suturas. Feridas fechadas dessa maneira cicatrizam sem complicações e com formação de tecido cicatricial discreto. *Cicatrização por Segunda Intenção:As feridas abertas demandam mais tempo para cicatrizar e podem resultar em uma cicatriz menos exuberante devido à grande formação de tecido de granulação. *Cicatrização por Terceira Intençäo:A ferida é deixada aberta por um período determinado antes de ser suturada como uma ferida de primeira intenção. Esse tipo de cicatrização é utilizado em feridas cirúrgicas com suspeita de infecção.'
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertSecrecoesTransudato(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Transudato',
        'content':
            'Transudato é um fluido que extravasa dos vasos sanguíneos para os tecidos, em decorrência de um desequilíbrio hidrostático ou osmótico, esse fluido apresenta baixa concentração de proteínas e poucas células, geralmente neutrófilos.\nPode ser encontrado em diversas condições clínicas, como insuficiência cardíaca congestiva, cirrose hepática, síndrome nefrótica e desnutrição. O seu acúmulo em determinados tecidos pode causar edema, que é a retenção de líquidos em excesso, podendo gerar desconforto, dor e diminuição da mobilidade.'
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertSecrecoesExsudato(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Exsudato',
        'content':
            'Exsudato:É um material fluido, composto por células que escapam de um vaso sanguíneo e se depositam nos tecidos ou nas superfícies teciduais, usualmente como resultado de um processo inflamatório. O exsudato é caracterizado por um alto conteúdo de proteínas, células e materiais sólidos derivados das células. Os exsudatos das reações inflamatórias variam no conteúdo de líquido, proteínas plasmáticas e células.'
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertSecrecoesExsudatoSeroso(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Exsudato seroso',
        'content':
            'Exsudato seroso: É caracterizado por uma extensa liberação de líquido, com baixo conteúdo protéico, que conforme o local da agressão origina-se de soro sanguíneo ou das secreções serosas das células mesoteliais. Esse tipo de exsudato inflamatório é observado precocemente nas fases de desenvolvimento da maioria das reações inflamatórias agudas, encontrada nos estágios da infecção bacteriana.'
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertSecrecoesExsudatoSanguinolento(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Exsudato sanguinolento',
        'content':
            'Exsudato sanguinolento: É decorrente de lesões com ruptura de vasos ou de hemácias. Não é uma forma distinta de exsudação, é quase sempre, um exsudato fibrinoso ou supurativo, acompanhado pelo extravasamento de grande quantidade de hemácias.'
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertSecrecoesExsudatoPurulento(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Exsudato purulento',
        'content':
            'Exsudato purulento: É um líquido composto por células e proteínas, produzido por um processo inflamatório asséptico ou séptico.\nAlguns microrganismos (estafilococos, pneumococos, meningococos, gonococos, coliformes e algumas amostras não hemolíticas dos estreptococos) produzem de forma característica, supuração local e por isso são chamados de bactérias piogênicas (produtoras de pus).'
                .replaceAll(RegExp(r'\s-\s'), '\n-'),
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertSecrecoesExsudatoFibrinoso(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Exsudato fibrinoso',
        'content':
            'Exsudato fibrinoso: É o extravasamento de grande quantidade de proteínas plasmáticas, incluindo o fibrinogênio, e a participação de grandes massas de fibrina.'
        //'image': imageBytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

Future<void> insertTratamentoBotaUna(Database db) async {
    await db.insert(
      'study',
      {
        'title': 'Bota de unna',
        'content':
            '{DESCRIÇÃO} *Bandagem de algodão puro ou misto impregnada com óxido de zinco, glicerina, óleo de castor ou mineral.* {TIPO DE TRATAMENTO} *Cobertura primária ou secundária* {TIPO DE FERIDA} *Feridas decorrente de insuficiência venosa* {MECANISMO DE AÇÃO} *Possui atividade cicatrizante e reepitelizante, atuando na contenção de edema ao auxiliar no melhor retorno venoso e redução de exsudato.* {INDICAÇÃO} *Úlceras Venosas de MMII* {CONTRAINDICAÇÃO} *● Hipersensibilidade aos componentes do produto. \n● Bota de Unna é contraindicada para úlcera arterial. No caso de úlcera mista encaminhar para avaliação médica. \n● Em casos de Diabetes Mellitus avaliar bem a perfusão do membro acometido. \n● Em casos de celulite (inchaço e eritema na área da ferida) e processo inflamatório intenso.* {MODO DE USAR} *● Aplicar preferencialmente no período da manhã, Solicitar ao paciente manter os membros afetados elevados acima do nível do corpo por no mínimo 15 minutos, antes do procedimento, na primeira aplicação e sempre que necessário na presença de edema. \n● Avaliar a ferida e a necessidade de associação com outra cobertura primária, realizar o curativo. \n● Iniciar o enfaixamento da bandagem pelos artelhos, aplicando progressivamente até a tuberosidade tibial. \n● Na presença de muito exsudato, principalmente nas primeiras trocas, colocar gaze ou chumaço por cima da bota no local da lesão e enfaixar com atadura de crepe sobre a bota de unna.* {PERÍODO DE TROCA} *Após 1ª colocação, avaliação clínica em 24hs ou 48hs e 1ª troca em 4 dias. Após controle do exsudato deve permanecer até 7 dias. Trocar a cobertura secundária sempre que saturada.* {OBSERVAÇÃO} *Poderá ser associado a uma cobertura primária. Avaliar a melhor técnica para enfaixamento da bandagem considerando o paciente e o produto.*'
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
