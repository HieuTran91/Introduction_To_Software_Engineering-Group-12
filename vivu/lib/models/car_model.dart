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