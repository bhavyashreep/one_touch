// To parse this JSON data, do
//
//     final signUp = signUpFromJson(jsonString);

import 'dart:convert';

ItemAdd itemAddFromJson(String str) => ItemAdd.fromJson(json.decode(str));

String itemAddToJson(ItemAdd data) => json.encode(data.toJson());

class ItemAdd {
  ItemAdd({
    required this.message,
    required this.status,
    required this.token,
  });

  dynamic message;
  bool status;
  dynamic token;

  factory ItemAdd.fromJson(Map<String, dynamic> json) => ItemAdd(
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
