// To parse this JSON data, do
//
//     final signUp = signUpFromJson(jsonString);

import 'dart:convert';

SignUp signUpFromJson(String str) => SignUp.fromJson(json.decode(str));

String signUpToJson(SignUp data) => json.encode(data.toJson());

class SignUp {
  SignUp({
    required this.message,
    required this.status,
    required this.token,
  });

  String message;
  bool status;
  String token;

  factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
        message: json["message"],
        status: json["status"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "token": token,
      };
}
