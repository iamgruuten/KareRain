
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/chart.dart';
import 'package:myapp/sizeConfig.dart';

class ForeView extends StatefulWidget {

  final database;
  ForeView({@required this.database});

  @override
  State<StatefulWidget> createState() {
    return _ForeView(database);
  }
}

class _ForeView extends State<ForeView> {
  int view;

  var databaseReference;
  Map<dynamic, dynamic> databaseHistory;

  _ForeView(this.databaseReference);


  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print("In class forecase view: " + view.toString());
    return InkWell(
      child: getView(view, databaseReference),
      onTap: () {
        setState(() {
          if(view == 0){
            view = 1;
          }else{
            view = 0;
          }
        });
      },
    );
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

getView(int view, var databaseReference) {
  if (view == 1) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Align(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Temperature Forecast',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(fontSize: 13))),
                    ),
                    Container(
                      height: SizeConfig.safeBlockVertical * 15,
                      width: SizeConfig.safeBlockHorizontal * 70,
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: SimpleLineChart(),
                      ),
                    )
                  ]))
        ]);
  } else {
    return StreamBuilder(
    stream: databaseReference.onValue,
        builder: (context, snapshot) {

      if (snapshot.hasData &&
          !snapshot.hasError &&
          snapshot.data.snapshot.value != null) {
        Map data = snapshot.data.snapshot.value;
        String _temperature = data['Window1']['Temperature'].toString();
        String _max = data['Window1']['max'].toString();
        String _min = data['Window1']['min'].toString();
        return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "$_temperature" + "°",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.safeBlockVertical * 10),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("max",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: SizeConfig.safeBlockVertical *
                                            2)),
                                Text("$_max" + "°",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: SizeConfig.safeBlockVertical *
                                            2))
                              ]),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("min",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: SizeConfig.safeBlockVertical *
                                          2)),
                              Text("$_min" + "°",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: SizeConfig.safeBlockVertical *
                                          2))
                            ],
                          )
                        ]),
                  ]),
            ));
      }else{
        return CircularProgressIndicator();
      }
      }
    );
  }
}


