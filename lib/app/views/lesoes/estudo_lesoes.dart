import 'package:flutter/material.dart';
import 'package:tcc/app/views/lesoes/estudo_comprometimento_tecidual.dart';
import 'package:tcc/app/views/lesoes/estudo_etiologia.dart';
import 'package:tcc/app/views/lesoes/estudo_evolucao.dart';
import 'package:tcc/app/views/lesoes/estudo_infeccao.dart';
import 'package:tcc/app/views/lesoes/estudo_tipos_feridas.dart';
import 'estudo_introducao.dart';
import 'estudo_tamanho_lesao.dart';

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
          'Lesões',
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
                  'Introdução',
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
                    builder: (context) => const EstudoLesoesIntroducao(),
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
                  'Tamanho da área e profundidade da lesão',
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
                    builder: (context) => const EstudoLesoesProfundidade(),
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
                  'Etiologia',
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
                    builder: (context) => const EstudoLesoesEtiologia(),
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
                  'Evolução',
                  style: TextStyle(
                    color: Color.fromARGB(156, 31, 99, 124),
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onTap: () {
                // Navegar para a próxima tela
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EstudoLesoesEvolucao(),
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
                  'Presença de infecção',
                  style: TextStyle(
                    color: Color.fromARGB(156, 31, 99, 124),
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onTap: () {
                // Navegar para a próxima tela
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EstudoLesoesinfeccao(),
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
                  'Comprometimento tecidual',
                  style: TextStyle(
                    color: Color.fromARGB(156, 31, 99, 124),
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onTap: () {
                // Navegar para a próxima tela
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const EstudoLesoesComprometimentoTecidual(),
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
                  'Tipos de feridas',
                  style: TextStyle(
                    color: Color.fromARGB(156, 31, 99, 124),
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onTap: () {
                // Navegar para a próxima tela
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EstudoLesoesTiposFeridas(),
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
