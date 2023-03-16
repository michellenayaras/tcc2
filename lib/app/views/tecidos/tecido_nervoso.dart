import 'package:flutter/material.dart';
import 'package:tcc/app/views/tecidos/tecido_muscular.dart';
import '../../controllers/banco_de_dados.dart';

class EstudoTecidoNervoso extends StatefulWidget {
  const EstudoTecidoNervoso({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EstudoTecidoNervosoState createState() => _EstudoTecidoNervosoState();
}

class _EstudoTecidoNervosoState extends State<EstudoTecidoNervoso> {
  late Future<List<Map<String, dynamic>>> _data;

  @override
  void initState() {
    super.initState();
    _data = MyDatabase().getData('Tecido nervoso');
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
          'Tecido nervoso',
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
            final text = data[0]['content'] as String;
            final intro = text.substring(0, text.indexOf('.') + 1);
            final parts = text
                .substring(text.indexOf('.') + 1)
                .splitMapJoin(
                  RegExp(
                      r'(É formado por células que possuem como papel  \(.+?\):|Neurônios|Gliócitos|Nervos)'),
                  onMatch: (m) => '\n${m.group(0)}',
                  onNonMatch: (n) => n,
                )
                .split('\n')
                .where((s) => s.isNotEmpty)
                .where((s) =>
                    s.startsWith('Esse tecido apresenta células alongadas') ||
                    s.startsWith('Neurônios') ||
                    s.startsWith('Gliócitos') ||
                    s.startsWith('Nervos'))
                .toList();

            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              itemCount: 1 + parts.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        child: ListTile(
                          title: Text(
                            intro,
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
                            // Navegar para a tela do tema correspondente
                          },
                        ),
                      ),
                      const SizedBox(height: 18.0),
                    ],
                  );
                } else {
                  final partTitle = parts[index - 1]
                      .substring(0, parts[index - 1].indexOf(':') + 1);
                  final partContent = parts[index - 1]
                      .substring(parts[index - 1].indexOf(':') + 1)
                      .trim();

                  return Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 12.0,
                    ),
                    child: ExpansionTile(
                      title: Text(
                        partTitle,
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0,
                          ),
                          child: Text(
                            partContent,
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
                        ),
                      ],
                    ),
                  );
                }
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
                      builder: (context) => const EstudoTecidosMuscular(),
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
                        width: 1), // adicione um espaço entre o ícone e o texto
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
