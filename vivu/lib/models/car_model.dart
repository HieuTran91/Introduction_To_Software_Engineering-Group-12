class Car {
  String carID;
  String carCompany;
  String model;
  int seats;
  String transmission;
  String fuelType;
  int yearRelease;
  double price;
  int carStatus;
  String carOwnerID;

  // Constructor
  Car({
    this.carID = "",
    this.carCompany = "",
    this.model = "",
    this.seats = 0,
    this.transmission = "",
    this.fuelType = "",
    this.yearRelease= 0,
    this.price= 0,
    this.carStatus= 0,
    this.carOwnerID= "",
  }){

  }

  // Factory method to create an Account instance from a Map
  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      carCompany: map['carCompany'],
      carID: map['carID'],
      carOwnerID: map['carOwnerID'],
      carStatus: map['carStatus'],
      fuelType: map['fuelType'],
      model: map['model'],
      price: map['price'],
      seats: map['seats'],
      transmission: map['transmission'],
      yearRelease: map['yearRelease'],
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