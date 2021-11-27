import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List<String> todoList = [];
  Map data = {};
  bool isChecked = false;

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

  Widget checkBox() {
    return Checkbox(
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        });
  }

  Widget listTile(index) {
    return ListTile(
      title: Text(todoList[index]),
      onLongPress: () => promptRemoveItem(index),
    );
  }

  Widget checkBoxListTile(index) {
    return CheckboxListTile(
        title: Text(todoList[index]),
        value: isChecked,
        selected: isChecked,
        onChanged: (bool? value) {
          if(value!) {
            promptRemoveItem(index);
          }
          setState(() {
            isChecked = value!;
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
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(1.5),
              child: Card(
                child: checkBoxListTile(index),
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
