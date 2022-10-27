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
      body:
          Column(children: [Text('Ivonne Flores'), Text('Patricio Inostroza')]),
    );
  }
}
