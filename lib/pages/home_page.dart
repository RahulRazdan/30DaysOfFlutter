import 'package:flutter/material.dart';
import 'package:flutter_application/models/billu.dart';
import 'package:flutter_application/widgets/drawer.dart';
import 'package:flutter_application/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final String app = "First App :)";

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(10, (index) => BilluModel.items[0]);

    return Scaffold(
      appBar: AppBar(title: const Text("Billu App")),
      body: ListView.builder(
        itemCount: dummyList.length,
        itemBuilder: (context, index) {
          return ItemWidget(item: dummyList[index]);
        },
      ),
      backgroundColor: Colors.amberAccent,
      drawer: const MyDrawer(),
    );
  }
}
