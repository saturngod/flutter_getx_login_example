import 'dart:convert';

import 'package:LoginGetX/Model/ErrorResp.dart';
import 'package:LoginGetX/Model/LoginResp.dart';
import 'package:http/http.dart' as http;

class CQAPI {
  static var client = http.Client();
  static var _baseURL = "http://127.0.0.1:8000/api";

  static Future<List> refreshToken({String token}) async {
    var response =
        await client.post('$_baseURL/auth/refresh', headers: <String, String>{
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      var json = response.body;
      //status is success but not excepted result
      if (json.contains("access_token") == false) {
        return ["", "Unknown Error"];
      }
      var loginRes = loginRespFromJson(json);
      if (loginRes != null) {
        return [loginRes.accessToken, ""];
      } else {
        return ["", "Unknown Error"];
      }
    } else {
      var json = response.body;
      var errorResp = errorRespFromJson(json);
      if (errorResp == null) {
        return ["", "Unknown Error"];
      } else {
        return ["", errorResp.error];
      }
    }
  }

  static Future<List> login({String email, String password}) async {
    var response = await client.post('$_baseURL/auth/login',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{"email": email, "password": password}));

    if (response.statusCode == 200) {
      var json = response.body;
      var loginRes = loginRespFromJson(json);
      if (loginRes != null) {
        return [loginRes.accessToken, ""];
      } else {
        return ["", "Unknown Error"];
      }
    } else {
      var json = response.body;
      var errorResp = errorRespFromJson(json);
      if (errorResp == null) {
        return ["", "Unknown Error"];
      } else {
        return ["", errorResp.error];
      }
    }
  }
}
