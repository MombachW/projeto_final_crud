import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/Menu.dart';
import '../controllers/list_vagas_controller.dart';
import '../models/vagas_model.dart';

class CriaVaga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Chave para identificar e validar o formulário
    final _formKey = GlobalKey<FormState>();

    // Controladores para os campos do formulário
    final _parkingSpotNumberController = TextEditingController();
    final _licensePlateCarController = TextEditingController();
    final _brandCarController = TextEditingController();
    final _modelCarController = TextEditingController();
    final _colorCarController = TextEditingController();
    final _responsibleNameController = TextEditingController();
    final _apartamentController = TextEditingController();
    final _blockController = TextEditingController();

    // Instância do controlador para manipular a lógica de estacionamento
    var controller = ListVagasController.listVagas;

    // Função para validar os campos do formulário
    String? validateFormField(String value) {
      if (value.isEmpty) {
        return 'Por favor, insira algum texto';
      }
      return null;
    }

    // Função para lidar com o envio do formulário
    void handleSubmit() async {
      // Criar um objeto do modelo com os dados do formulário
      Vagas criaVaga = Vagas(
        "",
        _parkingSpotNumberController.text,
        _licensePlateCarController.text,
        _brandCarController.text,
        _modelCarController.text,
        "",
        _colorCarController.text,
        _responsibleNameController.text,
        _apartamentController.text,
        _blockController.text,
      );

      // Chamar o método de postagem do controlador e aguardar a resposta
      var response = await controller.post(criaVaga);

      // Exibir mensagem de sucesso ou erro com base na resposta
      if (response != false) {
        Get.snackbar(
          "Sucesso",
          "Salvo com Sucesso",
          icon: Icon(Icons.check, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.lightGreen,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          "Errouu",
          "Não funfou",
          icon: Icon(Icons.error, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.white,
        );
      }
    }

    return Scaffold(
      drawer: Menu(context),
      appBar: AppBar(
        title: Text(
            'Novo Registro',
            style: TextStyle(color: Color.fromRGBO(53, 53, 53, 1)),),

        backgroundColor: Color.fromRGBO(192, 192, 192, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Color.fromRGBO(192, 192, 192, 1),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),

            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Número da Vaga',
                        labelStyle: TextStyle(color: Color.fromRGBO(53, 53, 53, 1)),
                      ),
                      validator: (value) => validateFormField(value!),
                      controller: _parkingSpotNumberController,
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Placa do Carro',
                        labelStyle: TextStyle(color: Color.fromRGBO(53, 53, 53, 1)),
                      ),
                      validator: (value) => validateFormField(value!),
                      controller: _licensePlateCarController,
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Marca do Carro',
                        labelStyle: TextStyle(color: Color.fromRGBO(53, 53, 53, 1)),
                      ),
                      validator: (value) => validateFormField(value!),
                      controller: _brandCarController,
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Modelo do Carro',
                        labelStyle: TextStyle(color: Color.fromRGBO(53, 53, 53, 1)),
                      ),
                      validator: (value) => validateFormField(value!),
                      controller: _modelCarController,
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Cor do Carro',
                        labelStyle: TextStyle(color: Color.fromRGBO(53, 53, 53, 1)),
                      ),
                      validator: (value) => validateFormField(value!),
                      controller: _colorCarController,
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nome do Responsável',
                        labelStyle: TextStyle(color: Color.fromRGBO(53, 53, 53, 1)),
                      ),
                      validator: (value) => validateFormField(value!),
                      controller: _responsibleNameController,
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Apartamento',
                        labelStyle: TextStyle(color: Color.fromRGBO(53, 53, 53, 1)),
                      ),
                      validator: (value) => validateFormField(value!),
                      controller: _apartamentController,
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Bloco',
                        labelStyle: TextStyle(color: Color.fromRGBO(53, 53, 53, 1)),
                      ),
                      validator: (value) => validateFormField(value!),
                      controller: _blockController,
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text('Enviar', style: TextStyle(color: Colors.white)),
                      onPressed: handleSubmit,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
