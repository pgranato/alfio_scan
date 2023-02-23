import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'dart:convert';

import 'package:intl/intl.dart';

import 'account_model.dart';



class EventModel extends ChangeNotifier {

  List<Event> events = [];
  late Account account;

  EventModel() {
    debugPrint("EventModel init");
  }

  setAccountData(Account account) {
    this.account = account;
    loadData();
  }


  loadData() async {
    events.clear();
    String path = "/admin/api/events";
    final response = await http.get(Uri.parse(account.baseUrl + path), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'ApiKey ${account.apiKey}',
    });
    developer.log("events response " + response.body);
    if (response.statusCode == 200) {
      var js = jsonDecode(response.body);
      for (var ejs in js) {
        Event e = Event.fromJson(ejs);
        e.baseUrl = account.baseUrl;
        events.add(e);
      }
    }
    notifyListeners();
  }
}

class Event {

  late String baseUrl;
  late String imageUrl;
  late String eventUrl;
  late String name;
  late String key;
  late String location;
  late DateTime startingDate;
  late DateTime closingDate;
  late String timeZone;


  Event.fromJson(Map<String, dynamic> json) {
    imageUrl = json["imageUrl"];
    eventUrl = json["url"];
    name = json["name"];
    key = json["key"];
    location = json["location"];
    timeZone = json["timeZone"];

    //TODO gestione delle time zone?
    startingDate = DateTime.parse(json["begin"]).toLocal();
    closingDate = DateTime.parse(json["end"]).toLocal();

  }



}

