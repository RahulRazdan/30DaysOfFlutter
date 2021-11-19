import 'package:flutter/material.dart';
import 'package:flutter_application/models/billu.dart';
import 'package:flutter_application/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          "\$${catalog.price}"
              .text
              .bold
              .xl4
              .color(Colors.amber.shade900)
              .make(),
          AddToCart(
            catalog: catalog,
          ).wh(100, 50)
        ],
      ).p24(),
      backgroundColor: Colors.amber.shade100,
      body: SafeArea(
          bottom: false,
          child: Column(children: [
            Hero(tag: Key(catalog.image), child: Image.asset(catalog.image))
                .h48(context),
            Expanded(
                child: VxArc(
                    height: 30.0,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      color: Colors.amber,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name.text.xl4.bold.make(),
                          catalog.desc.text
                              .textStyle(context.captionStyle!)
                              .xl
                              .make(),
                          10.heightBox,
                          "Mera naam hai ek billu , ek billu baba ek billu"
                              .text
                              .textStyle(context.captionStyle!)
                              .make()
                              .p16()
                        ],
                      ).py32(),
                    )))
          ])),
    );
  }
}
