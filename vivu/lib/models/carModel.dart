// class Car{
//   Car({
//     this.seatsImage,
//     this.seatsText,
//     this.modelText,
//     this.transmissionText,
//     this.fuelTypeText,
//     this.yearReleaseText,
//     this.priceText,
//     this.carStatusText,
//     this.id,
//   }) {
//     seatsImage = "";
//     seatsText = "";
//     fourText = "";
//     id = "";
//     modelText = "";
//     transmissionText = "";
//     fuelTypeText = "";
//     yearReleaseText = "";
//     priceText = "";
//     carStatusText = "";
//   }

//   String? seatsImage;

//   String? seatsText;

//   String? fourText;

//   String? modelText;

//   String? transmissionText;

//   String? fuelTypeText;

//   String? yearReleaseText;

//   String? priceText;

//   String? carStatusText;

//   String? id;
// }

import 'dart:ffi';

class Car {
  String carID;
  String carCompany;
  String model;
  int seats;
  String transmission;
  String fuelType;
  int yearRelease;
  Float price;
  String carStatus;
  String carOwnerID;

  // Constructor
  Car({
    required this.carID,
    required this.carCompany,
    required this.model,
    required this.seats,
    required this.transmission,
    required this.fuelType,
    required this.yearRelease,
    required this.price,
    required this.carStatus,
    required this.carOwnerID,
  }){

  }

  // Factory method to create an Account instance from a Map
  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      carID: map['carID'],
      carCompany: map['carCompany'],
      model: map['model'],
      seats: map['seats'],
      transmission: map['transmission'],
      fuelType: map['fuelType'],
      yearRelease: map['yearRelease'],
      price: map['price'],
      carStatus: map['carStatus'],
      carOwnerID: map['carOwnerID'],
    );
  }

  // Method to convert Account instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'carID': carID,
      'carCompany': carCompany,
      'model': model,
      'seats': seats,
      'fuelType': fuelType,
      'yearRelease': yearRelease,
      'price': price,
      'carStatus': carStatus,
      'carOwnerID': carOwnerID,
    };
  }
}