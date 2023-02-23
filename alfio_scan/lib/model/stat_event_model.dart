import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'dart:convert';

import 'package:intl/intl.dart';

import 'account_model.dart';
import 'event_model.dart';



class StatEventModel extends ChangeNotifier {

  late Event event;
  late Account account;
  late StatEvent stats;



  StatEventModel() {
    debugPrint("StatEventModel init");
  }

  setAccountData(Account account, Event event) {
    this.account = account;
    this.event = event;
    loadStatData();

  }

  loadStatData() async {
    String path = "/admin/api/check-in/event/${event.key}/statistics";
    final response = await http.get(Uri.parse(account.baseUrl + path), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'ApiKey ${account.apiKey}',
    });
    developer.log("event stats response " + response.body);
    if (response.statusCode == 200) {
      var js = jsonDecode(response.body);
      stats = StatEvent.fromJson(js);
    }
    notifyListeners();

  }

}


class StatEvent {

  late int totalAttendees;
  late int checkedIn;
  late int lastUpdate;


  StatEvent.fromJson(Map<String, dynamic> json) {
    totalAttendees = json["totalAttendees"];
    checkedIn = json["checkedIn"];
    lastUpdate = json["lastUpdate"];

  }

}