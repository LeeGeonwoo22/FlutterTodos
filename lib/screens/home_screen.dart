import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo/const/colors.dart';
import 'package:todo/screens/addnote_screen.dart';
import 'package:todo/widgets/task_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool show = true;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColors,
        floatingActionButton: Visibility(
          visible: show,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Add_Screen(),
              ));
            },
            backgroundColor: custom_green,
            child: const Icon(Icons.add, size: 30),
          ),
        ),
        body: SafeArea(
            child: NotificationListener<UserScrollNotification>(
          // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
          onNotification: (Notification) {
            if (Notification.direction == ScrollDirection.forward) {
              setState(() {
                show = true;
              });
            }
            if (Notification.direction == ScrollDirection.forward) {
              setState(() {
                show = false;
              });
            }
            return true;
          },
          child: ListView.builder(
            itemBuilder: (context, index) {
              return const Task_Widget();
            },
            itemCount: 10,
          ),
        )));
  }
}
