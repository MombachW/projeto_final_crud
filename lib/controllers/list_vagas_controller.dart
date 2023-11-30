

import 'package:get/get.dart';
import 'package:projeto_final_crud/models/vagas_model.dart';

import 'package:projeto_final_crud/services/vagas_service.dart';






class ListVagasController extends GetxController {

  VagasService vagasService = VagasService();

  var isLoading = false.obs;

  var listVagasObs = <Vagas>[].obs;

  static ListVagasController get listVagas => Get.find();
  //conferir
  Future<dynamic> listParkingSpot()  async {
    isLoading.value = true;
    var list = await vagasService.fetchListVagas();
    listVagasObs.value = list.listParkingSpotModel;
    isLoading.value = false;
    update();
    return listVagasObs;
  }


  Future<dynamic> post(Vagas objeto)  async {
    isLoading.value = true;
    var list = await vagasService.fetchPostGarage(objeto);
    isLoading.value = false;
    update();
    return list;
  }

  Future<dynamic> deleteParkingSpot(Vagas objeto)  async {
    isLoading.value = true;
    var response = await vagasService.fetchDeleteGarage(objeto);
    isLoading.value = false;
    update();
    return response;
  }

  Future<dynamic> editParkingSpot(Vagas objeto)  async {
    isLoading.value = true;
    var response = await vagasService.fetchEditGarage(objeto);
    isLoading.value = false;
    update();
    return response;
  }
}
