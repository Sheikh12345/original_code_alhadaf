import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class AcadmyDetails extends StatefulWidget {

  @override
  _AcadmyDetailsState createState() => _AcadmyDetailsState();
}

class _AcadmyDetailsState extends State<AcadmyDetails> {
  String _name;

  String _date;

  String _number;

  String _email;

  String _numberid;

  String _country;

  String _acadmy;

  String _city;

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextStyle stylefield = TextStyle(fontFamily: 'Cairo',fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black87);

  final name = TextEditingController();

  final date = TextEditingController();

  final numper = TextEditingController();

  final email = TextEditingController();

  final numberid = TextEditingController();

  final country = TextEditingController();

  final acadmy = TextEditingController();

  final city = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:languageName=="ar"? TextDirection.rtl:TextDirection.ltr,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    languageName=="ar"?  'حجز اكاديميات':"Academies booking",
                    style: TextStyle(fontFamily: 'Cairo',color: Colors.black54,fontSize: 30,fontWeight:FontWeight.bold ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                      controller: name,
                      validator: (value) {
                        if (value.isEmpty) {
                          return languageName=="ar"?'الاسم بالكامل لا يمكن ان يكون فارغ':"Full name cannot be empty";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _name = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: languageName=="ar"?'الاسم بالكامل':"full name"),
                      style: stylefield
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: date,
                    validator: (value) {
                      if (value.isEmpty) {
                        return languageName=="ar"?'سنه الميلاد لا يمكن ان يكون فارغ':"DOB cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _date = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: languageName=="ar"?'سنه الميلاد':"Date of Birth"),
                    style: stylefield,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: numper,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return languageName=="ar"?'رقم الهاتف لا يمكن ان يكون فارغ':"Phone number cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _number = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: languageName=="ar"?'رقم الهاتف':"Phone number"),
                    style: stylefield,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty) {
                        return languageName=="ar"?'البريد الالكتروني لا يمكن ان يكون فارغ':"Email cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: languageName=="ar"?'البريد الالكتروني':"E-mail"),
                    style: stylefield,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: numberid,
                    validator: (value) {
                      if (value.isEmpty) {
                        return languageName=="ar"?'الرقم القومي  لا يمكن ان يكون فارغ':"The national number cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _numberid = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: languageName=="ar"?'الرقم القومي':"National ID"),
                    style: stylefield,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: country,
                    validator: (value) {
                      if (value.isEmpty) {
                        return languageName=="ar"?'البلد لا يمكن ان يكون فارغ':"The country cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _country = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: languageName=="ar"?'البلد':"Country"),
                    style: stylefield,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: city,
                    validator: (value) {
                      if (value.isEmpty) {
                        return languageName=="ar"?'المحافظة لا يمكن ان يكون فارغ':"City cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _city = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: languageName=="ar"?'المحافظة':'City'),
                    style:stylefield ,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: acadmy,
                    validator: (value) {
                      if (value.isEmpty) {
                        return languageName=="ar"?'النادي لا يمكن ان يكون فارغ':"Club cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _acadmy = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: languageName=="ar"?'النادي':"Club"),
                    style: stylefield,
                  ),
                  SizedBox(height: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      color: Colors.green,
                      height: 50,
                      width: 200,
                      child: MaterialButton(
                          color: Colors.green[800],
                          child: Text(languageName=="ar"?'التالي ':"Next",style: TextStyle(fontFamily: 'Cairo',color: Colors.white,fontSize: 25)),
                          onPressed: () {
                            if (!_formkey.currentState.validate()) {
                              return;
                            }
                            _formkey.currentState.save();

                            task();

                            // Navigator.push(context, MaterialPageRoute(builder: (_) =>CheakScreen()));


                          }),
                    ),
                  ),
                  SizedBox(height: 15,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  task(){

    final name1=name.text;
    final data1 = date.text;
    final numperr=numper.text;
    final Email=email.text;
    final Numberid=numberid.text;
    final country1 = country.text;
    final City=city.text;
    final Acadmy=acadmy.text;

    FirebaseFirestore.instance.collection('acadmyOrder').add({
      'name' : name1,
      'date' : data1,
      'number' : numperr,
      'email' : Email,
      'number id' : Numberid,
      'country' : country1,
      'city' : City,
      'acadmy' : Acadmy,
    });

    name.clear();
    date.clear();
    numper.clear();
    email.clear();
    numberid.clear();
    country.clear();
    city.clear();
    acadmy.clear();
  }
}
