import 'package:flutter_application/core/store.dart';
import 'package:flutter_application/models/billu.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
