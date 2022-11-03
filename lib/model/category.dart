// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        required this.categories,
        required this.offers,
    });

    List<Category> categories;
    List<Offer> offers;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
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

class Offer {
    Offer({
        required this.collectionId,
        required this.collectionName,
        required this.category,
        required this.created,
        required this.id,
        required this.image,
        required this.showInHome,
        required this.updated,
    });

    String collectionId;
    String collectionName;
    String category;
    DateTime created;
    String id;
    String image;
    bool showInHome;
    DateTime updated;

    factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        collectionId: json["@collectionId"],
        collectionName: json["@collectionName"],
        category: json["category"],
        created: DateTime.parse(json["created"]),
        id: json["id"],
        image: json["image"],
        showInHome: json["show_in_home"],
        updated: DateTime.parse(json["updated"]),
    );

    Map<String, dynamic> toJson() => {
        "@collectionId": collectionId,
        "@collectionName": collectionName,
        "category": category,
        "created": created.toIso8601String(),
        "id": id,
        "image": image,
        "show_in_home": showInHome,
        "updated": updated.toIso8601String(),
    };
}
