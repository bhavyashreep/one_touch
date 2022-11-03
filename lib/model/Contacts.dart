// To parse this JSON data, do
//
//     final contacts = contactsFromJson(jsonString);

import 'dart:convert';

Contacts contactsFromJson(String str) => Contacts.fromJson(json.decode(str));

String contactsToJson(Contacts data) => json.encode(data.toJson());

class Contacts {
    Contacts({
        required this.items,
        required this.subCategories,
    });

    List<Item> items;
    List<SubCategory> subCategories;

    factory Contacts.fromJson(Map<String, dynamic> json) => Contacts(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        subCategories: List<SubCategory>.from(json["sub_categories"].map((x) => SubCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "sub_categories": List<dynamic>.from(subCategories.map((x) => x.toJson())),
    };
}

class Item {
    Item({
        required this.collectionId,
        required this.collectionName,
        required this.created,
        required this.field,
        required this.id,
        required this.image,
        required this.location,
        required this.name,
        required this.phoneNumber,
        required this.updated,
        required this.whatsapp,
    });

    dynamic collectionId;
    dynamic collectionName;
    DateTime created;
    dynamic field;
    dynamic id;
    dynamic image;
    dynamic location;
    dynamic name;
    dynamic phoneNumber;
    DateTime updated;
    dynamic whatsapp;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        collectionId: json["@collectionId"],
        collectionName: json["@collectionName"],
        created: DateTime.parse(json["created"]),
        field: json["field"],
        id: json["id"],
        image: json["image"],
        location: json["location"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        updated: DateTime.parse(json["updated"]),
        whatsapp: json["whatsapp"],
    );

    Map<String, dynamic> toJson() => {
        "@collectionId": collectionId,
        "@collectionName": collectionName,
        "created": created.toIso8601String(),
        "field": field,
        "id": id,
        "image": image,
        "location": location,
        "name": name,
        "phone_number": phoneNumber,
        "updated": updated.toIso8601String(),
        "whatsapp": whatsapp,
    };
}

class SubCategory {
    SubCategory({
        required this.collectionId,
        required this.collectionName,
        required this.categoryName,
        required this.categoryType,
        required this.created,
        required this.id,
        required this.image,
        required this.parentCategory,
        required this.updated,
    });

    dynamic collectionId;
    dynamic collectionName;
    dynamic categoryName;
    dynamic categoryType;
    DateTime created;
    dynamic id;
    dynamic image;
    dynamic parentCategory;
    DateTime updated;

    factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        collectionId: json["@collectionId"],
        collectionName: json["@collectionName"],
        categoryName: json["category_name"],
        categoryType: json["category_type"],
        created: DateTime.parse(json["created"]),
        id: json["id"],
        image: json["image"],
        parentCategory: json["parent_category"],
        updated: DateTime.parse(json["updated"]),
    );

    Map<String, dynamic> toJson() => {
        "@collectionId": collectionId,
        "@collectionName": collectionName,
        "category_name": categoryName,
        "category_type": categoryType,
        "created": created.toIso8601String(),
        "id": id,
        "image": image,
        "parent_category": parentCategory,
        "updated": updated.toIso8601String(),
    };
}
