// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
    Profile({
        required this.details,
        required this.message,
        required this.status,
        required this.user,
    });

    Details details;
    String message;
    bool status;
    User user;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        details: Details.fromJson(json["details"]),
        message: json["message"],
        status: json["status"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "details": details.toJson(),
        "message": message,
        "status": status,
        "user": user.toJson(),
    };
}

class Details {
    Details({
        required this.collectionId,
        required this.collectionName,
        required this.category,
        required this.created,
        required this.id,
        required this.image,
        required this.lat,
        required this.lng,
        required this.location,
        required this.name,
        required this.phoneNumber,
        required this.updated,
        required this.user,
        required this.whatsapp,
    });

    String collectionId;
    String collectionName;
    String category;
    DateTime created;
    String id;
    String image;
    String lat;
    String lng;
    String location;
    String name;
    String phoneNumber;
    DateTime updated;
    String user;
    String whatsapp;

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        collectionId: json["@collectionId"],
        collectionName: json["@collectionName"],
        category: json["category"],
        created: DateTime.parse(json["created"]),
        id: json["id"],
        image: json["image"],
        lat: json["lat"],
        lng: json["lng"],
        location: json["location"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        updated: DateTime.parse(json["updated"]),
        user: json["user"],
        whatsapp: json["whatsapp"],
    );

    Map<String, dynamic> toJson() => {
        "@collectionId": collectionId,
        "@collectionName": collectionName,
        "category": category,
        "created": created.toIso8601String(),
        "id": id,
        "image": image,
        "lat": lat,
        "lng": lng,
        "location": location,
        "name": name,
        "phone_number": phoneNumber,
        "updated": updated.toIso8601String(),
        "user": user,
        "whatsapp": whatsapp,
    };
}

class User {
    User({
        required this.id,
        required this.created,
        required this.updated,
        required this.email,
        required this.lastResetSentAt,
        required this.verified,
        required this.lastVerificationSentAt,
        required this.profile,
    });

    String id;
    DateTime created;
    DateTime updated;
    String email;
    String lastResetSentAt;
    bool verified;
    String lastVerificationSentAt;
    ProfileClass profile;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        email: json["email"],
        lastResetSentAt: json["lastResetSentAt"],
        verified: json["verified"],
        lastVerificationSentAt: json["lastVerificationSentAt"],
        profile: ProfileClass.fromJson(json["profile"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "email": email,
        "lastResetSentAt": lastResetSentAt,
        "verified": verified,
        "lastVerificationSentAt": lastVerificationSentAt,
        "profile": profile.toJson(),
    };
}

class ProfileClass {
    ProfileClass({
        required this.collectionId,
        required this.collectionName,
        required this.created,
        required this.id,
        required this.mobile,
        required this.updated,
        required this.userId,
    });

    String collectionId;
    String collectionName;
    DateTime created;
    String id;
    String mobile;
    DateTime updated;
    String userId;

    factory ProfileClass.fromJson(Map<String, dynamic> json) => ProfileClass(
        collectionId: json["@collectionId"],
        collectionName: json["@collectionName"],
        created: DateTime.parse(json["created"]),
        id: json["id"],
        mobile: json["mobile"],
        updated: DateTime.parse(json["updated"]),
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "@collectionId": collectionId,
        "@collectionName": collectionName,
        "created": created.toIso8601String(),
        "id": id,
        "mobile": mobile,
        "updated": updated.toIso8601String(),
        "userId": userId,
    };
}
