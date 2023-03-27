import 'package:flutter/material.dart';
import 'package:tcc/app/views/lesoes/estudo_comprometimento_tecidual.dart';
import '../../controllers/banco_de_dados.dart';

class EstudoLesoesTiposFeridas extends StatefulWidget {
  const EstudoLesoesTiposFeridas({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EstudoLesoesTiposFeridasState createState() =>
      _EstudoLesoesTiposFeridasState();
}

class _EstudoLesoesTiposFeridasState extends State<EstudoLesoesTiposFeridas> {
  late Future<List<Map<String, dynamic>>> _data;
  final _scrollController = ScrollController();
  bool _showBottomNavigation = false;

  @override
  void initState() {
    super.initState();
    _data = MyDatabase().getData('Tipos de feridas');
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
            Navigator.pushNamed(
                context, '/estudo_lesoes'); // Navega para a tela "MinhaTela"
          },
        ),
        title: const Text(
          'Tipos de feridas',
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
                        const SizedBox(height: 20.0),
                        Column(
                          children: [
                            ExpansionTile(
                              title: const Text(
                                "Feridas mecânicas",
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
                                    "São feridas traumáticas, causadas por traumatismos externos, cortante ou penetrante, isto inclui, entre outras, as abrasões, esmagamentos e cortes.",
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
                                    'assets/images/feridas_mecanicas.png',
                                    height: 250.0,
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
                                "Feridas laceradas",
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
                                    "São feridas que apresentam margens irregulares, como as produzidas por caco de vidro ou arame farpado.",
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
                                    'assets/images/feridas_laceradas.jpg',
                                    height: 250.0,
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
                                "Feridas químicas",
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
                                    "São feridas causadas pela ação de ácidos ou bases muito fortes e alguns sais e gases, como gás lacrimogêneo e ácido hidroclorídrico.",
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
                                    'assets/images/feridas_quimicas.jpg',
                                    height: 250.0,
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
                                "Feridas térmicas",
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
                                    "São feridas que se desenvolvem como resultado do calor ou frio extremo.",
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
                                    'assets/images/feridas_termicas.jpg',
                                    height: 250.0,
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
                                "Feridas por eletricidade",
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
                                    "São feridas causadas por raios ou contato com objeto energizado, como por exemplo, contato com a rede elétrica.",
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
                                    'assets/images/feridas_eletricidade.jpg',
                                    height: 250.0,
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
                                "Feridas por radiação",
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
                                    "São feridas causadas pela longa exposição a raios solares, raios X ou outro tipo de radiação.",
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
                                    'assets/images/feridas_radiação.png',
                                    height: 235.0,
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
                                "Feridas incisas",
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
                                    "São feridas produzidas por um instrumento cortante, como por exemplo as feridas cirúrgicas.",
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
                                    'assets/images/feridas_incisas.jpg',
                                    height: 250.0,
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
                                "Feridas contusas",
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
                                    "São feridas produzidas por ação contundente de objetos rombos. Caracterizam-se por traumatismo das partes moles, hemorragias e edema.",
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
                                    'assets/images/feridas_contusas.jpg',
                                    height: 250.0,
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
                                "Feridas perfurantes",
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
                                    "São feridas produzidas por arma de fogo (bala) ou arma branca (faca); produzem pequena abertura na pele, porém podem atingir camadas teciduais profundas e órgãos, causando hemorragia intensa.",
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
                                    'assets/images/feridas_perfurantes.jpg',
                                    height: 220.0,
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
                                "Feridas oncológicas",
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
                                    "São causadas por tumores da pele ou metástases cutâneas de outros tumores.",
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
                                    'assets/images/feridas_oncológicas.jpg',
                                    height: 250.0,
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
                                "Lesão por pressão",
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
                                    "Úlcera de pressão é uma área de necrose que se desenvolve quando o tecido é comprimido por longos períodos de tempo entre uma proeminência óssea e uma superfície dura. É uma lesão na pele que ocorre quando o paciente permanece por longos períodos na mesma posição sem mobilização ou cuidados adequados de enfermagem.",
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
                                    'assets/images/lesão_por_pressão.jpg',
                                    height: 250.0,
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
                                "Úlcera venosa",
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
                                    "Úlcera venosa é uma ferida crônica que ocorre nas pernas devido à insuficiência venosa crônica (IVC). IVC é uma condição na qual as veias das pernas têm dificuldade em levar o sangue de volta ao coração, resultando no refluxo de sangue para as veias superficiais. A úlcera venosa é comum em idosos com mais de 65 anos e pode ser congênita, primária ou secundária.\nA IVC desencadeia hipertensão venosa, afeta a microcirculação, causando danos às paredes dos vasos sanguíneos e alterações cutâneas.",
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
                                    'assets/images/ulcera_venosa.jpg',
                                    height: 250.0,
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
                                "Úlcera arterial",
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
                                    "A úlcera arterial é uma ferida que ocorre devido à desnutrição cutânea causada por uma insuficiência arterial que resulta em isquemia. Clinicamente, a úlcera arterial se caracteriza por extremidade fria e escura, palidez, ausência de estase, retardo no retorno da cor após a elevação do membro, pele atrófica, perda de pelos, diminuição ou ausência das pulsações das artérias do pé e dor severa que aumenta com a elevação das pernas.",
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
                                    'assets/images/ulcera_arterial.jpg',
                                    height: 250.0,
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
                                "Feridas vasculogênicas",
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
                                    "Ferida crônica dos pés, resultante de complicações da diabetes, como neuropatia diabética e doença vascular periférica. Pode ocorrer diminuição da sensibilidade, deformidades, diminuição de fluxo arterial, que predispõem a ulceração dos pés.",
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
                                    'assets/images/feridas_vasculogênicas.jpg',
                                    height: 250.0,
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
                                "Queimaduras",
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
                                    "Produzem lesão por coagulação das proteínas celulares, sendo decorrentes de processos de contato com calor, eletricidade e congelamento. A profundidade e extensão variam de acordo com o tempo de exposição e temperatura aplicada.",
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
                                    'assets/images/queimaduras.jpg',
                                    height: 250.0,
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
                                "Fístula",
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
                                    "Fístulas são trajetos anormais que conectam duas superfícies do corpo, podendo ser causadas por diversos fatores, como infecção, traumas, doenças inflamatórias e neoplasias.",
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
                                    'assets/images/fístula.jpg',
                                    height: 250.0,
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
