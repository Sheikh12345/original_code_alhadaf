import 'dart:async';
import 'package:alhadaf/Service/firestore_data.dart';
import 'package:alhadaf/TermsAndCondition/terms_and_conditions.dart';
import 'package:alhadaf/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String selectedValue = "ar";
  SharedPreferences _preferences;

  @override
  void initState() {
    super.initState();
    goToNextScreen();

    SharedPreferences.getInstance().then((value) {
      _preferences = value;
      setState(() {

        languageName = _preferences.getString("languageName") ?? 'ar';
      });
    }).whenComplete(() {
      Database.fetchData();
    });
  }

  goToNextScreen() async {
    Timer(Duration(seconds: 6), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      bool isAccepted = (prefs.getBool('isAccepted') ?? false);
      if (!isAccepted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => TermsAndCond()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/header.jpg'), fit: BoxFit.fill)),
    ));
  }
}
