import 'package:alhadaf/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedValue = "ar";
  SharedPreferences _preferences;

  @override
  void initState() {

    super.initState();
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
      selectedValue = _preferences.getString("languageName") ?? 'ar';
      print(selectedValue);
    }).whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Directionality(
      textDirection:
          languageName == "ar" ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/background.jpeg?alt=media&token=018e76e8-e52d-4870-b76b-20587ec780c5'),
                fit: BoxFit.fill),
          ),
          child: ListView(
            children: [
              Stack(children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  child: Image(
                      image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/headertwo.jpg?alt=media&token=3bfe4758-1c7e-4916-a0a0-9f85b48a746f'),
                      width: double.infinity,
                      fit: BoxFit.cover),
                ),
                Positioned(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                )
              ]),
              SizedBox(
                height: size.height * 0.1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    languageName == "ar" ? "اختار اللغة" : 'Select language',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        languageName == "ar" ? "العربية" : "Arabic",
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                      Radio(
                        activeColor: Colors.green[700],
                        groupValue: selectedValue,
                        value: "ar",
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                            _preferences.setString("languageName", value);
                          });
                        },
                      ),
                      Text(
                        languageName == "ar" ? "الانجليزية" : "English",
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                      Radio(
                        activeColor: Colors.green[700],
                        groupValue: selectedValue,
                        value: "en",
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                            _preferences.setString("languageName", value);
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Phoenix.rebirth(context);
                    },
                    height: size.height * 0.06,
                    minWidth: size.width * 0.6,
                    color: Colors.green[700],
                    child: Text(
                      languageName == "ar" ? "اعادة التشغبل" : "Restart app",
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
