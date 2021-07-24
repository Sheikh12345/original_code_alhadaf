import 'package:alhadaf/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

class TermsAndCond extends StatefulWidget {
  const TermsAndCond({Key key}) : super(key: key);

  @override
  _TermsAndCondState createState() => _TermsAndCondState();
}

class _TermsAndCondState extends State<TermsAndCond> {

  String _url = "https://drive.google.com/file/d/14xdS-KCR8mIOgt2wytYFK90rR9ZQkwzD/view";


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(child: Scaffold(
       backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top:size.height*0.03),
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height*0.02,
            ),
            Text(languageName=="ar"?"الشروط و الاحكام":'',style: TextStyle(
              color: Colors.black,
              fontSize: size.width*0.07,
              fontWeight: FontWeight.w700,

            ),),
            SizedBox(
              height: size.height*0.3,
            ),
            InkWell(
              onTap: ()async{
                _launchURL();
              },
              child: Text(languageName=="ar"?"قرأة الشروط و الاحكام":"",
              textAlign: TextAlign.center,style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w600,
                  fontSize: size.width*0.04
                ),),
            ),
            SizedBox(
              height: size.height*0.1,
            ),
            MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.1,vertical: size.height*0.01),
              color: Colors.green[800],
              onPressed: ()async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isAccepted', true);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
            },
            child: Text(languageName=="ar"?"اقبل":"",style: TextStyle(
              color: Colors.white,
              fontSize: size.width*0.07,
            ),),
            )
          ],
        ),
      ),
    ));
  }

  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}
