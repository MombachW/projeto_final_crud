import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/Menu.dart';
import '../controllers/list_vagas_controller.dart';
import '../models/vagas_model.dart';
import '../screens/Editar_Vagas.dart';

class ListaVagas extends StatefulWidget {
  const ListaVagas({Key? key}) : super(key: key);

  @override
  State<ListaVagas> createState() => _ListaVagasState();
}

class _ListaVagasState extends State<ListaVagas> {
  var controller = ListVagasController.listVagas;

  @override
  void initState() {
    super.initState();
    _carregar_dados();
  }

  Future<void> _carregar_dados() async {
    await controller.listParkingSpot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(context),
      appBar: AppBar(
        title: Text(
          'Lista de Estacionamentos',
          style: TextStyle(color: Color.fromRGBO(53, 53, 53, 1)),
        ),
        backgroundColor: Color.fromRGBO(192, 192, 192, 1),
        iconTheme: IconThemeData(color: Color.fromRGBO(53, 53, 53, 1)),
        textTheme: TextTheme(
          headline6: TextStyle(color: Color.fromRGBO(53, 53, 53, 1), fontSize: 20.0),
        ),
      ),
      body: FutureBuilder(
        future: _carregar_dados(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Obx(
                  () => ListView.builder(
                itemCount: controller.listVagasObs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      controller.listVagasObs[index].licensePlateCar,
                      style: TextStyle(color: Color.fromRGBO(53, 53, 53, 1)),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Get.to(
                              Editar_Vagas(
                                objeto: controller.listVagasObs[index],
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            var response = await controller.deleteParkingSpot(
                              controller.listVagasObs[index],
                            );
                            if (response != false) {
                              Get.snackbar("Sucesso", "Deletado com sucesso");
                              await controller.listParkingSpot();
                            } else {
                              Get.snackbar("Erro", "Erro ao deletar");
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
