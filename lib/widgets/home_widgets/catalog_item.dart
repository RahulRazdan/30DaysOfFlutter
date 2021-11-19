import 'package:flutter/material.dart';
import 'package:flutter_application/models/billu.dart';
import 'package:flutter_application/models/cart.dart';
import 'package:flutter_application/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_application/widgets/home_widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  final Item catalogItem;
  const CatalogItem({Key? key, required this.catalogItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalogItem.id.toString()),
            child: CatalogImage(image: catalogItem.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalogItem.name.text.lg.bold.make(),
            catalogItem.desc.text.textStyle(context.captionStyle!).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalogItem.price}".text.bold.xl.make(),
                AddToCart(catalog: catalogItem)
              ],
            ).pOnly(right: 8)
          ],
        ))
      ],
    )).white.roundedSM.square(150).make().py16();
  }
}
