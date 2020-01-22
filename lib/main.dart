import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'ftr_AppTour.dart';
import 'Dashboard/ftr_HomePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/main': (BuildContext context) => ftr_HomePage(),
          '/other': (BuildContext context) => ftr_AppTour(title:'Flutter Tech'),
        }
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    navigationPage(context);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
        child: new Image.asset('images/and_img.png'),
    ),
    );
  }


  //NavigationDecision
  navigationPage(BuildContext context){
    checkUserAndNavigate(context).then((res) {
      if (res == true) {
        Navigator.of(context).pushReplacementNamed('/main');
      } else {
        Navigator.of(context).pushReplacementNamed('/other');
      }
    });
  }
}


//SharedPreferenceData
Future<bool> checkUserAndNavigate(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'checkStateValue';
  final value = prefs.getBool(key) ?? false;
  if(value==true){
    return true;
  }
  else{
    return false;
  }
  // return false;
}
