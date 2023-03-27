import 'package:flutter/material.dart';
import 'package:tcc/app/views/cicatrizacao/fases_cicatrizacao.dart';
import '../../controllers/banco_de_dados.dart';

class EstudoTratamentoBotaUnna extends StatefulWidget {
  const EstudoTratamentoBotaUnna({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EstudoTratamentoBotaUnnaState createState() =>
      _EstudoTratamentoBotaUnnaState();
}

class _EstudoTratamentoBotaUnnaState extends State<EstudoTratamentoBotaUnna> {
  late Future<List<Map<String, dynamic>>> _data;

  @override
  void initState() {
    super.initState();
    _data = MyDatabase().getData('Bota de unna');
  }

  List<Widget> extractTopicsFromContent(String content) {
    final regex = RegExp(r'\{(.*?)\}\s*\*(.*?)\*', dotAll: true);

    final matches = regex.allMatches(content);
    final widgets = <Widget>[];

    for (final match in matches) {
      final topicTitle = match.group(1)?.toUpperCase() ?? '';
      final topicContent = match.group(2)?.trim().replaceAll('*', '') ?? '';
      final topicWidget = Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        // ignore: sort_child_properties_last
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(62, 132, 158, 100),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Text(
                topicTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                topicContent,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      );

      widgets.add(topicWidget);
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
            255, 250, 249, 249), // Define a cor de fundo do AppBar
        actions: [
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Color.fromRGBO(62, 132, 158, 100),
            ),
            iconSize: 35,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                ModalRoute.withName(
                    '/'), // Define a rota base como a tela "View"
              );
            },
          ),
          const SizedBox(
            width: 15.0, // Define o tamanho do espaço à direita do ícone
          ),
        ],
        leading: IconButton(
          // Define o botão de retorno com um ícone personalizado
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Color.fromRGBO(62, 132, 158, 100),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/estudo_cicatrizacao');
          },
        ),
        title: const Text(
          'Bota de unna',
          style: TextStyle(
            color: Color.fromRGBO(62, 132, 158, 100),
            fontSize: 20.0,
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: true,
        toolbarHeight: 70.0,
        elevation: 2.0,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            final content = data[0]['content'] as String;
            final topicWidgets = extractTopicsFromContent(content);
            const SizedBox(height: 10.0);

            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  padding: const EdgeInsets.all(30.0),
                  child: Image.asset('assets/images/bota_unna.jpg'),
                ),
                //const SizedBox(height: .0),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    itemCount: topicWidgets.length,
                    itemBuilder: (context, index) {
                      final topicWidget = topicWidgets[index];

                      return Container(
                        padding: const EdgeInsets.all(10.0),
                        child: topicWidget,
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            // ignore: prefer_const_constructors
            return Center(
              child: const Text('Erro ao carregar os dados do banco de dados'),
            );
          } else {
            // ignore: prefer_const_constructors
            return Center(
              child: const CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: 112,
              child: ElevatedButton(
                onPressed: () {
                  // Ação do botão anterior
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white30,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), // set the border radius
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.arrow_back_ios_rounded, // set the icon
                      color: Colors.white, // set the icon color
                    ),
                    SizedBox(
                        width: 1), // adicione um espaço entre o ícone e o texto
                    Text(
                      'Anterior',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 112,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const EstudoCicatrizacaoFasesCicatrizacao()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(
                      62, 132, 158, 100), // set the background color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), // set the border radius
                  ),
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end, // centralizar o texto e o ícone
                  children: const [
                    Text(
                      'Próximo',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(width: 1),
                    Icon(
                      Icons.arrow_forward_ios_rounded, // set the icon
                      color: Colors.white, // set the icon color
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
