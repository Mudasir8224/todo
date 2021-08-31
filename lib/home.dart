import 'package:flutter/material.dart';
import 'package:todo/add_notes.dart';
import 'package:todo/notes.dart';
import 'package:todo/notes_db.dart';

void main() => runApp(MaterialApp(home: MyHomePage()));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var _textField = new Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search notes',
            fillColor: Colors.transparent,
            filled: true,
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 20.0, bottom: 20.0)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Notes'),
      ),
      floatingActionButton: Container(
          height: 70.0,
          width: 70.0,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNotes()),
              );
            },
            child: Icon(
              Icons.add,
              size: 40.0,
              color: Colors.white,
            ),
            backgroundColor: Colors.orange,
          )),
      body: FutureBuilder<List<Notes>>(
        future: NotesDatabase().notes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 12.0, bottom: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            snapshot.data![index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                          Text(snapshot.data![index].content,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.0)),
                          Text(snapshot.data![index].time,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.0)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("Oops!");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
