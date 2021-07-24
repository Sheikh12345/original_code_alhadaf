import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrainingThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("تدريبات حراس المرمي").snapshots(),
          builder: (_,snapshot){
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else{
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (_,index){
                  YoutubePlayerController controller =snapshot.data.docs[index]["url"].toString().length<4?null: YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(snapshot.data.docs[index]["url"]),
                    flags: YoutubePlayerFlags(
                        autoPlay: false,
                        mute:  true
                    ),
                  );
                  return Column(
                    children: [
                      snapshot.data.docs[index]["url"].toString().length>4?  Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.height / 4,
                        child: YoutubePlayer(
                          controller: controller,
                          liveUIColor: Colors.amber,
                        ),
                      ):Container(),
                      SizedBox(height: 10,),
                      Text(snapshot.data.docs[index]["text"],style: TextStyle(fontSize: 12,color: Colors.green[800]),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
