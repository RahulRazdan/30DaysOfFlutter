import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/core/store.dart';
import 'package:flutter_application/models/billu.dart';
import 'package:flutter_application/models/cart.dart';
import 'package:flutter_application/utils/routes.dart';
import 'package:flutter_application/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_application/widgets/home_widgets/catalog_list.dart';
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
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        floatingActionButton: VxBuilder(
            mutations: const {AddMutation, RemoveMutation},
            builder: (context, _, __) {
              return FloatingActionButton(
                onPressed: () {
                  context.vxNav.push(Uri.parse(MyRoutes.cartRoute));
                },
                child: const Icon(CupertinoIcons.cart),
              ).badge(
                  color: Colors.red,
                  size: 22,
                  count: _cart.items.length,
                  textStyle:
                      const TextStyle(fontSize: 13, color: Colors.white));
            }),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatalogHeader(),
                if (BilluModel.items.isNotEmpty)
                  const CatalogList().py16().expand()
                else
                  Center(
                      child: const CircularProgressIndicator()
                          .centered()
                          .py16()
                          .expand())
              ],
            ),
          ),
        ));
  }
}
