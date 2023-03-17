import 'package:flutter/material.dart';
import 'package:tcc/app/views/secrecoes/exsudato.dart';
import 'package:tcc/app/views/secrecoes/exsudato_fibrinoso.dart';
import 'package:tcc/app/views/secrecoes/exsudato_purulento.dart';
import 'package:tcc/app/views/secrecoes/exsudato_sanguinolento.dart';
import 'package:tcc/app/views/secrecoes/exsudato_seroso.dart';
import 'package:tcc/app/views/secrecoes/transudato.dart';
import 'package:tcc/app/views/tecidos/tecido_nervoso.dart';

class EstudoSecrecoes extends StatelessWidget {
  const EstudoSecrecoes({Key? key}) : super(key: key);

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
          'Secreções',
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
                  'Transudato',
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
                    builder: (context) => const EstudoSecrecoesTransudato(),
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
                  'Exsudato',
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
                    builder: (context) => const EstudoSecrecoesExsudato(),
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
                  'Exsudato seroso',
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
                    builder: (context) => const EstudoSecrecoesExsudatoSeroso(),
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
                  'Exsudato sanguinolento',
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
                        const EstudoSecrecoesExsudatoSanguinolento(),
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
                  'Exsudato purulento',
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
                        const EstudoSecrecoesExsudatoPurulento(),
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
                  'Exsudato fibrinoso',
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
                        const EstudoSecrecoesExsudatoFibrinoso(),
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
