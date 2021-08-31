import 'package:flutter/material.dart';
import 'package:todo/notes.dart';
import 'package:todo/notes_db.dart';

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
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: BackButton(color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  NotesDatabase().insertNote(Notes(
                      id: 1, title: titleController.text, content: contentController.text, time: '2: pm'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              icon: Icon(Icons.done)),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter title';
                }
                return null;
              },
              controller: titleController,
              decoration: InputDecoration(
                  hintText: 'Title',
                  fillColor: Colors.transparent,
                  filled: true,
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0)),
              style: TextStyle(fontSize: 30.0, color: Colors.black),
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter content';
                }
                return null;
              },
              controller: contentController,
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
      ),
    );
  }
}
