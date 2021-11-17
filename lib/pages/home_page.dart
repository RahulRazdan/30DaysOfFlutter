import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/models/billu.dart';
import 'package:flutter_application/widgets/drawer.dart';
import 'package:flutter_application/widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var billuJson =
        jsonDecode(await rootBundle.loadString("assets/files/billu.json"));
    BilluModel.items =
        List.from(billuJson["items"]).map((item) => Item.forMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(10, (index) => BilluModel.items[0]);

    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: Vx.m32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CatalogHeader(),
            if (BilluModel.items.isNotEmpty)
              const CatalogList().expand()
            else
              const Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    ));
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Billu App".text.xl5.bold.color(Colors.blueAccent).make(),
        "Always Trending".text.xl2.make()
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CatalogItem(catalogItem: BilluModel.items[index]);
        },
        itemCount: BilluModel.items.length);
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalogItem;
  const CatalogItem({Key? key, required this.catalogItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: catalogItem.image),
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
                ElevatedButton(
                    onPressed: () {},
                    child: "Buy".text.make(),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all(const StadiumBorder())))
              ],
            ).pOnly(right: 8)
          ],
        ))
      ],
    )).white.roundedSM.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(image).box.rounded.p8.color(Colors.amber).make().p16();
  }
}
