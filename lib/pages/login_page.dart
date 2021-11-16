import 'package:flutter/material.dart';
import 'package:flutter_application/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome() async {
    bool? isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
            child: Column(children: [
          Image.asset("assets/images/login_bck.png", fit: BoxFit.cover),
          const SizedBox(height: 20.0),
          Text("Welcome $name",
              style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20.0),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter UserName", labelText: "UserName"),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value != null && value.length < 6) {
                          return "Password length should be atleast 6";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                    )
                  ],
                ),
              )),
          const SizedBox(height: 40.0),
          Material(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
            child: InkWell(
              onTap: () => moveToHome(),
              child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: changeButton ? 50 : 120,
                  height: 50,
                  alignment: Alignment.center,
                  child: changeButton
                      ? const Icon(
                          Icons.done,
                          color: Colors.black,
                        )
                      : const Text("Login",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18))),
            ),
          ),
        ])));
  }
}
