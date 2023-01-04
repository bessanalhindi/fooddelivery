class RestaurantDetails {
  String? id;
  String? imageMenu;
  String? nameMenu;
  String? priceMenu;
  String? descriptionMenu;
  int number = 1;

  bool isFavorite = false;

  RestaurantDetails({
    this.id,
    this.imageMenu,
    this.nameMenu,
    this.priceMenu,
    this.descriptionMenu,
  });

  toMap() {
    return {
      "id": id,
      "imageMenu": imageMenu,
      "nameMenu": nameMenu,
      "priceMenu": priceMenu,
      "descriptionMenu": descriptionMenu,
    };
  }

  RestaurantDetails.fromMap(Map<String, dynamic> map) {
    id=map['id'];
    imageMenu = map["imageMenu"];
    nameMenu = map["nameMenu"];
    priceMenu = map["priceMenu"];
    descriptionMenu = map["descriptionMenu"];
  }
}
