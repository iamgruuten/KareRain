import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Auto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Auto();
  }
}

class _Auto extends State<Auto> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                            "Would you like to close your window automatically?",
                            style: TextStyle(fontSize: 11))),
                    Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text("Closes your window when it starts raining",
                            style: TextStyle(
                                fontSize: 8, color: Color(0xFFA2AAB3))))
                  ])),
          Switch(
            value: isSwitched,
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
          )
        ]);
  }
}
