import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:projeto_final_crud/screens/Cria_Vaga.dart';
import 'controllerBinding.dart';
void main() {

  ControllerBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Parking Spot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CriaVaga(),
    );
  }
}

