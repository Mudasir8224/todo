import 'package:flutter/material.dart';

class AddNotes extends StatefulWidget {
  @override
  _AddNotesState createState() => new _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  var _textFieldTitle = new TextField(
    decoration: InputDecoration(
        hintText: 'Title',
        fillColor: Colors.transparent,
        filled: true,
        border: InputBorder.none,
        contentPadding:
            EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0)),
    style: TextStyle(fontSize: 30.0, height: 2.0, color: Colors.black),
  );

  var _textFieldContent = new TextField(
    decoration: InputDecoration(
        hintText: 'Start typing',
        fillColor: Colors.transparent,
        filled: true,
        border: InputBorder.none,
        contentPadding:
            EdgeInsets.only(left: 20.0, right: 20.0)),
    style: TextStyle(fontSize: 20.0, height: 2.0, color: Colors.black),
  );

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
        children: [_textFieldTitle, _textFieldContent],
      ),
    );
  }
}
