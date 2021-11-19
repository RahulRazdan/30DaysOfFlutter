import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class _CartList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) => Card(
              child: ListTile(
                  title: "Item.1".text.make(),
                  leading: const Icon(Icons.done),
                  trailing: IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () {})),
            ),
        itemCount: 5);
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        children: [
          "\$9999".text.xl5.make().pOnly(left: 30.0),
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
