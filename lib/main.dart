
import 'package:flutter/material.dart';
import 'package:todquest_task/startmenu.dart';
import 'package:todquest_task/task1.dart';
import 'package:todquest_task/task2.dart';
import 'package:todquest_task/task3.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'startmenu',
    routes: {
      'startmenu': (context) => StartMenu(),
      'task1': (context) => Task1(),
      'task2': (context) => Task2(),
      'task3': (context) => Task3()
    },
  ));
}
