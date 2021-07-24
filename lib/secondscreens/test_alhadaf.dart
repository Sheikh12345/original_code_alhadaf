import 'package:alhadaf/fetchScreens/acadmyorder.dart';
import 'package:alhadaf/fetchScreens/cluborders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class TestAlhadaf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
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
                height: 20,
              ),
              Text(
                languageName == "ar"
                    ? 'الأن يمكنك حجز اختبارات العديد من الأندية \nاو حجز الأكاديمية المناسبة لك عبر خدمتنا'
                    : "Now you can book tests for many clubs or \n book the appropriate academy for you through our service",
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  child: GridView.count(crossAxisCount: 2, children: [
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AcademyOrders()));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Image(
                                image: NetworkImage(

                                    ///academy
                                    languageName == "ar"
                                        ? 'https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/444.png?alt=media&token=70a15e21-bc75-4596-8374-28d3c5d8ace0'
                                        : "https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/english-version%2Facademy-booking.png?alt=media&token=f0dd25d4-c565-48bc-992e-b5c3353ce3d2"),
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => ClupsOrders()));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Image(
                                image: NetworkImage(languageName == "ar"
                                    ? 'https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/777.png?alt=media&token=65e95d39-0743-4d18-acbc-de23a278e63e'
                                    : "https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/english-version%2Ftest-booking.png?alt=media&token=71472f8f-e872-497e-a809-cfad03a925f9"),
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("ads")
                        .snapshots(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return Center(
                          child: Image(
                            image: NetworkImage(snapshot.data.docs[0]['ad']),
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
