import 'package:flutter/material.dart';
import 'package:flutter_application/models/billu.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: GridTile(
        header: Container(
          child: Text(
            item.name,
            style: const TextStyle(color: Colors.black),
          ),
          decoration: const BoxDecoration(color: Colors.amber),
          padding: const EdgeInsets.all(12),
        ),
        child: Image.asset(item.image),
        footer: Container(
          child: Text(
            item.desc,
            style: const TextStyle(color: Colors.black),
          ),
          decoration: const BoxDecoration(color: Colors.amber),
          padding: const EdgeInsets.all(12),
        ),
      ),
    );
  }
}
