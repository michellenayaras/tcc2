import 'package:flutter/material.dart';
import 'package:tcc/app/views/cicatrizacao/estudo_cicatrizacao.dart';
import 'package:tcc/app/views/curativos/estudo_curativos.dart';
import 'package:tcc/app/views/home_page.dart';
import 'package:tcc/app/views/secrecoes/estudo_secrecoes.dart';
import 'app/views/lesoes/estudo_lesoes.dart';
import 'app/views/tecidos/estudo_tecidos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Gym App',
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/estudo_lesoes': (context) => const EstudoLesoes(),
        '/estudo_tecidos': (context) => const EstudoTecidos(),
        '/estudo_curativos': (context) => const EstudoCurativos(),
        '/estudo_cicatrizacao': (context) => const EstudoCicatrizacao(),
        '/estudo_secrecoes': (context) => const EstudoSecrecoes(),
      },
    );
  }
}
