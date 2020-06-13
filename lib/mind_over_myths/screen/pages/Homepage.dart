import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mind_over_myths/mind_over_myths/screen/widgets/bottomNav.dart';
import 'package:mind_over_myths/mind_over_myths/utils/size_config.dart';



class Homepage extends StatefulWidget {
  final String country;
  Homepage({
    Key key,this.country
  }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
   Position _currentPosition;

  String _currentCountry;

  Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;

 _getCurrentLocation() {
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
        _currentCountry =
            "${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
          return Scaffold(
        backgroundColor: const Color(0xfffbffe8),
        body: SafeArea(
          child: Container(
            width: SizeConfig.safeBlockHorizontal*100,
            height: SizeConfig.safeBlockVertical*100,
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(11 * SizeConfig.safeBlockHorizontal,
                      22 * SizeConfig.safeBlockHorizontal),
                  child:
                      
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(0.4*SizeConfig.safeBlockHorizontal, 0.65*SizeConfig.safeBlockHorizontal),
                        child:
                          
                            Container(
                          width: 70 * SizeConfig.safeBlockHorizontal,
                          height: 72 * SizeConfig.safeBlockHorizontal,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage(
                                  'assets/images/health_team.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(-2 * SizeConfig.safeBlockHorizontal,
                            75 * SizeConfig.safeBlockHorizontal),
                        child: SizedBox(
                          width: 80*SizeConfig.safeBlockHorizontal,
                          child: Text(
                            'To our heroes without capes, \nwe stand firmly with you. We pray\nthat we can rise above this, \nstronger together after weathering\nthis storm. May we never\nforget that during this \ndark chapter of our history,\nyou taught us to be brave ',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 4 * SizeConfig.safeBlockHorizontal,
                              color: const Color(0xff000000),
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(21*SizeConfig.safeBlockHorizontal, 139*SizeConfig.safeBlockHorizontal),
                  child:
                      // Adobe XD layer: 'Button' (group)
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(0.0*SizeConfig.safeBlockHorizontal, 0.01*SizeConfig.safeBlockHorizontal),
                        child: SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 55,
                          height: SizeConfig.safeBlockVertical * 7,
                                                child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            onPressed: (){
                                _getCurrentLocation();
                                if(_currentCountry !=null){
                              
                              print(_currentCountry);

                                }else{
                                  Navigator.of(context).push(
                                new MaterialPageRoute(builder: (BuildContext context)=> BottomNavigation(),)

                              );
                              print("BottomNavigation Tapped");}
                            },
                            color: const Color(0xff0d0b1a),
                            child: Text("Getting Started".toUpperCase(),
                            style: TextStyle(
                              fontSize: 5*SizeConfig.safeBlockHorizontal,
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

              ],
            ),
             
          ),
        ),
    );
  }
}
