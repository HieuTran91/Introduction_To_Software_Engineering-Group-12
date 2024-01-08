class Rental {
  String rentalID;
  String carID;
  String customerID;
  String returnTime;
  String pickupTime;
  int rentalStatus;

  Rental({
  this.rentalID = "",
  this.carID = "",
  this.customerID = "",
  this.returnTime = "",
  this.pickupTime = "",
  this.rentalStatus = 0,
});

  // Factory method to create an Account instance from a Map
  factory Rental.fromMap(Map<String, dynamic> map) {
    return Rental(
      rentalID: map['rentalID'],
      carID: map['carID'],
      customerID: map['customerID'],
      returnTime: map['returnTime'],
      pickupTime: map['pickupTime'],
      rentalStatus: map['rentalStatus'],
    );
  }

  // Method to convert Account instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'rentalID': rentalID,
      'carID': carID,
      'customerID': customerID,
      'returnTime': returnTime,
      'pickupTime': pickupTime,
      'rentalStatus': rentalStatus,
    };
  }
}