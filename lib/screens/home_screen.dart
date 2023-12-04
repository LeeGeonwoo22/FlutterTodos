import 'package:flutter/material.dart';
import 'package:todo/const/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColors,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: custom_green,
          child: const Icon(Icons.add),
        ));
  }
}
