// To parse required this JSON data, do
//
//     final details = detailsFromJson(jsonString);

import 'dart:convert';

Details detailsFromJson(String str) => Details.fromJson(json.decode(str));

String detailsToJson(Details data) => json.encode(data.toJson());

class Details {
    Details({
        // required this.item,
        required this.offers,
    });

    // Item item;
    List<Offer> offers;

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        // item: Item.fromJson(json["item"]),
        offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        // "item": item.toJson(),
        "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
    };
}

// class Item {
//     Item({
//          required this.collectionId,
//          required this.collectionName,
//          required this.category,
//          required this.created,
//          required this.facebook,
//          required this.id,
//          required this.image,
//          required this.isPaid,
//          required this.lat,
//          required this.location,
//          required this.long,
//          required this.longDescription,
//          required this.name,
//          required this.phoneNumber,
//          required this.shortDescription,
//          required this.subCategory,
//          required this.updated,
//          required this.website,
//          required this.whatsappNumber,
//     });

//     String collectionId;
//     String collectionName;
//     String category;
//     DateTime created;
//     String facebook;
//     String id;
//     String image;
//     bool isPaid;
//     String lat;
//     String location;
//     String long;
//     String longDescription;
//     String name;
//     String phoneNumber;
//     String shortDescription;
//     String subCategory;
//     DateTime updated;
//     String website;
//     String whatsappNumber;

//     factory Item.fromJson(Map<String, dynamic> json) => Item(
//         collectionId: json["@collectionId"],
//         collectionName: json["@collectionName"],
//         category: json["category"],
//         created: DateTime.parse(json["created"]),
//         facebook: json["facebook"],
//         id: json["id"],
//         image: json["image"],
//         isPaid: json["is_paid"],
//         lat: json["lat"],
//         location: json["location"],
//         long: json["long"],
//         longDescription: json["long_description"],
//         name: json["name"],
//         phoneNumber: json["phone_number"],
//         shortDescription: json["short_description"],
//         subCategory: json["sub_category"],
//         updated: DateTime.parse(json["updated"]),
//         website: json["website"],
//         whatsappNumber: json["whatsapp_number"],
//     );

//     Map<String, dynamic> toJson() => {
//         "@collectionId": collectionId,
//         "@collectionName": collectionName,
//         "category": category,
//         "created": created.toIso8601String(),
//         "facebook": facebook,
//         "id": id,
//         "image": image,
//         "is_paid": isPaid,
//         "lat": lat,
//         "location": location,
//         "long": long,
//         "long_description": longDescription,
//         "name": name,
//         "phone_number": phoneNumber,
//         "short_description": shortDescription,
//         "sub_category": subCategory,
//         "updated": updated.toIso8601String(),
//         "website": website,
//         "whatsapp_number": whatsappNumber,
//     };
// }

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
