import 'package:alhadaf/fetchScreens/dateacadmy.dart';
import 'package:alhadaf/fetchScreens/dateclubs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class DateAlhadaf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:languageName=="ar"? TextDirection.rtl:TextDirection.ltr,
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
                Stack(
                    children: [
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
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),),
                      )
                    ]
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      color: Colors.black,
                      child: MaterialButton(
                        color: Colors.black,
                          child: Text(languageName=="ar"?'مواعيد اختبارات الأندية':"Club test dates",style: TextStyle(
                              fontFamily: 'Cairo',
                              color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                          onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>DateClubs()));
                          }),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      color: Colors.black,
                      child: MaterialButton(
                        color: Colors.black,
                          child: Text(languageName=="ar"?'مواعيد تدريب الأكاديمية':"Academy dates",style: TextStyle(
                              fontFamily: 'Cairo',
                              color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>DateAcadmy()));
                          }),
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection("ads").snapshots(),
                      builder: (_,snapshot){
                        if(snapshot.hasData){
                          return Center(
                            child: InkWell(
                              onTap: (){
                              },
                              child: Image(
                                image: NetworkImage(snapshot.data.docs[0]['ad']),
                              ),
                            ),
                          );
                        }else{
                          return Center(child: CircularProgressIndicator(),);
                        }
                      },
                    )
                ),
              ],
            ),
        ),
      ),
    );
  }
}
