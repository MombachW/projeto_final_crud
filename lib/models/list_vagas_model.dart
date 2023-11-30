import 'vagas_model.dart';

class ParkingSpotList {

  final List<Vagas> listParkingSpotModel;

  ParkingSpotList(this.listParkingSpotModel);

  ParkingSpotList.fromJson(List<dynamic> json):
        listParkingSpotModel = List.from(json).map((item) => Vagas.fromJson(item)).toList() ;

}