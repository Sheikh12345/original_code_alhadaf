import 'package:alhadaf/main.dart';
import 'package:alhadaf/model/PlayerModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<PlayerModel> searchList = [];


class Database{

  static String code="";
  static String country="";
  static String dob="";
  static int rat=0;
  static String video="";
  static String position="";


  static Future fetchData()async{
    searchList = [];
    CollectionReference _reference = FirebaseFirestore.instance.collection(languageName=="ar"?"personTalent":"personTalentEnglish");
    QuerySnapshot querySnapshot =
        await _reference.get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
     await _reference.doc(querySnapshot.docs[i].id).get().then((value){
        print(value.get("code"));
        code = value.get("code");
        country = value.get("country");
        dob = value.get("DOB");
        rat = value.get("rat");
        video = value.get("video");
        position = value.get("position");
      }).whenComplete((){
        print("$position");
        searchList.add( PlayerModel(
            code: code,
            country: country,
            dateOfBirth: dob,
            position:position,
            rat:rat,
            videoUrl: video
        ),
        );
      });
    }
       Future.delayed(Duration(seconds: 4),(){
         print("search list => ${searchList.length}");
         return searchList;
       });
  }

}