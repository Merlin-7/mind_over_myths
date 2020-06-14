import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'dart:async';
import 'package:mind_over_myths/mind_over_myths/Model/articles.dart';
import 'package:timeago/timeago.dart' as timeago;
class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  var jsonData;
  bool loading = true;

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 3));
  }

  _getNews() async {
    var res = await http.get(
        Uri.encodeFull(
            "https://newsapi.org/v2/everything?q=coronavirus&sortBy=publishedAt&language=en&apiKey=d5c1f8db8b6f44b49354f8fd33d9ba4e"),
        headers: {"Accept": "application/json"});
    if (res.statusCode==200) {
      
    jsonData = json.decode(res.body)['articles'].map((data)=> Articles.fromJson(data)).toList();

    return jsonData;
      
    } else {
      throw Exception("Something went wrong $jsonData");
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: RefreshIndicator(
        onRefresh: refreshList,
        child: FutureBuilder(
            future: _getNews(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              
             
              if (snapshot.data == null) {
            

                return SafeArea(
                                  child: Container(
                      child: Center(
                    child: CircularProgressIndicator(),
                  )),
                );
              } else {
                return Column(
                  children: <Widget>[
                    Flexible(
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            



                            final postTime = DateTime.parse(snapshot.data[index].publishedAt);
                            final now = DateTime.now();
                            final difference = now.difference(postTime);
                            
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                child: ListTile(
                                  title: Text(snapshot.data[index].title),
                                  subtitle:
                                      Text(timeago.format(now.subtract(difference))),
                                  trailing: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width: 100.0,
                                        child: Image.network(
                                                snapshot.data[index].urlToImage,
                                                fit: BoxFit.cover) ??
                                            null,
                                      )),
                                ),
                                onTap: () async {
                                  if (await canLaunch(snapshot.data[index].url))
                                    await launch(
                                      snapshot.data[index].url,
                                      forceSafariVC: true,
                                      forceWebView: true,
                                    );
                                },
                              ),
                            );
                          }),
                    ),
                  ],
                );
              }
            }),
      ),
      
    );
  }
}