import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/utils.dart';


void main() {
  runApp(const ConnectFour());
}

class ConnectFour extends StatelessWidget {
  const ConnectFour({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect Four',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const ConnectFourPage(title: 'Connect Four'),
    );
  }
}

class ConnectFourPage extends StatefulWidget {
  const ConnectFourPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ConnectFourPage> createState() => _ConnectFourPageState();
}

//Player classes for Tic Tac Toe

class Player {
  static const none = '';
  static const X = 'X';
  static const O = 'O';
}

//The state of the Tic Tac Toe Page

class _ConnectFourPageState extends State<ConnectFourPage> {
  static final countMatrix = 7;        // size of the grid, prolly won't need to adjust this
  static final double size = 50;       // size of each space to fill

  String lastMove = Player.none;       // At the start of the game, the latest move is no move (this makes sense)

  late List<List<String>> matrix;      // (How do we know we're in the matrix?)

  @override
  void initState() {

    /// Force landscape
    // if (MediaQuery.of(context).orientation == Orientation.landscape)  /// Can't check for orientation before page has state... duh...
    // {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
    ///}

    super.initState();

    setEmptyFields();
  }

  ///
  /// TODO: Disable all buttons within lists, excepting bottom List Row
  ///
  // Generate List of Blocks
  void setEmptyFields() => setState(() => matrix = List.generate(
    countMatrix,
        (_) => List.generate(countMatrix, (_) => Player.none),         // Each of those three blocks will have a list inside them, creating the other two columns.
  ));

// Changes the background color depending on who's turn it is.

  Color getBackgroundColor() {
    final thisMove = lastMove == Player.X ? Player.O : Player.X;        // retrieves information on who's turn it is based on the last turn

    return getFieldColor(thisMove).withAlpha(150);                    // changes the background color based on who's turn it is. The background color is slightly altered so it looks different from the player colors.
  }

// This basically calls a lot of the methods we made

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: getBackgroundColor(),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context),   /////////////  POP TODO
            icon: Icon(Icons.add),)
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: Utils.modelBuilder(matrix, (x, value) => buildRow(x)),
      )
  );

  Widget buildRow(int x) {
    final values = matrix[x];

// Build each individual row (x and y)

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: Utils.modelBuilder(
        values,
            (y, value) => buildField(x, y),
      ),
    );
  }

//Background color for each tile!

  Color getFieldColor(String value) {
    switch (value) {
      case Player.O:              // Every time an O is placed, the color of the tile is changed
        return Colors.blue;

      case Player.X:              // Every time an X is placed, the color of the tile is changed
        return Colors.red;

      default:                    // By default, empty tiles are white.
        return Colors.white;
    }
  }

// This also calls a bunch of methods that were made

  Widget buildField(int x, int y) {
    final value = matrix[x][y];
    final color = getFieldColor(value);

    return Container(
      margin: EdgeInsets.all(4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
        child: Text(value, style: TextStyle(fontSize: 32)),
        onPressed: () => selectField(value, x, y),
      ),
    );
  }

  void selectField(String value, int x, int y) {
    if (value == Player.none) {
      final newValue = lastMove == Player.X ? Player.O : Player.X;            // Switches between X and O. This is how turns work!

      /// TODO: Enable buttons on outer List above lastmove
      /// All buttons except the lowest List row should be disabled by default
      ///
      setState(() {
        lastMove = newValue;            // The last move is the latest value
        matrix[x][y] = newValue;
      });

      // If someone wins...

      if (isWinner(x, y)) {

        showEndDialog('Player $newValue is the winner!');   // A pop up dialog announces the winner of the game
      }

      // If a game ends in a tie...

      else if (isEnd()) {

        showEndDialog('Aw man, a tie.');                    // A pop up dialog says the game was a tie
      }

    }
  }

  // For games that end in a tie:

  bool isEnd() =>
      matrix.every((values) => values.every((value) => value != Player.none));      // this checks to see if there are no more empty tiles left.

  // HOW TO DETERMINE A WINNER

  /// TODO: Adjust win condition to after 4 in a row
  /// Currently requires full screen fill of one player
  /// Line cross-out animation after 4 in a row?
  bool isWinner(int x, int y) {
    var col = 0, row = 0, diag = 0, rdiag = 0;
    final player = matrix[x][y];
    final n = countMatrix;

    for (int i = 0; i < n; i++) {
      if (matrix[x][i] == player) col++;        // 3 in a row (column)
      if (matrix[i][y] == player) row++;        // 3 in a row (row)
      if (matrix[i][i] == player) diag++;       // 3 in a row (diagonal)
      if (matrix[i][n - i - 1] == player) rdiag++;
    }

    return row == n || col == n || diag == n || rdiag == n;
  }

  Future showEndDialog(String title) => showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text('Run it back!'),   // dialog message
      actions: [
        ElevatedButton(
          onPressed: () {
            setEmptyFields();                 // resets the tiles to their initial values (O and X are removed)
            Navigator.of(context).pop();      // hides the dialog
          },
          child: Text('Restart'),             // button text
        )
      ],
    ),
  );
}
