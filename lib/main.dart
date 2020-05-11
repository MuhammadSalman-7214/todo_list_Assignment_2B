import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> todoList = List();


  @override
  Widget build(BuildContext context) {

    void _addTodoItem(String val) {
      todoList.add(val);
    }

    void _AddToDoScreen() {
      Navigator.of(context).push(
        new MaterialPageRoute(builder: (context) {
          return new Scaffold(
            appBar: AppBar(title: Text("Add A New Task"),),
            body: TextField (
              autofocus: true,
              onSubmitted: (val) {
                _addTodoItem(val);
                Navigator.pop(context);

              },

              decoration: InputDecoration(
                hintText: "Enter Something To Do...",
                contentPadding: const EdgeInsets.all(16)
              ),
            ),
          );
        }
        )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: Text(todoList[index]),);
          },
          itemCount: todoList.isEmpty ? 0 : todoList.length,

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _AddToDoScreen,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

