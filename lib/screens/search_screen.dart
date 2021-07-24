import 'package:alhadaf/Service/firestore_data.dart';
import 'package:alhadaf/model/PlayerModel.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../main.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<PlayerModel> userFilers = [];

  @override
  @override
  void initState() {
    super.initState();
    setState(() {
      userFilers = searchList;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection:
          languageName == "ar" ? TextDirection.rtl : TextDirection.ltr,
      child: SafeArea(
          child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
              top: size.height * 0.03,
              left: size.width * 0.01,
              right: size.width * 0.01),
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/alhadaf-a3fa2.appspot.com/o/background.jpeg?alt=media&token=018e76e8-e52d-4870-b76b-20587ec780c5'),
                fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(right: size.width * 0.04),
                width: size.width * 0.86,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[400].withOpacity(0.6),
                          offset: Offset(1, 0),
                          blurRadius: 0,
                          spreadRadius: 3),
                      BoxShadow(
                          color: Colors.grey[400].withOpacity(0.6),
                          offset: Offset(0, 1),
                          blurRadius: 0,
                          spreadRadius: 1)
                    ]),
                child: TextField(
                  textDirection: languageName == "ar"
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 1, top: 6),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.green,
                      size: 25,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      userFilers = searchList
                          .where((u) => (u.position
                                  .toUpperCase()
                                  .contains(value.toUpperCase()) ||
                              u.country
                                  .toLowerCase()
                                  .contains(value.toLowerCase()) ||
                              u.code
                                  .toLowerCase()
                                  .contains(value.toLowerCase()) ||
                              u.dateOfBirth
                                  .toLowerCase()
                                  .contains(value.toLowerCase())))
                          .toList();
                    });
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: userFilers.length,
                      itemBuilder: (context, index) {
                        print("${userFilers.elementAt(index).position}");
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Card(
                            child: Container(
                              height: size.height * 0.5,
                              color: Colors.white30,
                              child: Column(
                                children: [
                                  Container(
                                    child: Container(
                                      child: AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: BetterPlayer.network(
                                          "${userFilers.elementAt(index).videoUrl}",
                                          betterPlayerConfiguration:
                                              BetterPlayerConfiguration(
                                                  aspectRatio: 16 / 9,
                                                  autoDispose: true),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: size.height * 0.1,
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                languageName == "ar"
                                                    ? 'كود اللعب:'
                                                    : "Code of player:",
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontSize: 12,
                                                    color: Colors.grey[800],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                userFilers
                                                    .elementAt(index)
                                                    .code,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontSize: 14,
                                                    color: Colors.green[600],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                languageName == "ar"
                                                    ? ' مركز اللعب:'
                                                    : "Position:",
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontSize: 12,
                                                    color: Colors.grey[800],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                userFilers
                                                    .elementAt(index)
                                                    .position,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontSize: 14,
                                                    color: Colors.green[600],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          )
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 4.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                languageName == "ar"
                                                    ? 'البلد:'
                                                    : "Country:",
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontSize: 12,
                                                    color: Colors.grey[800],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                userFilers
                                                    .elementAt(index)
                                                    .country,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontSize: 14,
                                                    color: Colors.green[600],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                languageName == "ar"
                                                    ? ' تاريخ الميلاد:'
                                                    : "Date of birth:",
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontSize: 12,
                                                    color: Colors.grey[800],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                userFilers
                                                    .elementAt(index)
                                                    .dateOfBirth,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    fontSize: 14,
                                                    color: Colors.green[600],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ]),
                                  ),
                                  Container(
                                    child: RatingBarIndicator(
                                      rating: double.parse(userFilers
                                          .elementAt(index)
                                          .rat
                                          .toString()),
                                      itemBuilder: (context, index) => Icon(
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
                      }))
            ],
          ),
        ),
      )),
    );
  }
}
