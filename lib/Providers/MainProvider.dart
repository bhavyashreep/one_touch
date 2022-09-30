import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbase/pocketbase.dart';
import "dart:async";


class MainProvider extends ChangeNotifier {
  LoadingState isLoading = LoadingState.done;
  List offers = [];
  List categories = [];
  List list = [];
  List subCategories = [];
  List notifications = [];

  var isFirstLogin;
  Future<void> checkIsFirtInstalling() async {
    final viewData = await SharedPreferences.getInstance();
    final view = viewData.getBool('isFirstInstall');
    isFirstLogin=view;
    notifyListeners();
    print("view $view");

    // var localArray = json.encode(this.localResponseData);
    // final offlineData = await SharedPreferences.getInstance();
    // offlineData.setString("offData", localArray);
    // print("$localArray locally storing datas ");

    // this.surveyRresponse.clear();
    // print("$surveyRresponse cleared survey response");
  }
  Future<void> setIsFirtInstalling() async {
    final viewData = await SharedPreferences.getInstance();
    viewData.setBool("isFirstInstall", false);

  }

  Future<void> getHomePageOffers() async {
    this.isLoading = LoadingState.waiting;
    notifyListeners();
    try {
      final client = PocketBase('http://137.184.74.132');
      await client.admins
          .authViaEmail('sethu.developer@gmail.com', 'app@pocket');
      final records = await client.records.getFullList('offers',
          batch: 200, sort: '-created', filter: "show_in_home=true");
      offers = records.map((i) => i.toJson()).toList();
      var cats = jsonEncode(offers);
      offers = jsonDecode(cats);
    } catch (er) {
      print("errorrrrr $er");
    }
    this.isLoading = LoadingState.done;
    notifyListeners();
  }
   Future<void> getNotifications() async {
    this.isLoading = LoadingState.waiting;
    notifyListeners();
    try {
      final client = PocketBase('http://137.184.74.132');
      await client.admins
          .authViaEmail('sethu.developer@gmail.com', 'app@pocket');
      final records = await client.records.getFullList('notifications',
          batch: 200, sort: '-created');
      notifications = records.map((i) => i.toJson()).toList();
      var cats = jsonEncode(notifications);
      notifications = jsonDecode(cats);
    } catch (er) {
      print("errorrrrr $er");
    }
    this.isLoading = LoadingState.done;
    notifyListeners();
  }


  final client = PocketBase('http://137.184.74.132');

  Future<void> fetchCategories() async {
      print("errorrrrr notified");

    this.isLoading = LoadingState.waiting;
    notifyListeners();
      print("errorrrrr notified 3");

    try {
      await client.admins
          .authViaEmail('sethu.developer@gmail.com', 'app@pocket');
      final records = await client.records
          .getFullList('main_categories', batch: 200, sort: '-created');

      categories = records.map((i) => i.toJson()).toList();
      var cats = jsonEncode(categories);
      categories = jsonDecode(cats);
      print("errorrrrr bfore");

      this.isLoading = LoadingState.done;
      notifyListeners();
      print("errorrrrr notified");

      // print("categories ${records}");
    } catch (er) {
      this.isLoading = LoadingState.done;
      notifyListeners();
      print("errorrrrr $er");
    }
  }

  Future<void> fetchList(String id) async {
    this.isLoading = LoadingState.waiting;
    // notifyListeners();
    try {
      await client.admins
          .authViaEmail('sethu.developer@gmail.com', 'app@pocket');
      final records = await client.records.getFullList('list',
          batch: 200, sort: '-created', filter: 'main_category="$id"');
      print("sub categories $records");

      list = records.map((i) => i.toJson()).toList();
      var cats = jsonEncode(list);
      list = jsonDecode(cats);

      print("ads ${records}");
      this.isLoading = LoadingState.done;
      notifyListeners();
    } catch (er) {
      this.isLoading = LoadingState.done;
      notifyListeners();
      print("errorrrrr $er");
    }
  }

  Future<void> fetchSubCategories() async {
    this.isLoading = LoadingState.waiting;
    notifyListeners();
    try {
      await client.admins
          .authViaEmail('sethu.developer@gmail.com', 'app@pocket');
      final records = await client.records.getFullList(
        'sub_categories',
        batch: 200,
        sort: '-created',
      );
      print("sub categories $records");

      subCategories = records.map((i) => i.toJson()).toList();
      var cats = jsonEncode(subCategories);
      subCategories = jsonDecode(cats);

      print("ads ${records}");
      this.isLoading = LoadingState.done;
      print("errorrrrr before");

      notifyListeners();
      print("errorrrrr notified");

      
    } catch (er) {
      this.isLoading = LoadingState.done;
      notifyListeners();
      print("errorrrrr $er");
    }
  }
}

enum LoadingState { waiting, done }
