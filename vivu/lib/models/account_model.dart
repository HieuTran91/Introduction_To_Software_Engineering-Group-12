class AccountModel {
  AccountModel({
    this.phoneNumber,
    //this.passwordAccount,
    this.fullName,
    this.address,
    this.email,
    this.birthday,
    this.isCarOwner,
    this.id,
  }) {
    phoneNumber = "";
    //passwordAccount = "";
    fullName = "";
    address = "";
    email = "";
    birthday = "";
    isCarOwner = "";
    id = "";
  }

  String? phoneNumber;

  //String? passwordAccount;

  String? fullName;

  String? address;

  String? email;

  String? birthday;

  String? isCarOwner;

  String? id;
}
