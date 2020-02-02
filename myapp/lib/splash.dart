import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'package:myapp/main.dart';
import 'package:flutter/services.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _mockCheckForSession().then((status) {
      if (status) {
        _navigateToHome();
      } else {
        _navigateToLogin();
      }
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 6000), () {});

    return true;
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(new
        MaterialPageRoute(builder: (BuildContext context) =>   MyState()));
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(new
        MaterialPageRoute(builder: (BuildContext context) =>  MyState()));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Opacity(
                opacity: 0.5,
                child: Image.asset(
                  'assets/logo.png',
                  scale: 2.5,
                )),
            Shimmer.fromColors(
              period: Duration(milliseconds: 1500),
              baseColor: Color(0xffB4BCC5),
              highlightColor: Color(0xff34d8eb),
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "KARERAIN",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.0, shadows: <Shadow>[
                    Shadow(
                        blurRadius: 18.0,
                        color: Colors.black87,
                        offset: Offset.fromDirection(120, 12))
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
