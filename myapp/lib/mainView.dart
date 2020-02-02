import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/splash.dart';
import 'package:myapp/controller.dart';
import 'package:myapp/weatherView.dart';
import 'package:myapp/forecastView.dart';
import 'package:myapp/historyView.dart';
import 'package:flutter/services.dart';
import 'package:myapp/windowControl.dart';
import 'package:myapp/sizeConfig.dart';
import 'package:myapp/windowHistory.dart';

class Main extends StatefulWidget {
  final database;

  Main({@required this.database});

  @override
  State<StatefulWidget> createState() {
    return _Main(database);
  }
}

class _Main extends State<Main> {
  var databases;
  int changeView = 0;

  _Main(this.databases);

  Map<dynamic, dynamic> databaseHistory;

  @override
  void initState() {
    print('initState');
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('In the main database check: ');
    print(databaseHistory);
    return Stack(children: <Widget>[
      FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: Container(color: Color(0xFFF6FFE0)),
      ),
      Container(
          width: double.infinity,
          height: 250,
          color: Color(0xFFF1FEFF),
          child: WindowControl(
            database: databases,
          )),
      Container(
        margin: const EdgeInsets.only(top: 140),
        child: Column(children: [
          Card(
              color: Color(0xFFFCE4FF),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: WeatherView(
                database: databases,
              )),
          _getView(),
          Container(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Living Room",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 4,
                                color: Colors.black))),
                  ),
                  Text("1 device",
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 2.5,
                          color: Colors.black26)),
                  Container(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(children: <Widget>[
                        Card(
                            child: Column(children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/logo.png', scale: 7),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    "Window 1",
                                    style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  3,
                                          color: Colors.black),
                                    ),
                                  ))
                            ]),
                            color: Color(0xFFF1FEFF),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ))
                      ])),
                ]),
          ))
        ]),
      )
    ]);
  }

  void getData() async {
    print("loading from reference");
    await databases.once().then((snapshot) {
      setState(() {
        databaseHistory = snapshot.value;
      });
    });
  }

  _getView() {
    return new Card(
        color: Color(0xFFF1FEFF),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child:
            ForeView(database: databases,)); // Create this function, it should return your first page as a widget
  }
}
