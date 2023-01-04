class PopularMenu {
  String? id;
  String? title;
  String? image;
  String? subTitle;
  String? price;
  String? description;
  bool? isFavorite = false;
  bool? isShopping = false;

  PopularMenu({this.title, this.image, this.subTitle, this.price,this.description});

  toMap() {
    return {
      "image": image,
      "title": title,
      "subTitle": subTitle,
      "description":description,
      "price": price,
      "isShopping": isShopping,
    };
  }

  PopularMenu.fromMap(Map<String, dynamic> map) {
    // print('=============================================');
    // print(map.toString());
    // print('=============================================');
    image = map["image"];
    title = map["title"];
    subTitle = map["subTitle"];
    description = map["description"];
    price = map["price"];
    isShopping = map["isShopping"];
  }
}
