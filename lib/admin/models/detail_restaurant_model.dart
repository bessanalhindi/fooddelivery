class MenuRestaurant {
  String? id;
  String? restId;
  String? imageMenu;
  String? nameMenu;
  String? priceMenu;

  MenuRestaurant(
      {this.id, this.restId, this.imageMenu, this.nameMenu, this.priceMenu});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "imageMenu": imageMenu,
      "nameMenu": nameMenu,
      "priceMenu": priceMenu,
    };
  }

  MenuRestaurant.fromMap(Map<String, dynamic> map) {

    id = map["id"];
    imageMenu = map["imageMenu"];
    nameMenu = map["nameMenu"];
    priceMenu = map["priceMenu"];
  }
}
