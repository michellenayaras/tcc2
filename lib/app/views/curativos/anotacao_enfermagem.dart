import 'package:flutter/material.dart';
import 'package:tcc/app/views/curativos/etapas_execucao.dart';
import 'package:tcc/app/views/curativos/tipos_curativos.dart';
import '../../controllers/banco_de_dados.dart';

class EstudoCurativosAnotacaoEnfermagem extends StatefulWidget {
  const EstudoCurativosAnotacaoEnfermagem({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EstudoCurativosAnotacaoEnfermagemState createState() =>
      _EstudoCurativosAnotacaoEnfermagemState();
}

class _EstudoCurativosAnotacaoEnfermagemState
    extends State<EstudoCurativosAnotacaoEnfermagem> {
  late Future<List<Map<String, dynamic>>> _data;

  @override
  void initState() {
    super.initState();
    _data = MyDatabase().getData('Anotação de enfermagem');
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
            Navigator.pushNamed(context, '/estudo_curativos');
          },
        ),
        title: const Text(
          'Anotação de enfermagem',
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
            return Container(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  final text = item['content'] as String;
                  final lines = text.split(';');

                  return Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Conforme o guia recomendações para registros de enfermagem do COFEN, a anotação de curativo deve conter:',
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
                        const SizedBox(height: 12.0),
                        Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.15,
                              wordSpacing: 0.5,
                              height: 1.5,
                              color: Colors.black87,
                            ),
                            children: [
                              for (final line in lines)
                                TextSpan(text: '$line;\n'),
                            ],
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar os dados do banco de dados'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
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
                          const EstudoCurativosEtapasExecucao(),
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
                            const EstudoCurativosTiposCurativos()),
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
