class Account {
  String accountID;
  String address;
  String birthday;
  String email;
  String fullName;
  int isCarOwner;
  String phoneNumber;

  Account({
  this.accountID = "",
  this.address = "",
  this.birthday = "",
  this.email = "",
  this.fullName = "",
  this.isCarOwner = 0,
  this.phoneNumber = "",
});

  // Factory method to create an Account instance from a Map
  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      accountID: map['accountID'],
      address: map['address'],
      birthday: map['birthday'],
      email: map['email'],
      fullName: map['fullName'],
      isCarOwner: map['isCarOwner'],
      phoneNumber: map['phoneNumber'],
    );
  }

  // Method to convert Account instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'accountID': accountID,
      'address': address,
      'birthday': birthday,
      'email': email,
      'fullName': fullName,
      'isCarOwner': isCarOwner,
      'phoneNumber': phoneNumber,
    };
  }
}
