import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/billu.dart';
import 'package:flutter_application/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isAdded = _cart.items.contains(widget.catalog) ? true : false;
    return ElevatedButton(
        onPressed: () {
          if (!isAdded) {
            isAdded = !isAdded;
            final _catalog = BilluModel();
            _cart.model = _catalog;
            _cart.add(widget.catalog);
            setState(() {});
          }
        },
        child: isAdded
            ? const Icon(Icons.done)
            : const Icon(CupertinoIcons.cart_badge_plus),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(const StadiumBorder())));
  }
}
