class AttributeItemModel {
  AttributeItemModel({
    this.phoneNumberText,
    this.passwordAccountText,
    this.fullNameText,
    this.addressText,
    this.emailText,
    this.birthdayText,
    this.isCarOwnerText,
    this.id,
  }) {
    phoneNumberText = "";
    passwordAccountText = "";
    fullNameText = "";
    addressText = "";
    emailText = "";
    birthdayText = "";
    isCarOwnerText = "";
    id = "";
  }

  String? phoneNumberText;

  String? passwordAccountText;

  String? fullNameText;

  String? addressText;

  String? emailText;

  String? birthdayText;

  String? isCarOwnerText;

  String? id;
}
