import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './tictactoe.dart';
import './connectfour.dart';

void main() {
  runApp(MaterialApp(
    home: MainPage(),
    theme: ThemeData(
      brightness:Brightness.dark,
      primarySwatch: Colors.deepPurple,
      primaryColor: const Color(0xFF212121),
      accentColor: const Color(0xFF64ffda),
      canvasColor: const Color(0xFF303030),
      fontFamily: 'Roboto',
    ),
  ),);
}

final ThemeData themeData = ThemeData(
  canvasColor: Colors.black,
);

class MainPage extends StatelessWidget {

  /// Portrait Orientation (Doesn't work?)
  ///SystemChrome.setPreferredOrientations([DeviceOrientation.PortraitUp]);

  @override
  Widget build(BuildContext ctx){
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: (){
                  Navigator.push(
                    ctx,
                    MaterialPageRoute(builder: (context) => TicTacToe()),
                  );
                },
                child: Text("Play TicTacToe"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: (){
                  Navigator.push(
                    ctx,
                    MaterialPageRoute(builder: (context) => ConnectFour()),
                  );
                },
                child: Text("Play Connect Four"),
              ),
            )
          ),
        ],
      )
    );
  }
}