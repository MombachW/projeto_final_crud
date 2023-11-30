import 'package:get/get.dart';
import 'package:projeto_final_crud/controllers/list_vagas_controller.dart';

class ControllerBinding implements Bindings  {
  @override
  void dependencies(){
    Get.lazyPut<ListVagasController>(() => ListVagasController());
    //Get.lazyPut<ThemeController>(() => ThemeController());
  }

}