import 'package:flutter/material.dart';
import 'package:one_touch/Providers/MainProvider.dart';
import 'package:one_touch/presentation/pages/BlankScreen.dart';
import 'package:one_touch/presentation/pages/BottomBarSelectingScreen.dart';
import 'package:one_touch/presentation/pages/Dashboard.dart';
import 'package:one_touch/presentation/pages/Login/LoginScreen.dart';
import 'package:one_touch/presentation/pages/OnBoardingScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "dart:async";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // fetchCategories();
    checkIsFirstInstalling();
    checkLoggedIn();
  }

  var view;
  var token;

  Future<void> checkIsFirstInstalling() async {
    final viewData = await SharedPreferences.getInstance();
    setState(() {
      view = viewData.getBool('isFirstInstall');
    });
    print("view $view");
  }

  Future<void> checkLoggedIn() async {
    final viewData2 = await SharedPreferences.getInstance();
    setState(() {
      token = viewData2.getString('token');
    });
    print("view $view");
  }

  Widget build(BuildContext context) {
    return view == false ? BottomBarSelectingScreen() : OnBoardingScreen();
  }
}
