import 'package:flutter/material.dart';
import 'package:tcc/app/views/cicatrizacao/fases_cicatrizacao.dart';
import 'package:tcc/app/views/cicatrizacao/tipos_cicatrizacao.dart';

class EstudoCicatrizacao extends StatelessWidget {
  const EstudoCicatrizacao({Key? key}) : super(key: key);

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
          'Cicatrização',
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
                  'Tipos de cicatrização de feridas',
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
                        const EstudoCicatrizacaoTiposCicatrizacao(),
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
                  'Fases da cicatrização de feridas',
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
                        const EstudoCicatrizacaoFasesCicatrizacao(),
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
                  'Formas de cicatrização',
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) =>
                //         const EstudoCicatrizacaoMateriaisNecessarios(),
                //   ),
                // );
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
