import 'package:flutter/material.dart';
import 'package:flutter_application/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final String app = "First App :)";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Billu App")),
      body: Center(
        child: Text("Welcome To My $app"),
      ),
      drawer: const MyDrawer(),
    );
  }
}
