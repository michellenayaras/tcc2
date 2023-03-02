import 'package:flutter/material.dart';

class EstudoLesoes extends StatelessWidget {
  const EstudoLesoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
            255, 250, 249, 249), // Define a cor de fundo do AppBar
        leading: IconButton(
          // Define o botão de retorno com um ícone personalizado
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Color.fromRGBO(153, 184, 196, 100),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Estudo - Lesões',
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
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Tema 1'),
            onTap: () {
              // Navegar para a tela do tema 1
            },
          ),
          ListTile(
            title: const Text('Tema 2'),
            onTap: () {
              // Navegar para a tela do tema 2
            },
          ),
          ListTile(
            title: const Text('Tema 3'),
            onTap: () {
              // Navegar para a tela do tema 3
            },
          ),
          // Adicione mais itens da lista aqui
        ],
      ),
    );
  }
}
