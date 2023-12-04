import 'package:flutter/material.dart';
import 'package:todo/screens/login_screen.dart';
import 'package:todo/screens/signup_screen.dart';

// ignore: camel_case_types
class Auth_Page extends StatefulWidget {
  const Auth_Page({super.key});

  @override
  State<Auth_Page> createState() => _Auth_PageState();
}

// ignore: camel_case_types
class _Auth_PageState extends State<Auth_Page> {
  bool a = true;
  void to() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
      return LoginScreen(to);
    } else {
      return SignupScreen(to);
    }
  }
}
