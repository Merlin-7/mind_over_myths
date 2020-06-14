import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import 'package:mind_over_myths/mind_over_myths/Model/stat.dart';
import 'package:http/http.dart' as http;
import 'package:mind_over_myths/mind_over_myths/utils/size_config.dart';
import 'package:mind_over_myths/mind_over_myths/screen/pages/CountryStatisticsNew.dart';

class GlobalStatistics extends StatefulWidget {
  GlobalStatistics({
    Key key,
  }) : super(key: key);

  @override
  _GlobalStatisticsState createState() => _GlobalStatisticsState();
}

class _GlobalStatisticsState extends State<GlobalStatistics> {
  Position _currentPosition;
  String _currentCountry;
  String countryName = '';


  // _onPressedFunction(){
  //   if(_currentCountry!=null){
  //     _getCurrentLocation();

  //   }
  //   else{
  //     _asyncInputDialog(context);
  //   }
  // }

// Future<String> _asyncInputDialog(BuildContext context) async {
  
//   return showDialog<String>(
//     context: context,
//     barrierDismissible: false, // dialog is dismissible with a tap on the barrier
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Enter your Country'),
//         content: new Row(
//           children: <Widget>[
//             new Expanded(
//                 child: new TextField(
//               autofocus: true,
//               decoration: new InputDecoration(
//                   labelText: 'Country Name ', hintText: 'eg. Ghana'),
//               onChanged: (value) {
//                 _currentCountry= value;
//               },
//             ))
//           ],
//         ),
//         actions: <Widget>[
//           FlatButton(
//             child: Text('Ok'),
//             onPressed: () {
//               Navigator.of(context).push(new MaterialPageRoute(
//                                             builder:(BuildContext context) =>
//                                                 CountryStatisticsNew(
//                                                   countryLocate:
//                                                       _currentCountry,
//                                                 )));
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

  
  Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;

 _getCurrentLocation(){
     geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentCountry = "${place.country}";
      });
    } catch (e) {
      print(e);
    }
    return _currentCountry;
  }

  Future<Null> refreshStat() async {
    await Future.delayed(Duration(seconds: 3));
  }

  final String url = "https://corona.lmao.ninja/v2/all";

  Future<Stats> getStats() async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return Stats.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Stats');
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xfffbffe8),
      body: FutureBuilder(
          future: getStats(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ));
            } else {
              return Container(
                width: SizeConfig.safeBlockHorizontal * 100,
                height: SizeConfig.safeBlockVertical * 100,
                child: Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(0 * SizeConfig.blockSizeHorizontal,
                          3.25 * SizeConfig.blockSizeHorizontal),
                      child: Stack(
                        children: <Widget>[
                          Transform.translate(
                            offset: Offset(20 * SizeConfig.safeBlockHorizontal,
                                68 * SizeConfig.safeBlockHorizontal),
                            child: SizedBox(
                              width: 196.0,
                              child: Text(
                                '${snapshot.data.cases}',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 10 * SizeConfig.safeBlockHorizontal,
                                  color: const Color(0xffab0808),
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(31 * SizeConfig.safeBlockHorizontal,
                                79.5 * SizeConfig.safeBlockHorizontal),
                            child: SizedBox(
                              width: 19 * SizeConfig.safeBlockVertical,
                              child: Text(
                                'CONFIRMED CASES',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 1.5 * SizeConfig.safeBlockVertical,
                                  color: const Color(0xffab0808),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0 * SizeConfig.safeBlockHorizontal,
                          4 * SizeConfig.safeBlockHorizontal),
                      child: Stack(
                        children: <Widget>[
                          Transform.translate(
                            offset: Offset(
                                13.8 * SizeConfig.safeBlockHorizontal,
                                53 * SizeConfig.safeBlockVertical),
                            child: SizedBox(
                              width: 16 * SizeConfig.safeBlockVertical,
                              child: Text(
                                '${snapshot.data.recovered}',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 3.5 * SizeConfig.safeBlockVertical,
                                  color: const Color(0xff000057),
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(
                                12.5 * SizeConfig.safeBlockHorizontal, 367.0),
                            child: SizedBox(
                              width: 20 * SizeConfig.safeBlockHorizontal,
                              child: Text(
                                'RECOVERIES',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize:
                                      2.5 * SizeConfig.safeBlockHorizontal,
                                  color: const Color(0xff000000),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0 * SizeConfig.safeBlockHorizontal,
                          4 * SizeConfig.safeBlockHorizontal),
                      child: Stack(
                        children: <Widget>[
                          Transform.translate(
                            offset: Offset(205.0, 340.0),
                            child: SizedBox(
                              width: 22 * SizeConfig.safeBlockHorizontal,
                              child: Text(
                                '${snapshot.data.deaths}',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 3.5 * SizeConfig.safeBlockVertical,
                                  color: const Color(0xffff003d),
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(209.0, 367.0),
                            child: SizedBox(
                              width: 48.0,
                              child: Text(
                                'DEATHS',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize:
                                      2.5 * SizeConfig.safeBlockHorizontal,
                                  color: const Color(0xff000000),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(24 * SizeConfig.safeBlockHorizontal,
                          67 * SizeConfig.safeBlockHorizontal),
                      child: SizedBox(
                        width: 156.0,
                        child: Text(
                          '${DateFormat('yyyy-MM-dd - kk:mm').format(DateTime.fromMillisecondsSinceEpoch(snapshot.data.updated, isUtc: false))} GMT',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 2.5 * SizeConfig.safeBlockHorizontal,
                            color: const Color(0xff070606),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0.0, 9.0),
                      child: Stack(
                        children: <Widget>[
                          Transform.translate(
                            offset: Offset(53.0, 449.0),
                            child: SizedBox(
                              width: 100.0,
                              child: Text(
                                'RECOVERY RATE',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize:
                                      2.5 * SizeConfig.safeBlockHorizontal,
                                  color: const Color(0xff000000),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(58.0, 416.0),
                            child: SizedBox(
                              width: 80.0,
                              child: Text(
                                '${(snapshot.data.recovered / snapshot.data.cases * 100).toStringAsFixed(2)}%',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 3.5 * SizeConfig.safeBlockVertical,
                                  color: const Color(0xff00476b),
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0.0, 9.0),
                      child: Stack(
                        children: <Widget>[
                          Transform.translate(
                            offset: Offset(202.0, 449.0),
                            child: SizedBox(
                              width: 88.0,
                              child: Text(
                                'FATALITY RATE',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize:
                                      2.5 * SizeConfig.safeBlockHorizontal,
                                  color: const Color(0xff000000),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(209.0, 416.0),
                            child: SizedBox(
                              width: 74.0,
                              child: Text(
                                '${(snapshot.data.deaths / snapshot.data.cases * 100).toStringAsFixed(2)}%',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 3.5 * SizeConfig.safeBlockVertical,
                                  color: const Color(0xffff004f),
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(21 * SizeConfig.safeBlockHorizontal,
                          139 * SizeConfig.safeBlockHorizontal),
                      child:
                          // Adobe XD layer: 'Button' (group)
                          Stack(
                        children: <Widget>[
                          Transform.translate(
                            offset: Offset(0.0 * SizeConfig.safeBlockHorizontal,
                                0.01 * SizeConfig.safeBlockHorizontal),
                            child: SizedBox(
                              width: SizeConfig.safeBlockHorizontal * 55,
                              height: SizeConfig.safeBlockVertical * 7,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                onPressed:(){
                                  _getCurrentLocation();
                                  if(_currentCountry!=null){
                                                                 Navigator.of(context).push(
                                        new MaterialPageRoute(
                                            builder:(BuildContext context) =>
                                                CountryStatisticsNew(
                                                  countryLocate:
                                                      _currentCountry,
                                                )));}


                                //if (_currentCountry!=null){
                                //   _getCurrentLocation();
                                // }
                                // {  
                                //   _getCurrentLocation();
                                //   if (_currentCountry != null) {
                                //   print("_currentCountry");

                                //     Navigator.of(context).push(
                                //         new MaterialPageRoute(
                                //             builder:(BuildContext context) =>
                                //                 CountryStatisticsNew(
                                //                   countryLocate:
                                //                       _currentCountry,
                                //                 )));
                                  

                                //   }
                                
                                //   else{
                                //   _asyncInputDialog();

                                //   }
                                  
                                  
                                },
                                color: Colors.green[800],
                                child: Text(
                                  " Country Statitistics".toUpperCase(),
                                  style: TextStyle(
                                    fontSize:
                                        4 * SizeConfig.safeBlockHorizontal,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0.0, 74.0),
                      child: Container(
                        width: 360.0,
                        height: 189.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage('assets/images/map.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(26.0, 50.0),
                      child: Text(
                        'WORLDWIDE STATISTICS',
                        style: TextStyle(
                          fontFamily: 'Muli',
                          fontSize: 14,
                          color: const Color(0xffff4747),
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }

  // Future<Position> _getLocation() async {
  //   var currentLocation;
  //   GeolocationStatus geolocationStatus  = await geolocator.checkGeolocationPermissionStatus();
  //   try {
  //     currentLocation = await geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.best);
  //   } catch (e) {
  //     currentLocation = null;
  //   }
  //   return currentLocation;
  // }
}
