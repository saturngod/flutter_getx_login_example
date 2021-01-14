// To parse this JSON data, do
//
//     final loginResp = loginRespFromJson(jsonString);

import 'dart:convert';

LoginResp loginRespFromJson(String str) => LoginResp.fromJson(json.decode(str));

String loginRespToJson(LoginResp data) => json.encode(data.toJson());

class LoginResp {
  LoginResp({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  String accessToken;
  String tokenType;
  int expiresIn;

  factory LoginResp.fromJson(Map<String, dynamic> json) => LoginResp(
      accessToken: json["access_token"],
      tokenType: json["token_type"],
      expiresIn: json["expires_in"]);

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn
      };
}
