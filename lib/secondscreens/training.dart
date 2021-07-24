import 'package:alhadaf/tabs/attacs.dart';
import 'package:alhadaf/tabs/sports_training.dart';
import 'package:alhadaf/tabs/trainingFour.dart';
import 'package:alhadaf/tabs/trainingthree.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Training extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:languageName=="ar"? TextDirection.rtl:TextDirection.ltr,
      child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green[800],
              bottom: TabBar(
                indicatorColor: Colors.white,
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Container(
                      child: Text(
                        languageName=="ar"? 'تدريبات رياضية':"Sports workouts",
                        style: TextStyle(fontFamily:'Cairo',fontSize: 18,color: Colors.white),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        languageName=="ar"?'تكتيكات':"tactics",
                        style:TextStyle(fontFamily:'Cairo',fontSize: 18,color: Colors.white),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        languageName=="ar"? 'تدريبات حراس المرمي':"Goalkeepers training",
                        style:TextStyle(fontFamily:'Cairo',fontSize: 18,color: Colors.white),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        languageName=="ar"?  'تدريبات المدربين':"Coaches training",
                        style:TextStyle(fontFamily:'Cairo',fontSize: 18,color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                SportsTraining(),
              tactics()  ,
              TrainingThree(),
              TrainingFour()
              ],
            ),
          ),
      ),
    );
  }
}
