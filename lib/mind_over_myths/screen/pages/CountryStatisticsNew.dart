import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mind_over_myths/mind_over_myths/Model/countrystats.dart';
import 'dart:convert';
import 'package:flutter/widgets.dart';


class CountryStatisticsNew extends StatefulWidget {
  

  CountryStatisticsNew({Key key, this.countryLocate}) : super(key: key);
  final String countryLocate;

  @override
  _CountryStatisticsNewState createState() => _CountryStatisticsNewState();
}

class _CountryStatisticsNewState extends State<CountryStatisticsNew> { 
 

  Future<CountryStats> getCountryStats() async {
     final String country ='${widget.countryLocate}';
    final url =
        "https://disease.sh/v2/countries/${country}?yesterday=false&strict=true";

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return CountryStats.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Country Statistics');
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color(0xfffff6d8),
      body: FutureBuilder(
          future: getCountryStats(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 43.0,
                        left: 96.0,
                        width: 163.2,
                        child: Text(
                          '${snapshot.data.country} OVERVIEW'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Positioned(
                        top: 39,
                        left: 55,
                        width: 32,
                        height: 32,
                        child: Container(
                          width: 32.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            image: DecorationImage(
                              image: NetworkImage(snapshot.data.flag),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x29000000),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 60,
                        right: 45,
                        // offset: Offset(27.0, 384.0),
                        child: Container(
                          width: 306.0,
                          height: 207.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.0),
                            color: const Color(0xffffe078),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(27.0, 256.0),
                        child: Container(
                          width: 306.0,
                          height: 101.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.0),
                            color: const Color(0xffffe078),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(92.0, 64.0),
                        child: Text(
                          '${DateFormat('yyyy-MM-dd - kk:mm').format(DateTime.fromMillisecondsSinceEpoch(snapshot.data.updated, isUtc: false))} GMT',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 13,
                            color: const Color(0xff000000),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(27.0, 113.0),
                        child: Container(
                          width: 306.0,
                          height: 101.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.0),
                            color: const Color(0xffffe078),
                          ),
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          Transform.translate(
                            offset: Offset(49.0, 124.0),
                            child: Text(
                              'CASES',
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                color: const Color(0xff00155a),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(43.0, 142.0),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7.5),
                              child: Text(
                                '${snapshot.data.cases}',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: const Color(0xff00155a),
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: <Widget>[
                          Transform.translate(
                            offset: Offset(250.0, 124.0),
                            child: Text(
                              'DEATHS',
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                color: const Color(0xfff8003b),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(265, 142.0),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7.5),
                              child: Text(
                                '${snapshot.data.deaths}',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: const Color(0xfff8003b),
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Transform.translate(
                        offset: Offset(49.0, 266.0),
                        child: Text(
                          'RECOVERED ',
                          style: TextStyle(
                            fontSize: 10,
                            color: const Color(0xff00548d),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),

                      //Icons for Cases, Deaths, Recovered, & Critical Cases

                      //Cases - PieChart
                      Positioned(
                          top: 170,
                          left: 60,
                          child: Container(
                              height: 35,
                              width: 40,
                              child: Icon(FontAwesomeIcons.chartPie,
                                  size: 40.0, color: Color(0xfff8003b)))),
                      //   Deaths - SkullCrossbOne
                      Positioned(
                          top: 170,
                          right: 60,
                          child: Container(
                              height: 35,
                              width: 40,
                              child: Icon(FontAwesomeIcons.skullCrossbones,
                                  size: 40.0, color: Color(0xfff8003b)))),

                      // Recovered - Smiley Faces
                      Positioned(
                          top: 310,
                          left: 60,
                          child: Container(
                              height: 35,
                              width: 40,
                              child: Icon(FontAwesomeIcons.smile,
                                  size: 40.0, color: Color(0xfff8003b)))),

                      //Critical - Exclamation
                      Positioned(
                          top: 310,
                          right: 60,
                          child: Container(
                              height: 35,
                              width: 40,
                              child: Icon(FontAwesomeIcons.exclamationTriangle,
                                  size: 40.0, color: Color(0xfff8003b)))),

                      Positioned(
                        top: 285,
                        right: 60,
                        child: Text(
                          '${snapshot.data.critical}',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 25,
                            color: const Color(0xfff8003b),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(241.0, 266.0),
                        child: Text(
                          'CRITICAL CASES',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 10,
                            color: const Color(0xfff8003b),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(43.0, 284.0),
                        child: Text(
                          '${snapshot.data.recovered}',
                          style: TextStyle(
                            fontSize: 25,
                            color: const Color(0xff00548d),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(42.0, 413.0),
                        child: Text(
                          'ACTIVE CASES',
                          style: TextStyle(
                            fontSize: 10,
                            color: const Color(0xff005d1f),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Positioned(
                        top: 430,
                        left: 240,

                        // offset: Offset(235.0, 431.0),
                        child: Text(
                          '${(snapshot.data.deaths / snapshot.data.cases * 100).toStringAsFixed(2)}%',
                          style: TextStyle(
                            fontSize: 25,
                            color: const Color(0xffff0000),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(241.0, 413.0),
                        child: Text(
                          'FATALITY RATE',
                          style: TextStyle(
                            fontSize: 10,
                            color: const Color(0xffff0000),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(36.0, 431.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '${(snapshot.data.cases - snapshot.data.recovered)}',
                            style: TextStyle(
                              fontSize: 25,
                              color: const Color(0xff005d1f),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(42.0, 520.0),
                        child: Text(
                          '${(snapshot.data.recovered / snapshot.data.cases * 100).toStringAsFixed(2)}%',
                          style: TextStyle(
                            fontSize: 25,
                            color: const Color(0xff690fdf),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(42.0, 502.0),
                        child: Text(
                          'RECOVERY RATE',
                          style: TextStyle(
                            fontSize: 10,
                            color: const Color(0xff690fdf),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
