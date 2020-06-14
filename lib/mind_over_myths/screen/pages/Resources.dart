import 'package:flutter/material.dart';
import 'package:mind_over_myths/mind_over_myths/screen/pages/Homepage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mind_over_myths/mind_over_myths/utils/size_config.dart';
import 'package:mind_over_myths/mind_over_myths/screen/pages/CountryStatisticsNew.dart';

class Resources extends StatefulWidget {
  final String country;
  Resources({
    Key key,this.country,
  }) : super(key: key);

  @override
  _ResourcesState createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    
   
    return Scaffold(
      backgroundColor: const Color(0xfffbffe8),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 15.0,
                left: 30.0,
                child: Text(
                  'COVID 19',
                  style: TextStyle(
                    fontFamily: 'Muli',
                    fontSize: 19,
                    color: const Color(0xff707070),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Positioned(
                top: 40.0,
                left: 30.0,
                child: Text(
                  'HEALTH TIPS & RESOURCES',
                  style: TextStyle(
                    fontFamily: 'Muli',
                    fontSize: 17,
                    color: const Color(0xffff4747),
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Positioned(
                top: 80.0,
                left: 35.0,
                child: SizedBox(
                  width: 252.0,
                  child: Text(
                    'WHATSAPP SUPPORT CENTRES',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 14,
                      color: const Color(0xff362f2c),
                      fontWeight: FontWeight.w700,
                      height: 1.0714285714285714,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Positioned(
                top: 115.0,
                left: 60.0,
                child: SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 24,
                  height: SizeConfig.safeBlockVertical * 15,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    onPressed: () async {
                      if (await canLaunch("http://wa.me/41798931892?text=hi"))
                        await launch(
                          "http://wa.me/41798931892?text=hi",
                        );
                    },
                    color: Colors.white,
                    child: Container(
                      width: 65.0,
                      height: 67.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/images/who.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 115,
                right: 100.0,
                child: SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 24,
                  height: SizeConfig.safeBlockVertical * 15,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    onPressed: () async {
                      if (await canLaunch("https://wa.me/17272912606?text=hi"))
                        await launch(
                          "https://wa.me/17272912606?text=hi",
                        );
                    },
                    color: Colors.white,
                    child: Container(
                      width: 65,
                      height: 67,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/images/ifcn.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 280,
                left: 35.0,
                child: Text(
                  'VIDEO RESOURCES',
                  style: TextStyle(
                    fontFamily: 'Muli',
                    fontSize: 15,
                    color: const Color(0xff707070),
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Positioned(
                top: 250,
                left: 30.0,
                child: Container(
                  height: 95.0,
                  width: 290.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19.0),
                      color: const Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 50.0),
                    child: Text(
                      "SUICIDE HOTLINE",
                      style: TextStyle(
                          fontSize: 17,
                          color: const Color(0xff362f2c),
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 275,
                left: 40,
                child:
                    //  'emergency' (shape)
                    Container(
                  width: 70.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/images/emergency.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 300.0,
                  left: 115,
                  child: SizedBox(
                    height: 30,
                    width: 170,
                    child: RaisedButton(
                      onPressed: () async {
                        if (await canLaunch(
                            "https://www.befrienders.org"))
                          await launch(
                            "https://www.befrienders.org/",
                          );
                      },
                      elevation: 2.0,
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0)),
                      child: Text(
                        'GET HELP',
                        style: TextStyle(
                          fontFamily: 'OpenSans-Extrabold',
                          fontSize: 11,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
              Positioned(
                  top: 375,
                  left: 30.0,
                  child: SizedBox(
                      height: 150,
                      width: 135,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () async {
                        if (await canLaunch(
                            "https://www.youtube.com/playlist?list=PLFHnvJbgosjKVFmg-tBEU4vGKbxzlw_5i"))
                          await launch(
                            "https://www.youtube.com/playlist?list=PLFHnvJbgosjKVFmg-tBEU4vGKbxzlw_5i",
                          );},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        elevation: 3.0,
                        child: Image(
                          width: 100.0,
                          height: 110.00,
                          image: AssetImage('assets/images/crisis.png'),
                          fit: BoxFit.fill,
                        ),
                      ))),
              Positioned(
                top: 545,
                left: 50.0,
                child: Text(
                  'COPING THROUGH\nTHIS CRISIS',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 11,
                    color: const Color(0xff707070),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                  top: 375.0,
                  left: 160.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: SizedBox(
                        height: 150,
                        width: 135,
                        child: RaisedButton(
                          onPressed: () async {
                        if (await canLaunch(
                            "https://www.youtube.com/playlist?list=PLFHnvJbgosjKHkguJ2vGhjjXcoiyE14TU"))
                          await launch(
                            "https://www.youtube.com/playlist?list=PLFHnvJbgosjKHkguJ2vGhjjXcoiyE14TU",
                          );},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          elevation: 3.0,
                          color: Colors.white,
                          child: Image(
                            image: AssetImage('assets/images/coronavirus.png'),
                            fit: BoxFit.fill,
                          ),
                        )),
                  )),
              Positioned(
                top: 545.0,
                left: 210.0,
                child: Text(
                  'COVID-19 \nINFORMATION',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 11,
                    color: const Color(0xff707070),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
