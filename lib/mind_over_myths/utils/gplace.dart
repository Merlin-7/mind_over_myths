import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:mind_over_myths/mind_over_myths/Model/place_model.dart';

class LocationService {
  static final _locationService = new LocationService();

  

  static LocationService get() {
    return _locationService;
  }

  final String detailUrl =
      "https://maps.googleapis.com/maps/api/place/details/json?key=AIzaSyClBrHT6FAC5qhXVqlVZIJ78cYfaGSQtSc&placeid=";
  final String url =
      "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=47.01769555301882,106.08477864414454&radius=1500&key=AIzaSyClBrHT6FAC5qhXVqlVZIJ78cYfaGSQtSc	";

  Future<List<PlaceDetail>> getNearbyPlaces() async {
    var reponse = await http.get(url, headers: {"Accept": "application/json"});

    List data = json.decode(reponse.body)["results"];
    var places = <PlaceDetail>[];
    data.forEach((f) => places.add(new PlaceDetail(f["place_id"], f["name"],
        f["icon"], f["rating"].toString(), f["vicinity"])));

    return places;
  }

  Future getPlace(String place_id) async {
    var response = await http
        .get(detailUrl + place_id, headers: {"Accept": "application/json"});
    var result = json.decode(response.body)["result"];
   

    List<String> weekdays = [];
    if (result["opening_hours"] != null)
      weekdays = result["opening_hours"]["weekday_text"];
    return new PlaceDetail(
        result["place_id"],
        result["name"],
        result["icon"],
        result["rating"].toString(),
        result["vicinity"],
        result["formatted_address"],
        result["international_phone_number"],
        weekdays);
  }
}