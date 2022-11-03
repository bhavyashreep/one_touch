import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as https;
import 'package:one_touch/model/Classifieds.dart';
import 'package:one_touch/model/Contacts.dart';
import 'package:one_touch/model/Details.dart';
import 'package:one_touch/model/Emergency.dart';
import 'package:one_touch/model/Notifications.dart';
import 'package:one_touch/model/SignUp.dart';
import 'package:one_touch/model/Signin.dart';
import 'package:one_touch/model/SingleCategory.dart';
import 'package:one_touch/model/category.dart';
import 'package:one_touch/model/categoryReg.dart';
import 'package:one_touch/model/newsdata.dart';
import 'package:one_touch/model/profile.dart' as prof;


import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:async/async.dart';
import 'dart:io' as file;

String appurl = "http://137.184.74.132/";

Future<Welcome> getCateoriesOffers() async {
  var url = appurl + "api/categories";

  var response = await https.get(Uri.parse(url));
  print(response.body);

  return welcomeFromJson(response.body);
}
Future<CategoryReg> getCateoriesOnly() async {
  var url = appurl + "api/contact/categories";

  var response = await https.get(Uri.parse(url));
  print(response.body);

  return categoryRegFromJson(response.body);
}

Future<Emergency> fetchEmergencies() async {
  var url = appurl + "api/emergency";

  var response = await https.get(Uri.parse(url));
  print(response.body);

  return emergencyFromJson(response.body);
}

Future<Contacts> fetchContacts() async {
  var url = appurl + "api/contacts";

  var response = await https.get(Uri.parse(url));
  print(response.body);

  return contactsFromJson(response.body);
}

Future<Classifieds> fetchClassifieds() async {
  var url = appurl + "api/classifieds";

  var response = await https.get(Uri.parse(url));
  print(response.body);

  return classifiedsFromJson(response.body);
}

Future<NotificationsAll> fetchNotifications() async {
  var url = appurl + "api/notifications";

  var response = await https.get(Uri.parse(url));
  print(response.body);

  return notificationsAllFromJson(response.body);
}

Future<SingleCategory> getSingleCategory(id) async {
  var url = appurl + "api/category/$id";

  var response = await https.get(Uri.parse(url));
  print(response.body);

  return singleCategoryFromJson(response.body);
}

Future<SingleCategory> fetchFilteredCategory(id, subcategoryId) async {
  var url = appurl + "api/category/$id?filter=$subcategoryId";

  var response = await https.get(Uri.parse(url));
  print(response.body);

  return singleCategoryFromJson(response.body);
}

Future<Welcome> fetchSubCategories() async {
  var url = appurl + "api/category/";

  var response = await https.get(Uri.parse(url));
  print(response.body);

  return welcomeFromJson(response.body);
}

Future<Details> fetchItemDetails(id) async {
  var url = appurl + "api/item/$id";

  var response = await https.get(Uri.parse(url));
  print(response.body);

  return detailsFromJson(response.body);
}

Future<Signin> isUserExist(mobile) async {
  var url = appurl + "api/check/user/exist";

  var response = await https.post(Uri.parse(url),
      body: json.encode({"mobile": "+91$mobile"}),
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json"
      });
  print(response.body);

  return signinFromJson(response.body);
}

Future<SignUp> signUp(
  categoryy,
  image,
  lat,
  lng,
  location,
  name,
  phone_number,
  whatsapp,
) async {
  print("into api _______________________________");
  var url = appurl + "api/user/registration";
  Map<String, String> headers = {
    "Accept": "application/json",
  }; // ignore this headers if there is no authentication
  print("headers - $headers}");
  print("headers - $categoryy}");

//add headers

  var request = new https.MultipartRequest("POST", Uri.parse(url));
  request.fields['phone_number'] = "+91$phone_number";
  request.fields['category'] = categoryy;
  request.fields['lat'] = lat;
  request.fields['lng'] = lng;
  request.fields['location'] = location;
  request.fields['name'] = name;
  if(whatsapp!="" || whatsapp!=null){
  request.fields['whatsapp'] = whatsapp;

  }


  request.headers.addAll(headers);



  request.files.add(await https.MultipartFile.fromPath('image', image.path));
  print("rewqq${request.fields}");


  print("reqqqq${request.fields}");
  var response = await request.send();
  print("reqqqq${request.fields}");

  var res = await https.Response.fromStream(response);
  print("ressssssss${res.body}");

  return signUpFromJson(res.body);
}
Future<prof.Profile> getProfileDetails() async {
  var url = appurl + "api/user/profile/";
  final viewData = await SharedPreferences.getInstance();
    var token=viewData.getString("token");

  var response = await https.get(Uri.parse(url), headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization":"User $token"
      });
  print(response.body);

  return prof.profileFromJson(response.body);
}
Future<NewsData> getNewsData() async {
  var url = appurl + "api/news/";
  final viewData = await SharedPreferences.getInstance();
    var token=viewData.getString("token");

  var response = await https.get(Uri.parse(url), headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
     
      });
  print(response.body);

  return newsDataFromJson(response.body);
}


