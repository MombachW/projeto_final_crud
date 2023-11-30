
import 'package:flutter/material.dart';

import '../screens/Cria_Vaga.dart';
import 'package:projeto_final_crud/screens/Listar_Vagas.dart';

Widget Menu(BuildContext context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("API de vagas do Uiliao",
            style: TextStyle(color: Color.fromRGBO(63, 63, 63, 1)),),
          accountEmail: Text("william_mombach@estudante.sc.senai.br",
            style: TextStyle(color: Color.fromRGBO(63, 63, 63, 1)),),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.network(
              'https://cdn-icons-png.flaticon.com/128/3275/3275371.png',
            ),

          ),
          decoration: BoxDecoration(
            color: Color.fromRGBO(192, 192, 192, 1), // Cor de fundo do UserAccountsDrawerHeader
          ),
        ),
        ListTile(
          title: Text(
            "Home",
            style: TextStyle(color: Color.fromRGBO(63, 63, 63, 1)),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CriaVaga()),
            );
          },
        ),
        ListTile(
          title: Text(
            "Lista",
            style: TextStyle(color: Color.fromRGBO(63, 63, 63, 1)),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListaVagas()),
            );
          },
        ),
        ListTile(
          title: Text(
            "Create",
            style: TextStyle(color: Color.fromRGBO(63, 63, 63, 1)),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CriaVaga()),
            );
          },
        ),
      ],
    ),
  );
}



