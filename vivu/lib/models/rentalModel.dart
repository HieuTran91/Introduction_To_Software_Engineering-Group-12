class AttributeItemModel {
  AttributeItemModel(
      {this.rentalID,
      this.carID,
      this.customerID,
      this.pickupTime,
      this.returnTime,
      this.rentalPrice,
      this.rentalStatus,
      this.rentalLocationID,
      this.paymentID}) {
    rentalID = "";
    carID = "";
    customerID = "";
    pickupTime = "";
    returnTime = "";
    rentalPrice = "";
    rentalStatus = "";
    rentalLocationID = "";
    paymentID = "";
  }

  String? rentalID;

  String? carID;

  String? customerID;

  String? pickupTime;

  String? returnTime;

  String? rentalPrice;

  String? rentalStatus;

  String? rentalLocationID;

  String? paymentID;
}
