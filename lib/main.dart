import 'package:flutter/material.dart';
import './tictactoe.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
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
<<<<<<< HEAD
}
=======
}



// class TicTacToe extends MaterialPageRoute<Null> {
//   TicTacToe() : super(builder: (BuildContext ctx)){
//     return Scaffold(
//
//     );
//   });
// }
>>>>>>> 7644ff09a5b8c0e186fe532c048610305b32be3f
