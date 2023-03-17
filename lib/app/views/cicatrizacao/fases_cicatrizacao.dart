import 'package:flutter/material.dart';
import 'package:tcc/app/views/cicatrizacao/estudo_cicatrizacao.dart';
import 'package:tcc/app/views/cicatrizacao/formas_cicatriza%C3%A7%C3%A3o.dart';
import 'package:tcc/app/views/cicatrizacao/tipos_cicatrizacao.dart';
import 'package:tcc/app/views/curativos/tipos_coberturas.dart';
import '../../controllers/banco_de_dados.dart';

class EstudoCicatrizacaoFasesCicatrizacao extends StatefulWidget {
  const EstudoCicatrizacaoFasesCicatrizacao({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EstudoCicatrizacaoFasesCicatrizacaoState createState() =>
      _EstudoCicatrizacaoFasesCicatrizacaoState();
}

class _EstudoCicatrizacaoFasesCicatrizacaoState
    extends State<EstudoCicatrizacaoFasesCicatrizacao> {
  late Future<List<Map<String, dynamic>>> _data;

  @override
  void initState() {
    super.initState();
    _data = MyDatabase().getData('Fases da cicatrização de feridas');
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
          'Fases da cicatrização de feridas',
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
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                final text = item['content'] as String;

                // Divide o texto em três partes
                final textParts = text.split('*');
                final inflamatoriaParts = textParts[0].split(':');
                final proliferativaParts = textParts[1].split(':');
                final maturacaoParts = textParts[2].split(':');

                // Extrai o título e o texto de cada parte
                final inflamatoriaTitle = inflamatoriaParts[0];
                final inflamatoriaText = inflamatoriaParts[1].trim();
                final proliferativaTitle = proliferativaParts[0];
                final proliferativaText = proliferativaParts[1].trim();
                final maturacaoTitle = maturacaoParts[0];
                final maturacaoText = maturacaoParts[1].trim();

                // Cria os children de cada ExpansionTile
                final inflamatoriaChildren = <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      inflamatoriaText,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto',
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ];
                final proliferativaChildren = <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      proliferativaText,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto',
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ];
                final maturacaoChildren = <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      maturacaoText,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto',
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ];

                // Cria os ExpansionTiles para cada fase
                return Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        child: const Text(
                          'As fases da cicatrização de feridas são um processo complexo que ocorre naturalmente em nosso organismo para reparar os tecidos danificados por uma lesão ou trauma. Essas fases são divididas em três etapas distintas: inflamatória, proliferativa e de maturação.',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.15,
                            wordSpacing: 0.5,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(height: 5),
                      ExpansionTile(
                        title: Text(
                          inflamatoriaTitle,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        children: inflamatoriaChildren,
                      ),
                      ExpansionTile(
                        title: Text(
                          proliferativaTitle,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        children: proliferativaChildren,
                      ),
                      ExpansionTile(
                        title: Text(
                          maturacaoTitle,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        children: maturacaoChildren,
                      ),
                    ],
                  ),
                );
              },
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const EstudoCicatrizacaoTiposCicatrizacao(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(62, 132, 158, 100),
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
                            const EstudoCicatrizacaoFormasCicatrizacao()),
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
