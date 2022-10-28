import 'package:flutter/material.dart';

class Ingreso extends StatefulWidget {
  const Ingreso({super.key});

  @override
  State<Ingreso> createState() => _IngresoState();
}

class _IngresoState extends State<Ingreso> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar mensajes'),
        backgroundColor: Colors.cyan,
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Título"),
            maxLines: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Texto"),
            maxLines: 1,
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Guardar'),
        )
      ]),
    );
  }
}
