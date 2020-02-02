import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:progress_button/progress_button.dart';
import 'package:myapp/sizeConfig.dart';

class WindowControl extends StatefulWidget {
  final database;

  WindowControl({@required this.database});

  @override
  State<StatefulWidget> createState() {
    return _WindowControl(database);
  }
}

int _state = 0;
String _status = "Close";

class _WindowControl extends State<WindowControl>
    with TickerProviderStateMixin {
  var databaseReference;
  Map<dynamic, dynamic> databaseHistory;

  _WindowControl(this.databaseReference);

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
        stream: databaseReference.onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              !snapshot.hasError &&
              snapshot.data.snapshot.value != null) {
            getData();
            _status = databaseHistory['Window1']['Status'];
            updateButton(_status);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 5),
                    child: AutoSizeText(
                      'Looks like its going to rain today',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.adventPro(
                          textStyle: TextStyle(
                              color: Color(0xFF47525E), fontSize: 20)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new MaterialButton(
                            color: Colors.white,
                            shape: CircleBorder(),
                            height: SizeConfig.safeBlockVertical * 10,
                            hoverElevation: 10,
                            child: setUpButtonChild(),
                            onPressed: () {
                              setState(() {
                                if (_state == 0) {
                                  setState(() {
                                    _state = 1;
                                    updateData("closing");
                                  });
                                } else if (_state == 2) {
                                  setState(() {
                                    _state = 1;
                                    _status = updateData("opening");
                                  });
                                }
                              });
                            }),
                        Container(
                            margin: EdgeInsets.only(top: 5.0, left: 20.0),
                            child: new Text("Window is now $_status",
                                style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 5,
                                        color: Colors.black87),
                                    fontWeight: FontWeight.w300)))
                      ]),
                )
              ],
            );
          } else {
            {
              return CircularProgressIndicator();
            }
          }
        });
  }

  updateData(String windowStatus) {
    print(databaseReference);
    databaseReference.child("Window1").update({'Status': windowStatus});
  }

  updateButton(String index){
    if(index == "opened"){
      _state = 0;
    }else if (index == "closed"){
      _state = 2;
    }
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

Widget setUpButtonChild() {
  if (_state == 0) {
    return new Icon(
      Icons.close,
      color: Colors.red,
      size: 50,
    );
  } else if (_state == 1) {
    return SizedBox(
      child: CircularProgressIndicator(
        backgroundColor: Colors.deepPurple,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
      height: 50.0,
      width: 50.0,
    );
  } else {
    return Icon(
      Icons.check,
      color: Colors.deepPurple,
      size: 50,
    );
  }
}
