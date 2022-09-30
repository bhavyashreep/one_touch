// import 'package:json_annotation/json_annotation.dart';


// @JsonSerializable()
// class Category{
//   final String id;
//   final String category_name;
//   final String image;
//   final String created;
//   final String updated;

//   Category({required this.id,required this.category_name,required this.image,required this.created,required this.updated});
//   /// Connect the generated [_$PersonFromJson] function to the `fromJson` factory.
//   factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

//   /// Connect the generated [_$PersonToJson] function to the `toJson` method.
//   Map<String, dynamic> toJson() => _$CategoryToJson(this);
// }

// class Person {
//   // type the fields you want to use
//   final String id;
//   final String firstName;
//   final String lastName;

//   Person({required this.id, required this.firstName, this.lastName});

//   /// Connect the generated [_$PersonFromJson] function to the `fromJson` factory.
//   factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

//   /// Connect the generated [_$PersonToJson] function to the `toJson` method.
//   Map<String, dynamic> toJson() => _$PersonToJson(this);
// }

// // fetch your record model
// final record = await client.records.getOne(...);

// final person = Person.fromJson(record.toJson())