import 'package:flutter/material.dart';
import 'package:todo_dodo/services/TodoItem.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List<TodoItem> todoList = [];
  Map data = {};

  void addTodo(String task) {
    if (task.length > 0) {
      setState(() {
        todoList.add(TodoItem(task, false));
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
            title: Text('Remove ${todoList[index].title} ?'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () {
                    removeItem(index);
                    Navigator.of(context).pop();
                  },
                  child: Text('Remove'))
            ],
          );
        });
  }

  /*Widget checkBox() {
    return Checkbox(
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        });
  }*/

  Widget listTile(index) {
    return ListTile(
      title: Text(todoList[index].title),
      onLongPress: () => promptRemoveItem(index),
    );
  }

  Widget checkBoxListTile(index) {
    return CheckboxListTile(
      title: Text(todoList[index].title),
      value: todoList[index].checkStatus,
//      selected: isChecked,
      onChanged: (bool? value) {
        if (value!) {
          promptRemoveItem(index);
        }
        setState(() {
          todoList[index].checkStatus = value;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(1.5),
                child: Card(
                  child: checkBoxListTile(index),
                ),
              );
            }),
      ),
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
