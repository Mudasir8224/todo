import 'package:flutter/material.dart';
import 'package:todo/add_notes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.grey,
            primaryTextTheme:
                TextTheme(headline6: TextStyle(color: Colors.white))),
        home: MyHomePage(title: 'TODO'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

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

    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];

    var _listView = new ListView.builder(
        itemCount: entries.length,
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
                      'Title',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    Text('Content',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 15.0)),
                    Text('Date',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 12.0)),
                  ],
                ),
              ),
            ),
          );
        });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 14.0, right: 14.0),
        child: Column(
          children: [
            _textField,
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: _listView,
            ))
          ],
        ),
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
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
