import 'package:better_player/better_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../main.dart';

class Person extends StatefulWidget {

  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: ()async {
        if (true) {
          Navigator.pop(context);
          return true;
        }

      },
      child: Scaffold(
        body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: NetworkImage(
        'https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/background.jpeg?alt=media&token=018e76e8-e52d-4870-b76b-20587ec780c5'),
         fit: BoxFit.fill),),
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection(languageName=="ar"?"personTalent":"personTalentEnglish").snapshots(),
              builder: (_,snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (_,i){
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Card(
                            child: Container(
                              height: size.height*0.48,
                              color: Colors.white30,
                              child: Column(
                                children: [
                                //video here
                              Card(
                                child:    Container(
                                    height: size.height*0.32,
                                    child:  Container(
                                        child: AspectRatio(
                                          aspectRatio: 16 / 9,
                                          child: BetterPlayer.network(
                                            "${snapshot.data.docs[i]['video']}",
                                            betterPlayerConfiguration: BetterPlayerConfiguration(
                                                aspectRatio: 16 / 9,
                                                autoDispose: true,
                                              autoPlay: false,
                                              handleLifecycle: false,

                                            ),
                                          ),
                                        )
                                    ),
                                ),
                              ),
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.only(left:8.0,right: 8.0),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                        Row(
                                          children: [
                                            Text(languageName=="ar"?'?????? ??????????:':'Code:',style: TextStyle(fontFamily: 'Cairo',fontSize: 12,color: Colors.grey[800],fontWeight: FontWeight.bold),),
                                            SizedBox(width: 5,),
                                            Text(snapshot.data.docs[i]['code'],style: TextStyle(fontFamily: 'Cairo',fontSize: 14,color: Colors.green[600],fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                        SizedBox(width: 5,),
                                        Row(
                                          children: [
                                            Text(languageName=="ar"?' ???????? ??????????:':'Position:',style: TextStyle(fontFamily: 'Cairo',fontSize: 12,color: Colors.grey[800],fontWeight: FontWeight.bold),),
                                            SizedBox(width: 5,),
                                           Text(snapshot.data.docs[i]['position'],style: TextStyle(fontFamily: 'Cairo',fontSize: 14,color: Colors.green[600],fontWeight: FontWeight.bold),)
                                          ],
                                        )
                                        ]
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:8.0,right: 4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              Text(languageName=="ar"?'??????????:':"Country:",style: TextStyle(fontFamily: 'Cairo',fontSize: 12,color: Colors.grey[800],fontWeight: FontWeight.bold),),
                                              SizedBox(width: 5,),
                                              Text(snapshot.data.docs[i]['country'],style: TextStyle(fontFamily: 'Cairo',fontSize: 14,color: Colors.green[600],fontWeight: FontWeight.bold),)
                                            ],
                                          ),
                                          SizedBox(width: 5,),
                                          Row(
                                            children: [
                                              Text(languageName=="ar"?' ?????????? ??????????????:':"Date of Birth:",style: TextStyle(fontFamily: 'Cairo',fontSize: 12,color: Colors.grey[800],fontWeight: FontWeight.bold),),
                                              SizedBox(width: 5,),
                                              Text(snapshot.data.docs[i]['DOB'],style: TextStyle(fontFamily: 'Cairo',fontSize: 14,color: Colors.green[600],fontWeight: FontWeight.bold),)
                                            ],
                                          ),
                                        ]
                                    ),
                                  ),
                              Container(
                              child: RatingBarIndicator(
                                rating: double.parse(snapshot.data
                                    .docs[i]["rat"].toString()),
                                itemBuilder:
                                    (context, index) =>
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                itemCount: 5,
                                itemSize: size.width * 0.08,
                                direction: Axis.horizontal,
                              ),
                            ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }else{
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        )
      ),
    );
  }
}
