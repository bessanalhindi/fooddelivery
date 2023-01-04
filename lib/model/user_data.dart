class UserData {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? address;
  String? imageUrl;
  bool isAdmin = false;

  UserData(this.id, this.firstName, this.lastName, this.email, this.phoneNumber,
      this.address, this.isAdmin,
      [this.imageUrl]);

  toMap() {
    return {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "address": address,
      "imageUrl": imageUrl,
      "isAdmin": isAdmin,
    };
  }

  // Map<String, dynamic> toMap() {
  //   //دالة ال toMap
  //   Map<String, dynamic> map = <String, dynamic>{};
  //   map['email'] = email;
  //   map['firstName'] = firstName;
  //   map['lastName'] = lastName;
  //   map['phoneNumber'] = phoneNumber;
  //   map['address'] = address;
  //   map['isMale'] = isMale;
  //   map['imageUrl'] = imageUrl;
  //
  //   return map;
  // }

  UserData.fromMap(Map<String, dynamic> map) {
    //دالة ال fromMap الي هو الكونستركتور
    email = map['email'];
    firstName = map['firstName'];
    lastName = map['lastName'];
    phoneNumber = map['phoneNumber'];
    address = map['address'];
    imageUrl = map['imageUrl'];
    isAdmin = map['isAdmin'];
  }
}
