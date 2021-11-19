import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/core/store.dart';
import 'package:flutter_application/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "Cart".text.make(),
        ),
        backgroundColor: Colors.amber,
        body: Column(children: [
          _CartList().p32().expand(),
          const Divider(),
          _CartTotal()
        ]));
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemBuilder: (context, index) => Card(
                  child: ListTile(
                      title: _cart.items[index].name.text.make(),
                      leading: const Icon(Icons.done),
                      trailing: IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            _cart.remove(_cart.items[index]);
                            //setState(() {});
                          })),
                ),
            itemCount: _cart.items.length);
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        children: [
          "\$${_cart.totalPrice}".text.xl5.make().pOnly(left: 30.0),
          150.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: "Buying not supported".text.make()));
                  },
                  child: "Buy".text.color(Colors.white).make(),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.amber.shade900)))
              .w32(context)
        ],
      ),
    );
  }
}
