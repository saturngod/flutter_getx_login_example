// To parse this JSON data, do
//
//     final errorResp = errorRespFromJson(jsonString);

import 'dart:convert';

ErrorResp errorRespFromJson(String str) => ErrorResp.fromJson(json.decode(str));

String errorRespToJson(ErrorResp data) => json.encode(data.toJson());

class ErrorResp {
  ErrorResp({
    this.error,
  });

  String error;

  factory ErrorResp.fromJson(Map<String, dynamic> json) => ErrorResp(
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
      };
}
