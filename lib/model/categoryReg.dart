// To parse required this JSON data, do
//
//     final categoryReg = categoryRegFromJson(jsonString);

import 'dart:convert';

CategoryReg categoryRegFromJson(String str) => CategoryReg.fromJson(json.decode(str));

String categoryRegToJson(CategoryReg data) => json.encode(data.toJson());

class CategoryReg {
    CategoryReg({
        required this.subCategories,
    });

    List<SubCategory> subCategories;

    factory CategoryReg.fromJson(Map<String, dynamic> json) => CategoryReg(
        subCategories: List<SubCategory>.from(json["sub_categories"].map((x) => SubCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sub_categories": List<dynamic>.from(subCategories.map((x) => x.toJson())),
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
        required this.priority,
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
    int priority;
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
        priority: json["priority"],
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
        "priority": priority,
        "updated": updated.toIso8601String(),
    };
}
