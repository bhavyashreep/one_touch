// To parse this JSON data, do
//
//     final classifieds = classifiedsFromJson(jsonString);

import 'dart:convert';

Classifieds classifiedsFromJson(String str) => Classifieds.fromJson(json.decode(str));

String classifiedsToJson(Classifieds data) => json.encode(data.toJson());

class Classifieds {
    Classifieds({
        required this.items,
        required this.subCategories,
    });

    List<Item> items;
    List<SubCategory> subCategories;

    factory Classifieds.fromJson(Map<String, dynamic> json) => Classifieds(
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
        required this.category,
        required this.created,
        required this.description,
        required this.id,
        required this.images,
        required this.phoneNumber,
        required this.title,
        required this.updated,
        required this.whatsapp,
    });

    String collectionId;
    String collectionName;
    String category;
    DateTime created;
    String description;
    String id;
    String images;
    String phoneNumber;
    String title;
    DateTime updated;
    String whatsapp;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        collectionId: json["@collectionId"],
        collectionName: json["@collectionName"],
        category: json["category"],
        created: DateTime.parse(json["created"]),
        description: json["description"],
        id: json["id"],
        images: json["images"],
        phoneNumber: json["phone_number"],
        title: json["title"],
        updated: DateTime.parse(json["updated"]),
        whatsapp: json["whatsapp"],
    );

    Map<String, dynamic> toJson() => {
        "@collectionId": collectionId,
        "@collectionName": collectionName,
        "category": category,
        "created": created.toIso8601String(),
        "description": description,
        "id": id,
        "images": images,
        "phone_number": phoneNumber,
        "title": title,
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

    String collectionId;
    String collectionName;
    String categoryName;
    String categoryType;
    DateTime created;
    String id;
    String image;
    String parentCategory;
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
