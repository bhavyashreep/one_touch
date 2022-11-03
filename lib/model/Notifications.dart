// To parse required this JSON data, do
//
//     final notificationsAll = notificationsAllFromJson(jsonString);

import 'dart:convert';

NotificationsAll notificationsAllFromJson(String str) => NotificationsAll.fromJson(json.decode(str));

String notificationsAllToJson(NotificationsAll data) => json.encode(data.toJson());

class NotificationsAll {
    NotificationsAll({
        required this.items,
    });

    List<Item> items;

    factory NotificationsAll.fromJson(Map<String, dynamic> json) => NotificationsAll(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    Item({
        required this.collectionId,
        required this.collectionName,
        required this.created,
        required this.id,
        required this.offer,
        required this.shortDescription,
        required this.title,
        required this.type,
        required this.updated,
        required this.url,
    });

    String collectionId;
    String collectionName;
    DateTime created;
    String id;
    String offer;
    String shortDescription;
    String title;
    String type;
    DateTime updated;
    String url;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        collectionId: json["@collectionId"],
        collectionName: json["@collectionName"],
        created: DateTime.parse(json["created"]),
        id: json["id"],
        offer: json["offer"],
        shortDescription: json["short_description"],
        title: json["title"],
        type: json["type"],
        updated: DateTime.parse(json["updated"]),
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "@collectionId": collectionId,
        "@collectionName": collectionName,
        "created": created.toIso8601String(),
        "id": id,
        "offer": offer,
        "short_description": shortDescription,
        "title": title,
        "type": type,
        "updated": updated.toIso8601String(),
        "url": url,
    };
}
