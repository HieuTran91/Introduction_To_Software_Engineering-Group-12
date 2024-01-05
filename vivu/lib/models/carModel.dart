class AttributeItemModel {
  AttributeItemModel({
    this.seatsImage,
    this.seatsText,
    this.modelText,
    this.transmissionText,
    this.fuelTypeText,
    this.yearReleaseText,
    this.priceText,
    this.carStatusText,
    this.id,
  }) {
    seatsImage = "";
    seatsText = "";
    fourText = "";
    id = "";
    modelText = "";
    transmissionText = "";
    fuelTypeText = "";
    yearReleaseText = "";
    priceText = "";
    carStatusText = "";
  }

  String? seatsImage;

  String? seatsText;

  String? fourText;

  String? modelText;

  String? transmissionText;

  String? fuelTypeText;

  String? yearReleaseText;

  String? priceText;

  String? carStatusText;

  String? id;
}
