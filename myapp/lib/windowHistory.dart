import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/sizeConfig.dart';
import 'package:myapp/listViewConstructor.dart';

class History extends StatefulWidget {
  final Map<dynamic, dynamic> database;

  History({Key key, @required this.database}) : super(key: key);

  @override
  _History createState() => _History(database);
}

class _History extends State<History> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  List lessons;

  Map<dynamic, dynamic> databases;

  _History(this.databases);

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    lessons = getLessons();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
        opacity: _animation,
        child: Center(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
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
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 4,
                                        color: Colors.black))),
                          ),
                          Text("1 device",
                              style: TextStyle(
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 2.5,
                                  color: Colors.black26)),
                          Container(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            lessons = getLessons();
                                          });
                                        },
                                        child: Card(
                                            child: Column(children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.asset(
                                                    'assets/logo.png',
                                                    scale: 7),
                                              ),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    "Window 1",
                                                    style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                          fontSize: SizeConfig
                                                                  .safeBlockHorizontal *
                                                              3,
                                                          color: Colors.black),
                                                    ),
                                                  ))
                                            ]),
                                            color: Color(0xFFF1FEFF),
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ))),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            lessons = getLessons2();
                                          });
                                        },
                                        child: Card(
                                            child: Column(children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.asset(
                                                    'assets/logo.png',
                                                    scale: 7),
                                              ),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    "Window 2",
                                                    style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                          fontSize: SizeConfig
                                                                  .safeBlockHorizontal *
                                                              3,
                                                          color: Colors.black),
                                                    ),
                                                  ))
                                            ]),
                                            color: Color(0xFFF1FEFF),
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            )))
                                  ])),
                        ]),
                  ))
                ],
              ),
              Container(
                // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: lessons.length,
                  itemBuilder: (BuildContext context, int index) {
                    return makeCard(lessons[index]);
                  },
                ),
              )
            ],
          ),
        ));
  }

  Card makeCard(ListViewConstructor lesson) => Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color(0xFFF1FEFF)),
          child: makeListTile(lesson),
        ),
      );

  List getLessons() {
    return [
      ListViewConstructor(
          weatherStatus: "Heavy Rain",
          time: "12:00pm",
          status: "Windows Closed",
          temp: "20°",
          icon: "Raining"),
      ListViewConstructor(
          weatherStatus: "Sunny",
          time: "1:00pm",
          status: "Windows Opened",
          temp: "30°",
          icon: "Sun")
    ];
  }

  List getLessons2() {
    return [
      ListViewConstructor(
          weatherStatus: "NoData",
          time: "NoData",
          status: "NoData",
          temp: "NoData",
          icon: "NoData")
    ];
  }

  Icon getIcon(String weather) {
    if (weather == "Sun") {
      return Icon(Icons.wb_sunny);
    } else {
      return Icon(Icons.cloud);
    }
  }

  ListTile makeListTile(ListViewConstructor lesson) => ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Color(0xFFB0AC9A)))),
          child: Column(
            children: <Widget>[
              getIcon(lesson.icon),
              Text(lesson.temp,
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5)))
            ],
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            lesson.weatherStatus,
            style: GoogleFonts.raleway(
                textStyle: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                    color: Color(0xFF43749E)),
                fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                    // tag: 'hero',
                    child: Text(lesson.time,
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize:
                                    SizeConfig.safeBlockHorizontal * 4))))),
            Expanded(
              flex: 4,
              child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(lesson.status,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 4)))),
            )
          ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
        onTap: () {},
      );
}
