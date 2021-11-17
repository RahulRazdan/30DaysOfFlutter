class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image);
}

class BilluModel {
  static final items = [
    Item(1, "HappyBillu", "want sweets", 999, "#fff",
        "assets/images/profile.jpg")
  ];
}
