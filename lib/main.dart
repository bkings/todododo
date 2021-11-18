import 'package:flutter/material.dart';
import 'package:todo_dodo/pages/todo.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Todo(),
    },
  ));
}