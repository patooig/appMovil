import 'package:flutter/material.dart';

class Integrantes extends StatefulWidget {
  const Integrantes({super.key});

  @override
  State<Integrantes> createState() => _IntegrantesState();
}

class _IntegrantesState extends State<Integrantes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Integrantes'),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(children: [
          Image.asset(
            'assets/Ivonne.png',
            width: 230,
            height: 230,
          ),
          Text(
            'Ivonne Flores R.',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Image.asset(
            'assets/Pato.jpeg',
            width: 230,
            height: 230,
          ),
          Text(
            'Patricio Inostroza A.',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ]),
      )),
    );
  }
}
