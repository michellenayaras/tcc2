import 'package:flutter/material.dart';
import 'package:tcc/app/views/tecidos/funcoes_pele.dart';
import 'package:tcc/app/views/tecidos/tecido_conjuntivo.dart';
import '../../controllers/banco_de_dados.dart';

class EstudoTecidosEpitelial extends StatefulWidget {
  const EstudoTecidosEpitelial({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EstudoTecidosEpitelialState createState() => _EstudoTecidosEpitelialState();
}

class _EstudoTecidosEpitelialState extends State<EstudoTecidosEpitelial> {
  late Future<List<Map<String, dynamic>>> _data;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _data = MyDatabase().getData('Tecido epitelial');
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
            Navigator.pushNamed(context, '/estudo_tecidos');
          },
        ),
        title: const Text(
          'Tecido epitelial',
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
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            final maxScroll = notification.metrics.maxScrollExtent;
            final currentScroll = notification.metrics.pixels;
            final shouldShowButtons = currentScroll >= maxScroll - 50;

            setState(() {
            });
          }
          return true;
        },
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              return ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  final text = item['content'] as String;

                  return Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            text,
                            style: const TextStyle(
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
                          onTap: () {
                            // Navigate to corresponding theme screen
                          },
                        ),
                        const SizedBox(height: 20.0),
                        Column(
                          children: [
                            ExpansionTile(
                              title: const Text(
                                "Simples",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: const Text(
                                    "Apresenta apenas uma camada de células.",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'Roboto',
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/images/simples.jpg',
                                    height: 130.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                          thickness:
                              1.5, // define a espessura da linha como 2.0
                        ),
                        Column(
                          children: [
                            ExpansionTile(
                              title: const Text(
                                "Estratificado",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: const Text(
                                    "Apresenta múltiplas camadas celulares.",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'Roboto',
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/images/estratificado.jpg',
                                    height: 150.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                          thickness:
                              1.5, // define a espessura da linha como 2.0
                        ),
                        Column(
                          children: [
                            ExpansionTile(
                              title: const Text(
                                "Pseudoestratificado",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: const Text(
                                    "Apresenta apenas uma camada de células, entretanto, possui um aspecto que dá a falsa impressão de possuir várias camadas celulares. Isso ocorre porque as células possuem tamanhos variados, e a localização do núcleo é diferente em cada célula.",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'Roboto',
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/images/pseudoestratificado.jpg',
                                    height: 150.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                          thickness:
                              1.5, // define a espessura da linha como 2.0
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Erro ao carregar os dados do banco de dados...'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
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
                      builder: (context) => const EstudoTecidosFuncoesPele(),
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
                        builder: (context) => const EstudoTecidosConjuntivo()),
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
