import 'package:flutter/material.dart';
import './tictactoe.dart';

void main() => runApp(new MyApp());

final ThemeData themeData = ThemeData(
  canvasColor: Colors.black,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx){
    return Scaffold(
      body: Center(
          child: TextButton(
            onPressed: (){
              Navigator.push(ctx, TicTacToe());
            },
            child: Text("Play TicTacToe"),
          )
      ),
    );
  }
}