import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'dart:convert';


class AccountModel extends ChangeNotifier {

  List<Account> accounts = [];

  AccountModel() {
    debugPrint("AccountModel init");
    loadData();
  }

  loadData() async {

    // TODO load account basic info from storage and call API to populalate details
    
    addAccountFromJson("{\"baseUrl\":\"https://m4.test.alf.io\",\"apiKey\":\"2a47074c-6988-4024-91a2-09d1b9d67996\"}");

    notifyListeners();
  }

  addAccountFromJson(String json) {
    var js = jsonDecode(json);
    addAccount(js["baseUrl"], js["apiKey"]);
  }

  addAccount(String baseUrl, String apiKey) async {
    String path = "/admin/api/user/details";
    final response = await http.get(Uri.parse(baseUrl + path), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'ApiKey $apiKey',
    });
    developer.log("account details response " + response.body);
    if (response.statusCode == 200) {
      var js = jsonDecode(response.body);
      Account a = Account.fromJson(js);
      a.baseUrl = baseUrl;
      accounts.add(a);
    }

    //TODO save new account to storage

    notifyListeners();

  }

}

class Account {

  late String baseUrl;
  late String apiKey;
  late String description;
  late AccountType accountType;

  Account.fromJson(Map<String, dynamic> json) {
    apiKey = json["apiKey"];
    description = json["description"];
    accountType = fromString(json["userType"]);
  }

  AccountType fromString(str) {
    AccountType f = AccountType.values.firstWhere((e) => describeEnum(e) == str);
    return f;
  }

}

enum AccountType { STAFF, SUPERVISOR, SPONSOR }