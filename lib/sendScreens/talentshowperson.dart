import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../main.dart';

class TalentShowPerson extends StatefulWidget {
  @override
  _TalentShowPersonState createState() => _TalentShowPersonState();
}

class _TalentShowPersonState extends State<TalentShowPerson> {
  String _name;
  String _country;
  String _location;
  String _numberId;
  String _number;
  String _email;
  String _date;

  final _key = GlobalKey<FormState>();

  TextStyle styleField = TextStyle(
      fontFamily: 'Cairo',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black87);

  final nameCtrl = TextEditingController();
  final countryCtrl = TextEditingController();
  final locationCtrl = TextEditingController();
  final numberIdCtrl = TextEditingController();
  final numberCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final dateCtrl = TextEditingController();
  bool isLoading = false;
  final picker = ImagePicker();

  VideoPlayerController _videoPlayerController;

  File file;

  _pickVideo() async {
    final video = await picker.getVideo(source: ImageSource.gallery);

    file = File(video.path);

    _videoPlayerController = VideoPlayerController.file(file)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  _pickVideoCamera() async {
    final video = await picker.getVideo(source: ImageSource.camera);

    file = File(video.path);

    _videoPlayerController = VideoPlayerController.file(file)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  String valueChoose;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection:languageName=="ar"? TextDirection.rtl:TextDirection.ltr,
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          child: Form(
            key: _key,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      languageName == "ar" ? 'تقديم مقطع فيديو فردي' : "Singular video",
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autofocus: false,
                    controller: nameCtrl,
                    validator: (value) {
                      if (value.isEmpty) {
                        return languageName == "ar"
                            ? 'الاسم بالكامل لا يمكن ان يكون فارغ'
                            : "Full name cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: languageName == "ar" ? 'الاسم بالكامل' : "Full name"),
                    style: styleField,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    controller: countryCtrl,
                    validator: (value) {
                      if (value.isEmpty) {
                        return languageName == "ar"
                            ? 'البلد لا يمكن ان يكون فارغ'
                            : "Country cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _country = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: languageName == "ar" ? 'البلد' : "Country"),
                    style: styleField,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    controller: locationCtrl,
                    validator: (value) {
                      if (value.isEmpty) {
                        return languageName == "ar"
                            ? 'العنوان لا يمكن ان يكون فارغ'
                            : "Address cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _location = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: languageName == "ar" ? 'العنوان' : "Address"),
                    style: styleField,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    controller: numberIdCtrl,
                    validator: (value) {
                      if (value.isEmpty) {
                        return languageName == "ar"
                            ? 'الرقم القومي لا يمكن ان يكون فارغ'
                            : "National ID cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _numberId = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: languageName == "ar" ? 'الرقم القومي' : "National ID"),
                    style: styleField,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    controller: numberCtrl,
                    validator: (value) {
                      if (value.isEmpty) {
                        return languageName == "ar"
                            ? 'رقم الهاتف لا يمكن ان يكون فارغ'
                            : "Phone number cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _number = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: languageName == "ar" ? 'رقم الهاتف' : "Phone number"),
                    style: styleField,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    controller: emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty) {
                        return languageName == "ar"
                            ? 'البريد الالكتروتي لا يمكن ان يكون فارغ'
                            : "Email cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText:
                            languageName == "ar" ? 'البريد الالكتروني' : "Email"),
                    style: styleField,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    controller: dateCtrl,
                    validator: (value) {
                      if (value.isEmpty) {
                        return languageName == "ar"
                            ? 'التاريخ لا يمكن ان يكون فارغ'
                            : "DOB cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _date = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: languageName == "ar" ? 'التاريخ' : "DOB"),
                    style: styleField,
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    height: size.height * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey[600],
                        )),
                    padding: EdgeInsets.only(
                        right: size.width * 0.035, left: size.width * 0.02),
                    width: size.width,
                    child: DropdownButton<String>(
                      hint: Text(languageName == "ar" ? 'مركز اللعب' : "Position"),
                      elevation: 0,
                      isDense: false,
                      isExpanded: true,
                      value: valueChoose,
                      autofocus: false,
                      items: <String>[
                        languageName == "ar" ? "حارس مرمي" : "",
                        languageName == "ar" ? "مهاجم" : "",
                        languageName == "ar" ? "مدافع" : "",
                        languageName == "ar" ? "جناح ايمن" : "",
                        languageName == "ar" ? "جناح ايسر" : ""
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
                              width: size.width,
                              padding: EdgeInsets.only(left: size.width * 0.4),
                              child: Text(
                                value,
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    fontFamily: "Cairo", letterSpacing: 0.6),
                              ),
                            ));
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          if (value == "Select") {
                          } else {
                            valueChoose = value;
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  isLoading
                      ? Container(
                          width: size.width * 0.2,
                          height: size.width * 0.2,
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : Align(
                          alignment: Alignment.center,
                          child: Text(
                            '${file == null ? "" : file.toString()}',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      languageName=="ar"?  'ارسال فيديو من ':"Choose video",
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        color: Colors.green[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          languageName=="ar"? 'معرض':"Gallery",
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        onPressed: _pickVideo,
                      ),

                      /// Material button is same as Raised button
                      MaterialButton(
                        color: Colors.green[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          languageName=="ar"?'كاميرا':"Camera",
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        onPressed: _pickVideoCamera,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                      color: Colors.green[800],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        languageName=="ar"? 'التالي':"Next",
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        if (!_key.currentState.validate()) {
                          return;
                        }
                        _key.currentState.save();
                        // task();
                        showBottomSheet(size);
                      }),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future task() async {
    /// always use camel case in dart for variable
    final name = nameCtrl.text;
    final date = dateCtrl.text;
    final number = numberCtrl.text;
    final email = emailCtrl.text;
    final numberId = numberIdCtrl.text;
    final country = countryCtrl.text;
    final location = locationCtrl.text;
    setState(() {
      isLoading = true;
    });
    return await FirebaseStorage.instance
        .ref()
        .child('videos/${Uri.file(file.path).pathSegments.last}')
        .putFile(file)
        .then((value) {
      value.ref.getDownloadURL().then((value) async {
        final videoLink = '$value';
        print("Video link => $value");
        return await FirebaseFirestore.instance.collection('professional').add({
          'video': videoLink,
          'name': name,
          'date': date,
          'number': number,
          'numberId': numberId,
          'email': email,
          'country': country,
          'position': valueChoose,
          'location': location
        }).whenComplete(() {
          nameCtrl.clear();
          dateCtrl.clear();
          numberCtrl.clear();
          emailCtrl.clear();
          numberIdCtrl.clear();
          countryCtrl.clear();
          locationCtrl.clear();
          setState(() {
            file = null;
            isLoading = false;
          });
        }).catchError((e) {
          print("error => " + e.toString());
        });
      });
    });
  }

  showBottomSheet(Size size) {
    showModalBottomSheet(
        isScrollControlled: false,
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
              width: size.width,
              height: size.height * 0.28,
              decoration: BoxDecoration(color: Colors.yellow),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ListTile(
                        title: Text("Pay Online"),
                        leading: Radio(
                          value: 12,
                          onChanged: (value) {},
                        ),
                      ),
                      ListTile(
                        title: Text("Pay By Cash"),
                        leading: Radio(
                          onChanged: (value) {},
                        ),
                      )
                    ],
                  ),
                  MaterialButton(
                      color: Colors.green[800],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        languageName=="ar"? 'ارسال الطلب':"",
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onPressed: () {}),
                ],
              ));
        });
  }
}
