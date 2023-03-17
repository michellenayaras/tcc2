import 'package:flutter/material.dart';
import 'package:tcc/app/views/curativos/etapas_execucao.dart';
import 'package:tcc/app/views/curativos/tipos_coberturas.dart';
import '../../controllers/banco_de_dados.dart';

class EstudoCurativosMateriaisNecessarios extends StatefulWidget {
  const EstudoCurativosMateriaisNecessarios({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EstudoCurativosMateriaisNecessariosState createState() =>
      _EstudoCurativosMateriaisNecessariosState();
}

class _EstudoCurativosMateriaisNecessariosState
    extends State<EstudoCurativosMateriaisNecessarios> {
  late Future<List<Map<String, dynamic>>> _data;
  final _scrollController = ScrollController();
  bool _showBottomNavigation = false;

  @override
  void initState() {
    super.initState();
    _data = MyDatabase().getData('Materiais necessários');
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
            Navigator.pushNamed(context, '/estudo_curativos');
          },
        ),
        title: const Align(
          alignment: Alignment.center, // Alinha o texto à esquerda da AppBar
          child: Text(
            'Materiais necessários',
            style: TextStyle(
              color: Color.fromRGBO(62, 132, 158, 100),
              fontSize: 20.0,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        titleSpacing: 0.0,
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
              _showBottomNavigation = shouldShowButtons;
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
                        Container(
                          padding: const EdgeInsets.all(12.0),
                          child: const Text(
                            '•  EPI: óculos de proteção, avental, luvas de procedimento e máscara cirúrgica;\n• Pacote de curativo (pinças cirúrgicas “Kocher, Kelly, anatômica ou dente de rato”, tesoura) ou luva estéril;',
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
                        Container(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                ExpansionTile(
                                  title: const Text(
                                    "Kocher",
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/images/kocher.jpg',
                                        height: 310.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness:
                                      1.5, // define a espessura da linha como 2.0
                                ),
                                ExpansionTile(
                                  title: const Text(
                                    "Kelly",
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/images/kelly.jpg',
                                        height: 310.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness:
                                      1.5, // define a espessura da linha como 2.0
                                ),
                                ExpansionTile(
                                  title: const Text(
                                    "Anatômica",
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/images/anatômica.jpg',
                                        height: 310.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness:
                                      1.5, // define a espessura da linha como 2.0
                                ),
                                ExpansionTile(
                                  title: const Text(
                                    "Dente de rato",
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/images/dente_de_rato.jpg',
                                        height: 310.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness:
                                      1.5, // define a espessura da linha como 2.0
                                ),
                                const SizedBox(height: 10.0),
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
                                // ExpansionTiles...
                              ],
                            )),
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
      bottomNavigationBar: AnimatedOpacity(
        opacity: _showBottomNavigation ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: Padding(
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
                            const EstudoCurativosTiposCoberturas(),
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
                          width:
                              1), // adicione um espaço entre o ícone e o texto
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Próximo',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                          width:
                              1), // adicione um espaço entre o ícone e o texto
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
      ),
    );
  }
}
