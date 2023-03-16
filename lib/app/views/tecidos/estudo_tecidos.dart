import 'package:flutter/material.dart';
import 'package:tcc/app/views/tecidos/anatomia_fisiologia.dart';
import 'package:tcc/app/views/tecidos/funcoes_pele.dart';
import 'package:tcc/app/views/tecidos/tecido_conjuntivo.dart';
import 'package:tcc/app/views/tecidos/tecido_epitelial.dart';
import 'package:tcc/app/views/tecidos/tecido_muscular.dart';
import 'package:tcc/app/views/tecidos/tecido_nervoso.dart';

class EstudoTecidos extends StatelessWidget {
  const EstudoTecidos({Key? key}) : super(key: key);

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
            color: Color.fromRGBO(62, 132, 158, 100),
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/',
              ModalRoute.withName('/'), // Define a rota base como a tela "View"
            );
          },
        ),
        title: const Text(
          'Tecidos',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 8),
            ListTile(
              title: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  'Anatomia e fisiologia da pele',
                  style: TextStyle(
                    color: Color.fromARGB(156, 31, 99, 124),
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onTap: () async {
                // Navegar para a próxima tela
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const EstudoTecidoAnatomiaFisiologia(),
                  ),
                );
              },
              tileColor: Colors.white, // Define a cor de fundo do item
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(8.0)), // Define o raio da borda do item
                side: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 5),
            ListTile(
              title: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  'Funções da pele',
                  style: TextStyle(
                    color: Color.fromARGB(156, 31, 99, 124),
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onTap: () async {
                // Navegar para a próxima tela
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EstudoTecidosFuncoesPele(),
                  ),
                );
              },
              tileColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                side: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 5),
            ListTile(
              title: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  'Tecido epitelial',
                  style: TextStyle(
                    color: Color.fromARGB(156, 31, 99, 124),
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onTap: () async {
                // Navegar para a próxima tela
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EstudoTecidosEpitelial(),
                  ),
                );
              },
              tileColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                side: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 5),
            ListTile(
              title: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  'Tecido conjuntivo',
                  style: TextStyle(
                    color: Color.fromARGB(156, 31, 99, 124),
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onTap: () async {
                // Navegar para a próxima tela
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EstudoTecidosConjuntivo(),
                  ),
                );
              },
              tileColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                side: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 5),
            ListTile(
              title: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  'Tecido muscular',
                  style: TextStyle(
                    color: Color.fromARGB(156, 31, 99, 124),
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onTap: () async {
                // Navegar para a próxima tela
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EstudoTecidosMuscular(),
                  ),
                );
              },
              tileColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                side: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 5),
            ListTile(
              title: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  'Tecido nervoso',
                  style: TextStyle(
                    color: Color.fromARGB(156, 31, 99, 124),
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onTap: () async {
                // Navegar para a próxima tela
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EstudoTecidoNervoso(),
                  ),
                );
              },
              tileColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                side: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            // Adicione mais itens da lista aqui
          ],
        ),
      ),
    );
  }
}
