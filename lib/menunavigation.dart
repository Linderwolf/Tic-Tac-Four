/// Class is unused

class MenuNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.home: (BuildContext context) => MainPage(),
        Routes.ticTacToe: builder: (context) => TicTacToe(),         /// I know this works
        Routes.connectFour: (BuildContext context) => ConnectFour(), /// Unknown
      },
    );
  }
}