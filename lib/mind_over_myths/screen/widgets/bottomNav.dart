import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mind_over_myths/mind_over_myths/screen/pages/Bot.dart';
import 'package:mind_over_myths/mind_over_myths/screen/pages/Homepage.dart';
import 'package:mind_over_myths/mind_over_myths/screen/pages/Resources.dart';
import 'package:mind_over_myths/mind_over_myths/screen/pages/Symptoms.dart';
import 'package:mind_over_myths/mind_over_myths/screen/pages/XDGlobalStatistics.dart';
import 'package:mind_over_myths/mind_over_myths/screen/pages/news.dart';

class BottomNavigation extends StatefulWidget {
  @override
  BottomNavigation({
    Key key,
  }) : super(key: key);
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation>
    with AutomaticKeepAliveClientMixin {
  int _currentIndex = 0;
  final List<Widget> _children = [
    NewsPage(),
    GlobalStatistics(),
    Symptoms(),
    Resources(),
    Bot()
  ];

  void onTappedItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.newspaper,
              ),
              title: Text("News")),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.chartLine,
              ),
              title: Text("Statistics")),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.bookMedical,
              ),
              title: Text("Symptoms")),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.phone,
              ),
              title: Text("Resources & Hotline")),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.sms,
              ),
              title: Text("Rapid Response")),
        ],
        currentIndex: _currentIndex,
        onTap: onTappedItem,
        selectedItemColor: Colors.red[800],
        unselectedItemColor: Colors.grey[800],
        backgroundColor: const Color(0xfffbffe8),
        elevation: 8.0,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
