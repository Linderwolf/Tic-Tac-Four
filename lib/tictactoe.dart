import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const TicTacToe());
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TicTacToePage(title: 'Flutter Demo Home Page'),
    );
  }
}



class TicTacToePage extends StatefulWidget {
  const TicTacToePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

//Player classes for Tic Tac Toe

class Player {
  static const none = '';
  static const X = 'X';
  static const O = 'O';
}

//The state of the Tic Tac Toe Page

class _TicTacToePageState extends State<TicTacToePage> {
  static final countMatrix = 3;       // size of the grid, prolly won't need to adjust this
  static final double size = 92;       // size of each space to fill

  List<List<String>> matrix;

  @override
  void initState() {
    super.initState();

    setEmptyFields();
  }

  void setEmptyFields() => setState(() => matrix = List.generate(               // This creates a list of blocks (3 blocks total, this is the first column of spaces)
    countMatrix,
    (_) => List.generate(countMatrix, (_) => Player.none),         // Each of those three blocks will have a list inside them, creating the other two columns.
  ));
}

 @override
 Widget build(BuildContext context) => Scaffold(
   backgroundColor: Colors.red,
   appBar: AppBar(
     title: Text(widget.title),
   ),
   body: Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children: Utils.modelBuilder(matrix, (x, value) => buildRow()),
   )
  );

class _TicTacToePageState extends State<TicTacToePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
