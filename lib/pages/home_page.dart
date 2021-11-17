import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/models/billu.dart';
import 'package:flutter_application/widgets/drawer.dart';
import 'package:flutter_application/widgets/item_widget.dart';

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
      appBar: AppBar(title: const Text("Billu App")),
      body: (BilluModel.items != null && BilluModel.items.isNotEmpty)
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
              itemCount: BilluModel.items.length,
              itemBuilder: (context, index) {
                return ItemWidget(item: BilluModel.items[index]);
              },
            )
          : const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
      backgroundColor: Colors.amberAccent,
      drawer: const MyDrawer(),
    );
  }
}
