import 'package:flutter/material.dart';

class AddNotes extends StatefulWidget {
  @override
  _AddNotesState createState() => new _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: BackButton(color: Colors.white),
        actions: [
          Icon(
            Icons.done,
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Title',
              fillColor: Colors.transparent,
              filled: true,
              border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 20.0, right: 20.0,top: 20.0)
            ),
            style: TextStyle(fontSize: 30.0, color: Colors.black),
          ),
          TextField(
            decoration: InputDecoration(
                hintText: 'Start typing',
                fillColor: Colors.transparent,
                filled: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 20.0, right: 20.0)),
            style: TextStyle(fontSize: 20.0, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
