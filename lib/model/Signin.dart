import 'dart:convert';

Signin signinFromJson(String str) => Signin.fromJson(json.decode(str));

String signinToJson(Signin data) => json.encode(data.toJson());

class Signin {
  Signin({
    required this.exist,
    required this.mobile,
    this.user,
    this.token,
  });

  bool exist;
  String mobile;
  dynamic user;
  dynamic token;

  factory Signin.fromJson(Map<String, dynamic> json) => Signin(
        exist: json["exist"],
        mobile: json["mobile"],
        user: json["user"],
        token: json["token"],

      );

  Map<String, dynamic> toJson() => {
        "exist": exist,
        "mobile": mobile,
        "user": user,
        "token": token,

      };
}
