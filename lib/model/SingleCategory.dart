// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SingleCategory singleCategoryFromJson(String str) =>
    SingleCategory.fromJson(json.decode(str));

String singleCategory(SingleCategory data) => json.encode(data.toJson());

class SingleCategory {
  SingleCategory({
    required this.category,
    required this.items,
    required this.subCategories,
  });

  Category category;
  List<Item> items;
  List<dynamic> subCategories;

  factory SingleCategory.fromJson(Map<String, dynamic> json) => SingleCategory(
        category: Category.fromJson(json["category"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        subCategories: List<dynamic>.from(json["sub_categories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "category": category.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "sub_categories": List<dynamic>.from(subCategories.map((x) => x)),
      };
}

class Category {
  Category({
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

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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

class Item {
  Item({
    required this.collectionId,
    required this.collectionName,
    required this.category,
    required this.created,
    required this.facebook,
    required this.id,
    required this.image,
    required this.isPaid,
    required this.lat,
    required this.location,
    required this.long,
    required this.longDescription,
    required this.name,
    required this.phoneNumber,
    required this.shortDescription,
    required this.subCategory,
    required this.updated,
    required this.website,
    required this.whatsappNumber,
  });

  String collectionId;
  String collectionName;
  String category;
  DateTime created;
  String facebook;
  String id;
  String image;
  bool isPaid;
  dynamic lat;
  String location;
  String long;
  String longDescription;
  String name;
  String phoneNumber;
  String shortDescription;
  String subCategory;
  DateTime updated;
  String website;
  String whatsappNumber;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        collectionId: json["@collectionId"],
        collectionName: json["@collectionName"],
        category: json["category"],
        created: DateTime.parse(json["created"]),
        facebook: json["facebook"],
        id: json["id"],
        image: json["image"],
        isPaid: json["is_paid"],
        lat: json["lat"],
        location: json["location"],
        long: json["long"],
        longDescription: json["long_description"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        shortDescription: json["short_description"],
        subCategory: json["sub_category"],
        updated: DateTime.parse(json["updated"]),
        website: json["website"],
        whatsappNumber: json["whatsapp_number"],
      );

  Map<String, dynamic> toJson() => {
        "@collectionId": collectionId,
        "@collectionName": collectionName,
        "category": category,
        "created": created.toIso8601String(),
        "facebook": facebook,
        "id": id,
        "image": image,
        "is_paid": isPaid,
        "lat": lat,
        "location": location,
        "long": long,
        "long_description": longDescription,
        "name": name,
        "phone_number": phoneNumber,
        "short_description": shortDescription,
        "sub_category": subCategory,
        "updated": updated.toIso8601String(),
        "website": website,
        "whatsapp_number": whatsappNumber,
      };
}
