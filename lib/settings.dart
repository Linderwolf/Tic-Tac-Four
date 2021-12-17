import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext ctx){
    SystemChrome.setPreferredOrientations([     /// Portrait Orientation
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
              ),
            ),
          ],
        )
    );
  }
}