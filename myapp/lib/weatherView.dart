import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/main.dart';
import 'package:firebase_database/firebase_database.dart';

class WeatherView extends StatefulWidget {
  final database;
  WeatherView({@required this.database});

  @override
  State<StatefulWidget> createState() {
    return _WeatherView(database);
  }
}

class _WeatherView extends State<WeatherView> {
   var databaseReference;
   Map<dynamic, dynamic> databaseHistory;

   _WeatherView(this.databaseReference);


  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print(databaseHistory);

    return StreamBuilder(
        stream: databaseReference.onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              !snapshot.hasError &&
              snapshot.data.snapshot.value != null) {
            Map data = snapshot.data.snapshot.value;
            String _location = data['Window1']['Location'].toString();
            String _chances = data['Window1']['Chances'].toString();
            String _date = data['Window1']['date'];

            print("value changed");
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('$_location',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 30,
                                          color: Color(0xFFA9AFE8)))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text('$_date',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF47525E)))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text('$_chances% Chance of Rain',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF47525E)))),
                            ),
                          ],
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.asset('assets/sun.png', scale: 4.5),
                          ],
                        ))
                  ]),
            );
          }else {
            return CircularProgressIndicator();
          }
        });
  }

   void getData() async {
     print("loading from reference");
     await databaseReference.once().then((snapshot) {
       setState(() {
         databaseHistory = snapshot.value;
       });
     });
   }
}
