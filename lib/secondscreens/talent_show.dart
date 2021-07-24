import 'package:flutter/material.dart';
import '../main.dart';
import '../tabs/person.dart';
import '../tabs/match.dart';

class TalentShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:languageName=="ar"? TextDirection.rtl:TextDirection.ltr,
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green[800],
              bottom: TabBar(
                  indicatorColor: Colors.white,
                  isScrollable: false,
                  tabs: [
                    Tab(
                      child: Container(
                        child: Text(
                          languageName=="ar"?'الفردي':"Singular player",
                          style: TextStyle(fontFamily:'Cairo',fontSize: 18,color: Colors.white),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          languageName=="ar"? 'المباريات':"Match",
                          style: TextStyle(fontFamily:'Cairo',fontSize: 18,color: Colors.white),
                        ),
                      ),
                    ),
                  ]
              ) ,
            ),
            body: TabBarView(
              children: [
                Person(),
                Match()
              ],
            ),
          )),
    );
  }
}
