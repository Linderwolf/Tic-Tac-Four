import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './settings.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import './tictactoe.dart';
import './connectfour.dart';

void main() {
  runApp(
    MaterialApp(
      home: MainPage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        primaryColor: const Color(0xFF212121),
        accentColor: const Color(0xFF64ffda),
        canvasColor: const Color(0xFF303030),
        fontFamily: 'Roboto',
      ),
    ),
  );
}

final ThemeData themeData = ThemeData(
  canvasColor: Colors.black,
);

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  /// Extend Settings state for theme to persist?

  @override
  Widget build(BuildContext ctx) {
    SystemChrome.setPreferredOrientations([
      /// Portrait Orientation
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return AnimatedTheme(
      data: lightTheme ? ThemeData.light() : ThemeData.dark(),
      child: Builder(builder: (context) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
              body: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        ctx,
                        MaterialPageRoute(builder: (context) => const TicTacToe()),
                      );
                    },
                    child: Text("Play TicTacToe"),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {

                      // ColorPicker(colorPickerWidth: 300,
                      // pickerAreaHeightPercent: 0.7,
                      // enableAlpha: true,
                      // labelTypes: [],
                      // displayThumbColor: true,
                      // paletteType: PaletteType.hueWheel,
                      // pickerAreaBorderRadius: const BorderRadius.only(topLeft: Radius.circular(2), topRight: Radius.circular(2)),
                      // hexInputBar: false,
                      // pickerColor: currentColor,
                      // onColorChanged: changeColor,
                      // pickerColors: currentColors,
                      // onColorsChanged: changeColors,
                      // colorHistory: colorHistory,
                      // onHistoryChanged: changeColorHistory,);

                      Navigator.push(
                        ctx,
                        MaterialPageRoute(builder: (context) => const Settings()),
                      );
                    },
                    child: Text("Game Settings"),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          ctx,
                          MaterialPageRoute(
                              builder: (context) => const ConnectFour()),
                        );
                      },
                      child: Text("Play Connect Four"),
                    ),
                  )),
            ],
          )),
        );
      }),
    );
  }
}
