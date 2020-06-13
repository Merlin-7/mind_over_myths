import 'package:flutter/material.dart';
import 'package:adobe_xd/blend_mask.dart';

import 'package:mind_over_myths/mind_over_myths/utils/size_config.dart';
import 'package:mind_over_myths/mind_over_myths/screen/pages/Prevention.dart';

class Symptoms extends StatelessWidget {
  Symptoms({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xfffbffe8),
      body: Stack(
        children: <Widget>[
          Container(
            width: SizeConfig.safeBlockHorizontal*100,
          height: SizeConfig.safeBlockVertical*100,
            decoration: BoxDecoration(
              color: const Color(0xfffbffe8),
              border: Border.all(width: 1.0, color: const Color(0xff707070)),
            ),
          ),
          Transform.translate(
            offset: Offset(36.0, 7.0),
            child:
                // Adobe XD layer: 'Group for Symptoms …' (group)
                BlendMask(
              blendMode: BlendMode.multiply,
              opacity: 1,
              region: Offset(36.0, 6.0) & Size(264.0, 263.0),
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(10.0, 9.0),
                    child: Text(
                      'COVID 19',
                      style: TextStyle(
                        fontFamily: 'Muli',
                        fontSize: 17,
                        color: const Color(0xff707070),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(10.0, 30.0),
                    child: Text(
                      'SYMPTOMS',
                      style: TextStyle(
                        fontFamily: 'Muli',
                        fontSize: 23,
                        color: const Color(0xffff4747),
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Transform(
                    transform: Matrix4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0,
                        0.0, 0.0, 1.0, 0.0, 37.0, 35.0, 0.0, 1.0),
                    child:
                        // Adobe XD layer: 'Fighting against Co…' (shape)
                        Container(
                      width: 217.0,
                      height: 217.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              const AssetImage('assets/images/fight.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(19.0, 260.97),
            child:
                // Adobe XD layer: 'Short Notes (Sympto…' (group)
                Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(0.0, 0.03),
                  child: Container(
                    width: 322.0,
                    height: 130.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23.0),
                      color: const Color(0xffffffff),
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
                Transform.translate(
                  offset: Offset(16.0, 14.03),
                  child: Text(
                     'Symptoms ranged from mild to severe \nrespiratory illness. It may take 1-14 days \nfor an infected person to show signs \nand symptoms of the disease.\nIf without symptoms, an infected person\ncan still pass the virus ',
                    
                    style: TextStyle(
                      fontFamily: 'Muli',
                      fontSize: 15,
                      color: const Color(0xff707070),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(14.0, 394.99),
            child:
                // Adobe XD layer: 'Symptoms' (group)
                BlendMask(
              blendMode: BlendMode.srcOver,
              opacity: 1,
              region: Offset(14.0, 395.0) & Size(332.0, 118.0),
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(0.0, 0.0),
                    child:
                        // Adobe XD layer: 'Fever' (group)
                        Stack(
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(0.0, 0.01),
                          child:
                              // Adobe XD layer: 'covid-19-symptom-ch…' (shape)
                              Container(
                            width: 95.0,
                            height: 96.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage('assets/images/fever.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(22.0, 102.01),
                          child: SizedBox(
                            width: 32.0,
                            child: Text(
                              'FEVER',
                              style: TextStyle(
                                fontFamily: 'Muli',
                                fontSize: 10,
                                color: const Color(0xffff0000),
                                fontWeight: FontWeight.w800,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(120.0, 4.0),
                    child:
                        // Adobe XD layer: 'Cough' (group)
                        Stack(
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(0.0, 0.01),
                          child:
                              // Adobe XD layer: 'covid-19-symptom-ch…' (shape)
                              Container(
                            width: 98.0,
                            height: 98.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage('assets/images/cough.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(21.0, 100.01),
                          child: SizedBox(
                            width: 40.0,
                            child: Text(
                              'COUGH',
                              style: TextStyle(
                                fontFamily: 'Muli',
                                fontSize: 10,
                                color: const Color(0xffff0000),
                                fontWeight: FontWeight.w800,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(242.0, 12.0),
                    child:
                        // Adobe XD layer: 'Headache' (group)
                        Stack(
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(0.0, 0.01),
                          child:
                              // Adobe XD layer: 'covid-19-symptom-ch…' (shape)
                              Container(
                            width: 90.0,
                            height: 90.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage('assets/images/headache.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(16.0, 92.01),
                          child: SizedBox(
                            width: 60.0,
                            child: Text(
                              'HEADACHE',
                              style: TextStyle(
                                fontFamily: 'Muli',
                                fontSize: 10,
                                color: const Color(0xffff0000),
                                fontWeight: FontWeight.w800,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
                offset: Offset(22*SizeConfig.safeBlockHorizontal, 141*SizeConfig.safeBlockHorizontal),
                child:
                    // Adobe XD layer: 'Button' (group)
                    Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(-12*SizeConfig.safeBlockHorizontal, 0.01*SizeConfig.safeBlockHorizontal),
                      child: SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 80,
                        height: SizeConfig.safeBlockVertical * 7,
                                              child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          onPressed: (){
                            Navigator.of(context).push(
                              new MaterialPageRoute(builder: (BuildContext context)=>Prevention())

                            );
                            print("BottomNavigation Tapped");
                          },
                          color: Colors.white,
                          child: Text("Prevention".toUpperCase(),
                          style: TextStyle(
                            fontSize: 5*SizeConfig.safeBlockHorizontal,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                          ),

                        ),
                      ),
                     
                    ),
                   
                  ],
                ),
              ),
          // Transform.translate(
          //   offset: Offset(19.0, 539.0),
          //   child:
          //       // Adobe XD layer: 'Button for Preventi…' (group)
          //       Stack(
          //     children: <Widget>[
          //       Container(
          //         width: 322.0,
          //         height: 43.0,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(23.0),
          //           color: const Color(0xffffffff),
          //           boxShadow: [
          //             BoxShadow(
          //               color: const Color(0x29000000),
          //               offset: Offset(0, 3),
          //               blurRadius: 6,
          //             ),
          //           ],
          //         ),
          //       ),
          //       Transform.translate(
          //         offset: Offset(100.0, 9.0),
          //         child: Text(
          //           'PREVENTION',
          //           style: TextStyle(
          //             fontFamily: 'Muli',
          //             fontSize: 18,
          //             color: const Color(0xff000000),
          //             fontWeight: FontWeight.w800,
          //           ),
          //           textAlign: TextAlign.left,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
