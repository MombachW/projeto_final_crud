class Vagas {

  final String id;
  final String parkingSpotNumber;
  final String licensePlateCar;
  final String brandCar;
  final String modelCar;
  final String registrationDate;
  final String colorCar;
  final String responsibleName;
  final String apartment;
  final String block;

  Vagas(this.id, this.parkingSpotNumber, this.licensePlateCar , this.brandCar , this.modelCar , this.registrationDate , this.colorCar , this.responsibleName , this.apartment ,this.block);

  Vagas.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        parkingSpotNumber = json['parkingSpotNumber'],
        licensePlateCar = json['licensePlateCar'],
        brandCar = json['brandCar'],
        modelCar = json['modelCar'],
        registrationDate = json['registrationDate'],
        colorCar = json['colorCar'],
        responsibleName = json['responsibleName'],
        apartment = json['apartment'],
        block = json['block'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'parkingSpotNumber' : parkingSpotNumber,
    'licensePlateCar' : licensePlateCar,
    'brandCar' : brandCar,
    'modelCar' : modelCar,
    'registrationDate' : registrationDate,
    'colorCar' : colorCar,
    'responsibleName' : responsibleName,
    'apartment' : apartment,
    'block' : block,
  };
}