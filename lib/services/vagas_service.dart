import 'dart:convert';
import 'package:projeto_final_crud/models/vagas_model.dart';
import 'package:http/http.dart' as http;
import '../models/list_vagas_model.dart';
import '../models/vagas_model.dart';


class VagasService{
  String urlGetListParkingSpot = "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/list";
  String salvar = "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/save";
  String edit = "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/edit";
  String delete = "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/delete";
  dynamic _response;
  VagasService(){
    _response="";
  }
//conferir
  Future<ParkingSpotList> fetchListVagas() async {
    _response = await http.get(Uri.parse(urlGetListParkingSpot));
    if (_response.statusCode == 200) {
      List<dynamic> list = json.decode(_response.body);
      return ParkingSpotList.fromJson(list);
    } else {
      throw Exception('Failed to load cote');
    }
  }


  Future<dynamic> fetchVagaModel(Vagas objeto) async {
    _response = await http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        body: json.encode(objeto.toJson()) ,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        }
    );
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      Map<String, dynamic> retorno = json.decode(_response.body);
      return Vagas.fromJson(retorno) ;
    } else {
      return false;
    }
  }
  Future<dynamic> fetchDeleteGarage(Vagas objeto) async {
    _response = await http.post(Uri.parse(delete+"/"+objeto.id.toString()));
    if (_response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> fetchEditGarage(Vagas objeto) async {
    _response = await http.post(Uri.parse(edit),body: json.encode(objeto.toJson()),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        }
    );
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      return _response.body;
    } else {
      return false;
    }
  }

  Future<dynamic> fetchPostGarage(Vagas objeto) async {
    _response = await http.post(Uri.parse(salvar),body: json.encode(objeto.toJson()) ,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        }
    );
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      Map<String, dynamic> retorno = json.decode(_response.body);
      return Vagas.fromJson(retorno) ;
    } else {
      return false;
    }

  }

}







