import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List<String> todoList = [];

  void addTodo() {
    setState(() {
      todoList.add('Item');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todoList[index]),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: addTodo,
        child: Icon(Icons.add),
      ),
    );
  }
}