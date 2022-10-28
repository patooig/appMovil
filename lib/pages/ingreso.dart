import 'package:flutter/material.dart';

import 'package:demo_login/services/ingresoService.dart';

class Ingreso extends StatefulWidget {
  const Ingreso({super.key});

  @override
  State<Ingreso> createState() => _IngresoState();
}

class _IngresoState extends State<Ingreso> {
  TextEditingController titulo = TextEditingController();
  TextEditingController texto = TextEditingController();

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
              controller: titulo,
            )),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Texto"),
              maxLines: 1,
              controller: titulo,
            )),
        ElevatedButton(
          onPressed: () {
            //a.ingresarDatos(titulo.toString(), texto.toString());
          },
          child: const Text('Guardar'),
        )
      ]),
    );
  }
}

Future<void> validarDatos(String titulo, String texto) async {
  final response = await ingDatos().ingresarDatos(titulo, texto);
}
