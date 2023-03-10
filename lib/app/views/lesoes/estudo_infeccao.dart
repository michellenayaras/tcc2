import 'package:flutter/material.dart';
import 'package:tcc/app/views/lesoes/estudo_comprometimento_tecidual.dart';
import 'package:tcc/app/views/lesoes/estudo_evolucao.dart';
import '../../controllers/banco_de_dados.dart';

class EstudoLesoesinfeccao extends StatefulWidget {
  const EstudoLesoesinfeccao({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EstudoLesoesinfeccaoState createState() => _EstudoLesoesinfeccaoState();
}

class _EstudoLesoesinfeccaoState extends State<EstudoLesoesinfeccao> {
  late Future<List<Map<String, dynamic>>> _data;
  final _scrollController = ScrollController();
  bool _showBottomNavigation = false;

  @override
  void initState() {
    super.initState();
    _data = MyDatabase().getData('Presença de infecção');
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
            Navigator.pushNamed(context, '/estudo_lesoes');
          },
        ),
        title: const Text(
          'Presença de infecção',
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
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Card(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Feridas limpas ou assépticas",
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "São feridas não infectadas, isto é, livres de microrganismos patogênicos. Lesões produzidas sob condições assépticas, sem falhas técnicas, por incisão em tecidos estéreis ou de fácil descontaminação e sem indícios de sinais flogísticos.",
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
                                        'assets/images/limpas_ou_assepticas.jpg',
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Divider(
                              thickness:
                                  1.5, // define a espessura da linha como 2.0
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Card(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Limpas contaminadas",
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Ocorrem em tecidos de baixa colonização, sem contaminação significativa prévia, ou durante o ato cirúrgico. Também lesões com tempo inferior a seis horas entre o trauma e o atendimento inicial.",
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
                                        'assets/images/limpas_contaminadas.jpg',
                                        height: 220.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Divider(
                              thickness:
                                  1.5, // define a espessura da linha como 2.0
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Card(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Contaminadas",
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "São feridas acidentais, recentes e abertas, colonizadas por flora bacteriana considerável. Também as cirúrgicas, quando à técnica asséptica é desobedecida ou ainda, feridas cujo tempo de atendimento inicial foi superior a seis horas após o trauma.",
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
                                        'assets/images/contaminadas.jpg',
                                        height: 230.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Divider(
                              thickness:
                                  1.5, // define a espessura da linha como 2.0
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Card(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Feridas infectadas ou sépticas",
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "São feridas colonizadas por microrganismos como bactérias, vírus, fungos e parasitas, devido a uma contaminação por detritos ou por imunidade baixa do organismo. Apresentam sinais de infecção, como tecido desvitalizado, exsudação purulenta e odor característico.",
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
                                        'assets/images/feridas_infectadas.jpg',
                                        height: 230.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 30.0),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
                        builder: (context) => const EstudoLesoesEvolucao(),
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
                            const EstudoLesoesComprometimentoTecidual(),
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
