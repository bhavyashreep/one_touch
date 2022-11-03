// To parse this JSON data, do
//
//     final newsData = newsDataFromJson(jsonString);

import 'dart:convert';

NewsData newsDataFromJson(String str) => NewsData.fromJson(json.decode(str));

String newsDataToJson(NewsData data) => json.encode(data.toJson());

class NewsData {
    NewsData({
        required this.news,
    });

    List<News> news;

    factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        news: List<News>.from(json["news"].map((x) => News.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "news": List<dynamic>.from(news.map((x) => x.toJson())),
    };
}

class News {
    News({
        required this.collectionId,
        required this.collectionName,
        required this.created,
        required this.decsription,
        required this.id,
        required this.image,
        required this.link,
        required this.title,
        required this.updated,
    });

    String collectionId;
    String collectionName;
    DateTime created;
    String decsription;
    String id;
    String image;
    String link;
    String title;
    DateTime updated;

    factory News.fromJson(Map<String, dynamic> json) => News(
        collectionId: json["@collectionId"],
        collectionName: json["@collectionName"],
        created: DateTime.parse(json["created"]),
        decsription: json["decsription"],
        id: json["id"],
        image: json["image"],
        link: json["link"],
        title: json["title"],
        updated: DateTime.parse(json["updated"]),
    );

    Map<String, dynamic> toJson() => {
        "@collectionId": collectionId,
        "@collectionName": collectionName,
        "created": created.toIso8601String(),
        "decsription": decsription,
        "id": id,
        "image": image,
        "link": link,
        "title": title,
        "updated": updated.toIso8601String(),
    };
}
