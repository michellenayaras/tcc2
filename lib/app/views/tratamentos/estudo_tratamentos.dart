import 'package:flutter/material.dart';

class EstudoTratamentos extends StatelessWidget {
  const EstudoTratamentos({Key? key}) : super(key: key);

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
          'Tratamentos',
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
                  'Bota de unna',
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
                //     builder: (context) => const EstudoTratamentosTransudato(),
                //   ),
                // );
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
                  'Gel com phmb( polihexametileno biguanida)',
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
                //     builder: (context) => const EstudoTratamentosExsudato(),
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
            const SizedBox(height: 5),
            ListTile(
              title: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  'Gaze com soro fisiológico 0,9% (sf)',
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
                //         const EstudoTratamentosExsudatoSeroso(),
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
            const SizedBox(height: 5),
            ListTile(
              title: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  'Rayon cobertura não-aderente',
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
                //         const EstudoTratamentosExsudatoSanguinolento(),
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
            const SizedBox(height: 5),
            ListTile(
              title: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  'Ácido graxo essencial',
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
                //         const EstudoTratamentosExsudatoPurulento(),
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
            const SizedBox(height: 5),
            ListTile(
              title: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  'Hidrocolóide em placa',
                  style: TextStyle(
                    color: Color.fromARGB(156, 31, 99, 124),
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onTap: () async {
                // // Navegar para a próxima tela
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) =>
                //         const EstudoTratamentosExsudatoFibrinoso(),
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
            const SizedBox(height: 5),
            ListTile(
              title: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  'Hidrogel sem alginato de cálcio e sódio',
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
                //         const EstudoTratamentosExsudatoPurulento(),
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
            const SizedBox(height: 5),
            ListTile(
              title: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  'Hidrogel com alginato de cálcio e sódio',
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
                //         const EstudoTratamentosExsudatoPurulento(),
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
            const SizedBox(height: 5),
            ListTile(
              title: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  'Hidrofibra sem prata',
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
                //         const EstudoTratamentosExsudatoPurulento(),
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
          ],
        ),
      ),
    );
  }
}
