// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
    Profile({
        required this.contacts,
        required this.items,
        required this.message,
        required this.status,
        required this.user,
    });

    List<dynamic> contacts;
    List<Item> items;
    String message;
    dynamic status;
    User user;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        contacts: List<dynamic>.from(json["contacts"].map((x) => x)),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        message: json["message"],
        status: json["status"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "contacts": List<dynamic>.from(contacts.map((x) => x)),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "message": message,
        "status": status,
        "user": user.toJson(),
    };
}

class Item {
    Item({
        required this.collectionId,
        required this.collectionName,
        required this.approved,
        required this.category,
        required this.created,
        required this.facebook,
        required this.id,
        required this.image,
        required this.isPaid,
        required this.lat,
        required this.lng,
        required this.location,
        required this.longDescription,
        required this.name,
        required this.phoneNumber,
        required this.shortDescription,
        required this.subCategory,
        required this.updated,
        required this.user,
        required this.website,
        required this.whatsappNumber,
    });

    String collectionId;
    String collectionName;
    dynamic approved;
    String category;
    DateTime created;
    String facebook;
    String id;
    String image;
    dynamic isPaid;
    String lat;
    String lng;
    String location;
    String longDescription;
    String name;
    String phoneNumber;
    String shortDescription;
    String subCategory;
    DateTime updated;
    String user;
    String website;
    String whatsappNumber;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        collectionId: json["@collectionId"],
        collectionName: json["@collectionName"],
        approved: json["approved"],
        category: json["category"],
        created: DateTime.parse(json["created"]),
        facebook: json["facebook"],
        id: json["id"],
        image: json["image"],
        isPaid: json["is_paid"],
        lat: json["lat"],
        lng: json["lng"],
        location: json["location"],
        longDescription: json["long_description"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        shortDescription: json["short_description"],
        subCategory: json["sub_category"],
        updated: DateTime.parse(json["updated"]),
        user: json["user"],
        website: json["website"],
        whatsappNumber: json["whatsapp_number"],
    );

    Map<String, dynamic> toJson() => {
        "@collectionId": collectionId,
        "@collectionName": collectionName,
        "approved": approved,
        "category": category,
        "created": created.toIso8601String(),
        "facebook": facebook,
        "id": id,
        "image": image,
        "is_paid": isPaid,
        "lat": lat,
        "lng": lng,
        "location": location,
        "long_description": longDescription,
        "name": name,
        "phone_number": phoneNumber,
        "short_description": shortDescription,
        "sub_category": subCategory,
        "updated": updated.toIso8601String(),
        "user": user,
        "website": website,
        "whatsapp_number": whatsappNumber,
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
    dynamic verified;
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
       required this.photo,
       required this.updated,
       required this.userId,
       required this.userName,
    });

    String collectionId;
    String collectionName;
    DateTime created;
    String id;
    String mobile;
    String photo;
    DateTime updated;
    String userId;
    String userName;

    factory ProfileClass.fromJson(Map<String, dynamic> json) => ProfileClass(
        collectionId: json["@collectionId"],
        collectionName: json["@collectionName"],
        created: DateTime.parse(json["created"]),
        id: json["id"],
        mobile: json["mobile"],
        photo: json["photo"],
        updated: DateTime.parse(json["updated"]),
        userId: json["userId"],
        userName: json["user_name"],
    );

    Map<String, dynamic> toJson() => {
        "@collectionId": collectionId,
        "@collectionName": collectionName,
        "created": created.toIso8601String(),
        "id": id,
        "mobile": mobile,
        "photo": photo,
        "updated": updated.toIso8601String(),
        "userId": userId,
        "user_name": userName,
    };
}
