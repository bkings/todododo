import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List<String> todoList = [];
  Map data = {};

  void addTodo(String task) {
    if (task.length > 0) {
      setState(() {
        todoList.add(task);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    /*try {
      print('checin');
      data = ModalRoute.of(context)!.settings.arguments as Map;
      print('data $data');
      addTodo(data['inputValue']);
    } catch (e) {
      print(e);
    }*/
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
        onPressed: () async {
          dynamic input = await Navigator.pushNamed(context, '/new-todo');
          setState(() {
            data = {'inputValue': input['inputValue']};
          });
          addTodo(data['inputValue']);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
