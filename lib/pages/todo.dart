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

  void removeItem(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  void promptRemoveItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Remove ${todoList[index]} ?'),
            actions: [
              TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('Cancel')),
              TextButton(onPressed: () {
                removeItem(index);
                Navigator.of(context).pop();
              }, child: Text('Remove'))
            ],
          );
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
            return Container(
              margin: EdgeInsets.all(1.5),
              child: Card(
                child: ListTile(
                  title: Text(todoList[index]),
                  onLongPress: () => promptRemoveItem(index),
                ),
              ),
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
