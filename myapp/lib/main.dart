import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/splash.dart';
import 'package:flutter/services.dart';
import 'package:myapp/sizeConfig.dart';
import 'package:myapp/windowHistory.dart';
import 'package:myapp/mainView.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}

class MyState extends StatefulWidget {

  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<MyState> {

  var databaseReference = FirebaseDatabase().reference();
  int $deg = 0x00B0;
  int index = 0;
  Map<dynamic, dynamic> history;

  @override
  void initState() {
    print('initState');
    getData();
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          title: Text("KareRain",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Color(0xFF47525E)))),
          centerTitle: true,
          backgroundColor: Color(0xFFFFFFFF),
        ),
        body: _getBody(index),
        bottomNavigationBar: new BottomNavigationBar(
          showSelectedLabels: true,
          currentIndex: index,
          onTap: (value) => setState(() {
            print(index);
            index = value;
          }),
          elevation: 5,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.linear_scale),
              title: new Text('History'),
            ),
            BottomNavigationBarItem(icon: Icon(Icons.info), title: Text('Info'))
          ],
        ),
      ),
    );
  }

  void updateData() {
    databaseReference.child("Window1").update({'Status': 'Test'});
  }

  void getData() async {
    print("loading from reference");
    await databaseReference.once().then((DataSnapshot snapshot) {
      setState(() {
        history = snapshot.value;
      });
    });
    print(history);
  }

  _getBody(int index){
    print('getting body');
    print(history);
    print("Completed intialization");

    switch (index) {
      case 0:
        return Main(
            database:
            databaseReference); // Create this function, it should return your first page as a widget
      case 1:
        return History(
            database:
                history); // Create this function, it should return your second page as a widget
    }
    return Center(
      child: Text("There is no page builder for this index."),
    );
  }
}
//Weather API
// WeatherStation weatherStation = new WeatherStation("d343f19fd841696be06779d11d7a9df5");
