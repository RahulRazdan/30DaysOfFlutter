import 'package:flutter_application/models/billu.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  late BilluModel _billuModel;
  final List<int> _itemIds = [];

  BilluModel get billuModel => _billuModel;

  set model(BilluModel model) {
    _billuModel = model;
  }

  List<Item> get items =>
      _itemIds.map((id) => _billuModel.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
