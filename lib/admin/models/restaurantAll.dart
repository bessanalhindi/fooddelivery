class RestaurantAll {
  String? id;
  String? image;
  String? name;
  String? time;
  String? imageRestaurantUrl;
  String? description;
  String?phoneNumber;
  bool? isFavorite = false;
  RestaurantAll({
    this.image,
    this.name,
    this.time,
    this.imageRestaurantUrl,
    this.description,
    this.phoneNumber,
  });

  toMap() {
    return {
      "image": image,
      "name": name,
      "time": time,
      "imageRestaurantUrl": imageRestaurantUrl,
      "description": description,
      "phoneNumber": phoneNumber,

    };
  }

  RestaurantAll.fromMap(Map<String, dynamic> map) {
    image = map['image'];
    name = map['name'];
    time = map['time'];
    imageRestaurantUrl = map["imageRestaurantUrl"];
    description = map["description"];
    phoneNumber = map["phoneNumber"];

  }
}
