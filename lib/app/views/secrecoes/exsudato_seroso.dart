import 'package:flutter/material.dart';
import 'package:tcc/app/views/secrecoes/exsudato.dart';
import 'package:tcc/app/views/secrecoes/exsudato_sanguinolento.dart';
import '../../controllers/banco_de_dados.dart';

class EstudoSecrecoesExsudatoSeroso extends StatefulWidget {
  const EstudoSecrecoesExsudatoSeroso({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EstudoSecrecoesExsudatoSerosoState createState() =>
      _EstudoSecrecoesExsudatoSerosoState();
}

class _EstudoSecrecoesExsudatoSerosoState
    extends State<EstudoSecrecoesExsudatoSeroso> {
  late Future<List<Map<String, dynamic>>> _data;

  @override
  void initState() {
    super.initState();
    _data = MyDatabase().getData('Exsudato seroso');
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
            Navigator.pushNamed(context, '/estudo_secrecoes');
          },
        ),
        title: const Text(
          'Exsudato seroso',
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
                final boldText = text.replaceFirstMapped(
                    RegExp(r'^(\w+):'), (match) => '${match.group(1)}:');

                return Container(
                  padding: const EdgeInsets.all(12.0),
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: '',
                            children: [
                              TextSpan(
                                text: '${boldText.split(':')[0]}:',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: boldText.split(':')[1],
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0.15,
                                  wordSpacing: 0.5,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Colors.grey),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.white, width: 4),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Ink.image(
                                image: const AssetImage(
                                    'assets/images/exsudato_seroso.jpg'),
                                fit: BoxFit.cover,
                                height: 300.0,
                                child: InkWell(
                                  onTap: () {
                                    // Ação a ser executada ao clicar na imagem
                                  },
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      // Navegar para a tela do tema correspondente
                    },
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
                      builder: (context) => const EstudoSecrecoesExsudato(),
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
                            const EstudoSecrecoesExsudatoSanguinolento()),
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
