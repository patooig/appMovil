import 'dart:convert';
import 'package:flutter/material.dart';

import '../global.dart';
import 'package:demo_login/pages/login.dart';
import 'package:http/http.dart' as http;

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  Future<List<dynamic>> obtDatos() async {
    var url = Uri.parse("https://40fd422c6d4d.sa.ngrok.io/api/mensajes");
    final rep = await http.get(url);
    if (rep.statusCode == 200) {
      final List<dynamic> dataList = jsonDecode(rep.body);
      return dataList;
    } else {
      throw Exception("Fallo al obtener datos");
    }
  }

  Widget cuadro_indicador(
      DateTime fecha, String? login, String? titulo, String? texto) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.all(2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              Colors.green,
              Colors.green[200]!,
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Text(fecha.toString()),
                  Text(login.toString()),
                  Text(titulo.toString()),
                  Text(texto.toString())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supermensajes'),
      ),
      body: FutureBuilder<List<dynamic>>(
          future: obtDatos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              AsyncSnapshot<List> ls = snapshot;
              List<MensajesApi>? lll = ls.data?.cast<MensajesApi>();
              for (int i = 0; i < lll!.length; i++) {
                print((date) => lll[i].fecha);
                print((String) => lll[i].login);
                print((String) => lll[i].titulo);
                print((String) => lll[i].texto);
              }
            } else if (snapshot.hasError) {
              return const Text("ERROR");
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset('assets/usuario.png', fit: BoxFit.contain),
            ),
            Center(
              child: Text('Bienvenid@, ' + Global.login),
            ),
            ListTile(
              title: const Text('Agregar'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Integrantes'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Salir'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const login()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class MensajesApi {
  MensajesApi({
    required this.id,
    required this.login,
    required this.titulo,
    required this.texto,
    required this.fecha,
  });

  int id;
  String login;
  String titulo;
  String texto;
  DateTime fecha;

  factory MensajesApi.fromJson(Map<String, dynamic> json) => MensajesApi(
        id: json["id"],
        login: json["login"],
        titulo: json["titulo"],
        texto: json["texto"],
        fecha: DateTime.parse(json["fecha"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "login": login,
        "titulo": titulo,
        "texto": texto,
        "fecha": fecha.toIso8601String(),
      };
}
