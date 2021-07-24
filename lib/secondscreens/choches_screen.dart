import 'package:alhadaf/sendScreens/trainerClub.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ChochesScreen extends StatelessWidget {
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
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: 210,
                    width: double.infinity,
                    child: GridView.count(crossAxisCount: 2, children: [
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> TrainerClub()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 15,
                            child: Column(
                              children: [
                                Image(
                                  image: NetworkImage(
                                    languageName=="ar"? 'https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/firsticon.png?alt=media&token=807f9b44-8e95-4dec-974b-46f51f30acca':"https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/english-version%2Fintro_new_coach.png?alt=media&token=99ffe211-f344-448c-b317-88cddaf23f1e"),
                                  fit: BoxFit.cover,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          onTap: (){
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Image(
                                  image: NetworkImage(
                                      languageName=="ar"?'https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/secondicon.png?alt=media&token=ec5b7188-3b84-4fc8-9ab0-6ca21f9e2208':"https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/english-version%2Fview_coaches_file.png?alt=media&token=5f1b746c-6f5b-46f1-a7ac-f16b777c3895"),
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
                SizedBox(height: 20,),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection("ads").snapshots(),
                      builder: (_,snapshot){
                        if(snapshot.hasData){
                          return Center(
                            child: Image(
                              image: NetworkImage(snapshot.data.docs[0]['ad']),
                            ),
                          );
                        }else{
                          return Center(child: CircularProgressIndicator(),);
                        }
                      },
                    )
                ),
                SizedBox(height: 20,),
              ],
            ),
        ),
      ),
    );
  }
}
