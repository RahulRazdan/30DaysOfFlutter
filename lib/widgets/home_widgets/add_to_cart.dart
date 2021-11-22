import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/core/store.dart';
import 'package:flutter_application/models/billu.dart';
import 'package:flutter_application/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isAdded = _cart.items.contains(catalog) ? true : false;
    return ElevatedButton(
        onPressed: () {
          if (!isAdded) {
            AddMutation(catalog);
          }
        },
        child: isAdded
            ? const Icon(Icons.done)
            : const Icon(CupertinoIcons.cart_badge_plus),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(const StadiumBorder())));
  }
}
