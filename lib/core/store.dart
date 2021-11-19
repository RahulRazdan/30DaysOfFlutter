import 'package:flutter_application/models/billu.dart';
import 'package:flutter_application/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late BilluModel model;
  late CartModel cart;

  MyStore() {
    model = BilluModel();
    cart = CartModel();
    cart.model = model;
  }
}
