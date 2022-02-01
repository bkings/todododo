import 'package:flutter/material.dart';

class NewTodo extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void addAndRedirect(String text) {
      Navigator.pop(context, {'inputValue': text});
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add a todo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 2.0),
              child: TextField(
                controller: controller,
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Add a beautiful todo',
                    hintStyle: TextStyle(
                        fontStyle: FontStyle.italic, letterSpacing: 1.0)),
              ),
            ),
            ElevatedButton.icon(
                onPressed: () => addAndRedirect(controller.text),
                icon: Icon(Icons.add),
                label: Text('Add'))
          ],
        ),
      ),
    );
    ;
  }
}
