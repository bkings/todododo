import 'package:flutter/material.dart';
import 'package:todo_dodo/pages/add_todo.dart';
import 'package:todo_dodo/pages/todo.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {'/': (context) => Todo(), '/new-todo': (context) => NewTodo()},
  ));
}
