class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image);

  factory Item.forMap(Map<String, dynamic> map) {
    return Item(map["id"], map["name"], map["desc"], map["price"], map["color"],
        map["image"]);
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };
}

class BilluModel {
  static final bModel = BilluModel._internal();

  BilluModel._internal();

  factory BilluModel() => bModel;

  static var items = [];

  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);
  static Item getByPosition(int position) => items[position];
}
