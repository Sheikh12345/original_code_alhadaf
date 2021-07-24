import 'package:better_player/better_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../main.dart';

class Match extends StatefulWidget {

  @override
  _MatchState createState() => _MatchState();
}

class _MatchState extends State<Match> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection(languageName=="ar"?"teamTalent":"teamTalentEnglish").snapshots(),
                builder: (_,snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (_,i){
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Card(
                              child: Container(
                                height: 310,
                                color: Colors.white30,
                                child: Column(
                                  children: [
                                    //video here
                                    Container(
                                      height: 220,
                                        child:   Container(
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
                                    SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(left:8.0,right: 8.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              children: [
                                                Text(languageName=="ar"?'كود اللعب:':"Code:",style: TextStyle(fontFamily: 'Cairo',fontSize: 12,color: Colors.grey[800],fontWeight: FontWeight.bold),),
                                                SizedBox(width: 5,),
                                                Text(snapshot.data.docs[i]['code'],style: TextStyle(fontFamily: 'Cairo',fontSize: 14,color: Colors.green[600],fontWeight: FontWeight.bold),)
                                              ],
                                            ),
                                            SizedBox(width: 5,),
                                            Row(
                                              children: [
                                                Text(languageName=="ar"?' البلد:':"Country:",style: TextStyle(fontFamily: 'Cairo',fontSize: 12,color: Colors.grey[800],fontWeight: FontWeight.bold),),
                                                SizedBox(width: 5,),
                                                Text(snapshot.data.docs[i]['country'],style: TextStyle(fontFamily: 'Cairo',fontSize: 14,color: Colors.green[600],fontWeight: FontWeight.bold),)
                                              ],
                                            )
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
