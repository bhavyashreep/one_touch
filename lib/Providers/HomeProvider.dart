import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:one_touch/model/Classifieds.dart';
import 'package:one_touch/model/Contacts.dart';
import 'package:one_touch/model/Details.dart' as det;
import 'package:one_touch/model/Details.dart';

import 'package:one_touch/model/Emergency.dart';
import 'package:one_touch/model/Notifications.dart';
import 'package:one_touch/model/SingleCategory.dart';
import 'package:one_touch/model/category.dart';
import 'package:one_touch/model/SingleCategory.dart' as cat;

import 'package:one_touch/presentation/Api/api.dart';
import 'package:one_touch/presentation/pages/Dashboard.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:one_touch/model/profile.dart' as prof;
import 'package:one_touch/model/newsdata.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = true;
  bool isexist = false;

  Welcome homePageData = Welcome(categories: [], offers: []);

  Emergency emergencyData = Emergency(items: [], subCategories: []);
  Contacts contacts = Contacts(items: [], subCategories: []);
  Classifieds classifieds = Classifieds(items: [], subCategories: []);
  NotificationsAll notificationsAll = NotificationsAll(items: []);
  Details itemDetils = Details(offers: []);
  late NewsData news;
  late prof.Profile profDetails = prof.Profile(
      details: prof.Details(
          category: "",
          collectionId: "",
          collectionName: "",
          created: DateTime.now(),
          id: "",
          image: "",
          lat: "",
          lng: "",
          location: "",
          name: "",
          phoneNumber: "",
          user: "",
          updated: DateTime.now(),
          whatsapp: ""),
      message: "",
      status: false,
      user: prof.User(
          verified: false,
          created: DateTime.now(),
          email: "",
          lastResetSentAt: "",
          id: "",
          lastVerificationSentAt: "",
          updated: DateTime.now(),
          profile: prof.ProfileClass(
              collectionId: "",
              collectionName: "",
              created: DateTime.now(),
              id: "",
              mobile: "",
              updated: DateTime.now(),
              userId: "")));

  SingleCategory category = SingleCategory(
      category: cat.Category(
          image: "",
          id: "",
          collectionId: "",
          updated: DateTime.now(),
          categoryName: "",
          categoryType: "",
          created: DateTime.now(),
          parentCategory: "",
          collectionName: ""),
      items: [],
      subCategories: []);
  var isFirstLogin;

  Future<void> getCategories() async {
    // isLoading = true;
    // notifyListeners();

    var data = await getCateoriesOffers();
    homePageData = data;
    isLoading = false;

    notifyListeners();
  }

  Future<void> getEmergencies() async {
    isLoading = true;
    notifyListeners();

    var data = await fetchEmergencies();
    emergencyData = data;
    isLoading = false;

    notifyListeners();
  }

  Future<void> getContacts() async {
    isLoading = true;
    notifyListeners();

    var data = await fetchContacts();
    contacts = data;
    isLoading = false;

    notifyListeners();
  }

  Future<void> getClassifieds() async {
    isLoading = true;
    notifyListeners();

    var data = await fetchClassifieds();
    classifieds = data;
    isLoading = false;

    notifyListeners();
  }

  Future<void> getNotofications() async {
    isLoading = true;
    notifyListeners();

    var data = await fetchNotifications();
    notificationsAll = data;
    isLoading = false;

    notifyListeners();
  }

  Future<void> getCategory(id) async {
    isLoading = true;
    notifyListeners();

    var data = await getSingleCategory(id);
    category = data;
    isLoading = false;

    notifyListeners();
  }

  Future<void> getFilteredCategory(id, subcategoryId) async {
    isLoading = true;
    notifyListeners();

    var data = await fetchFilteredCategory(id, subcategoryId);
    category = data;
    isLoading = false;

    notifyListeners();
  }

  Future<void> getItemDetails(id) async {
    isLoading = true;
    notifyListeners();

    var data = await fetchItemDetails(id);
    itemDetils = data;
    isLoading = false;

    notifyListeners();
  }

  Future<void> checkIsFirtInstalling() async {
    final viewData = await SharedPreferences.getInstance();
    final view = viewData.getBool('isFirstInstall');
    isFirstLogin = view;
    // notifyListeners();
    print("view $view");
  }

  Future<void> setIsFirtInstalling() async {
    final viewData = await SharedPreferences.getInstance();
    viewData.setBool("isFirstInstall", false);
  }

   Future<void> checkUserExist(mobile) async {
    isLoading = true;
    notifyListeners();

    var data = await isUserExist(mobile);
    // itemDetils = data;
    if (data.exist) {
      final viewData = await SharedPreferences.getInstance();
      viewData.setString("token", data.token);
    }

    isLoading = false;
    isexist = data.exist;
    print("userrrrrr-_______${data.exist}");

    notifyListeners();
  }

Future<void> signUpData(categoryy, image, lat, lng, location, name,
      phone_number, whatsapp, context) async {
    isLoading = true;
    notifyListeners();

    var data = await signUp(
      categoryy,
      image,
      lat,
      lng,
      location,
      name,
      phone_number,
      whatsapp,
    );
    // itemDetils = data;
    isLoading = false;
    notifyListeners();
    final viewData = await SharedPreferences.getInstance();
    viewData.setString("token", data.token);
    if (data.status) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(),
          ),
          (route) => false);
    }
  }
   Future<void> getProfile() async {
    isLoading = true;
    notifyListeners();

    var data = await getProfileDetails();
    profDetails = data;
    isLoading = false;

    notifyListeners();
  }

  Future<void> getNews() async {
    isLoading = true;
    notifyListeners();

    var data = await getNewsData();
    news = data;
    isLoading = false;

    notifyListeners();
  }
}
