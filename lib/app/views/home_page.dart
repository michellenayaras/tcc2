import 'package:flutter/material.dart';
import 'package:tcc/app/views/curativos/estudo_curativos.dart';
import 'package:tcc/app/views/secrecoes/estudo_secrecoes.dart';
import 'package:tcc/app/views/tecidos/estudo_tecidos.dart';
import 'package:tcc/app/views/tratamentos/estudo_tratamentos.dart';
import 'cicatrizacao/estudo_cicatrizacao.dart';
import 'lesoes/estudo_lesoes.dart';

// ignore: non_constant_identifier_names
void PaginaEstudoLesoes(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => const EstudoLesoes()),
  );
}

// ignore: non_constant_identifier_names
void PaginaEstudoTecidos(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => const EstudoTecidos()),
  );
}

// ignore: non_constant_identifier_names
void PaginaEstudoCurativos(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => const EstudoCurativos()),
  );
}

// ignore: non_constant_identifier_names
void PaginaEstudoCicatrizacao(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => const EstudoCicatrizacao()),
  );
}

// ignore: non_constant_identifier_names
void PaginaEstudoSecrecoes(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => const EstudoSecrecoes()),
  );
}

// ignore: non_constant_identifier_names
void PaginaEstudoTratamentos(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => const EstudoTratamentos()),
  );
}

class HomePage extends StatefulWidget {
  //const HomePage({super.key});
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 249, 249),
        title: const Text(
          'Feridas: Estudo Fácil',
          style: TextStyle(
            color: Color.fromRGBO(70, 130, 180, 100),
            fontSize: 20.0,
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: true,
        toolbarHeight: 70.0,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Color.fromRGBO(70, 130, 180, 100),
              size: 40.0,
            ),
            onPressed: () {
              // Add your desired action here
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(158, 241, 241, 241),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 216, 214, 214)
                          .withOpacity(0.4),
                      blurRadius: 3,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Pesquisar',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 40),
              child: Text(
                "Acessados recentemente",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Roboto',
                  color: Color.fromRGBO(62, 132, 158, 100),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your desired action here
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                      backgroundColor: const Color.fromRGBO(109, 157, 197, 100),
                      fixedSize: const Size(170, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // value for the radius of the border
                      ),
                    ),
                    child: const Text(
                      "Fisiologia da pele",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add your desired action here
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                    backgroundColor: const Color.fromRGBO(109, 157, 197, 100),
                    fixedSize: const Size(170, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // value for the radius of the border
                    ),
                  ),
                  child: const Text(
                    "Tipos de tecidos",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Container(
              height: 340,
              margin: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 16, top: 1, bottom: 1),
                    padding: EdgeInsets.zero,
                    child: const Text(
                      'Categorias',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Roboto',
                        color: Color.fromRGBO(62, 132, 158, 100),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton(
                        context,
                        'Lesões',
                        'assets/images/scratch.png',
                        const EstudoLesoes(),
                      ),
                      buildButton(
                        context,
                        'Tecidos',
                        'assets/images/pele.png',
                        const EstudoTecidos(),
                      ),
                      buildButton(
                        context,
                        'Curativos',
                        'assets/images/curativo.png',
                        const EstudoCurativos(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton(
                        context,
                        'Cicatrização',
                        'assets/images/bleeding.png',
                        const EstudoCicatrizacao(),
                      ),
                      buildButton(
                        context,
                        'Secreções',
                        'assets/images/wound.png',
                        const EstudoSecrecoes(),
                      ),
                      buildButton(
                        context,
                        'Tratamentos',
                        'assets/images/alcohol.png',
                        const EstudoTratamentos(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtonRow(BuildContext context, List<List<dynamic>> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons
          .map(
              (button) => buildButton(context, button[0], button[1], button[2]))
          .toList(),
    );
  }

  Widget buildButton(
      BuildContext context, String text, String imagePath, Object? page) {
    final buttonWidth = MediaQuery.of(context).size.width * 0.26;
    final buttonHeight = MediaQuery.of(context).size.height * 0.12;
    final imageHeight = buttonHeight * 0.6;
    final textSpacing = buttonHeight * 0.02;
    return InkWell(
      onTap: () {
        if (page != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page as Widget));
        }
      },
      child: Ink(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          color: const Color.fromARGB(157, 250, 250, 250),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 3,
              //offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: imageHeight,
            ),
            SizedBox(height: textSpacing),
            Text(
              text,
              style: TextStyle(
                fontSize: buttonHeight * 0.14,
                color: const Color.fromARGB(156, 31, 99, 124), // cor do texto
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
