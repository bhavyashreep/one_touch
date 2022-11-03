import 'package:flutter/material.dart';
import 'package:one_touch/Providers/HomeProvider.dart';
import 'package:one_touch/presentation/pages/Emergency.dart';
import 'package:one_touch/presentation/pages/HyperMarket.dart';
import 'package:one_touch/presentation/pages/Labours.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    super.initState();
    // localStorage();
  }

  // List data = [];

  // Future<void> localStorage() async {
  //   final viewData = await SharedPreferences.getInstance();
  //   final view = viewData.getString('offData');
  //   var views = json.decode(view.toString());
  //   if (views != null) {
  //     var reversedList = new List.from(views.reversed);
  //     print("$views decoded data after get");
  //     print("${views.length} decoded data after get");

  //     setState(() {
  //       data = reversedList;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<HomeProvider>(context);

    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: data.homePageData.categories.isNotEmpty
            ? Row(
                children: data.homePageData.categories
                    .sublist(0, 3)
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(right: 32),
                          child: Column(children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HyperMarket(
                                      categoryId: e.id,
                                      categoryName: e.categoryName,
                                    ),
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                radius: 40.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40.0),
                                  child: CachedNetworkImage(
                                      fit: BoxFit.contain,
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                              "assets/images/default.png"),
                                      placeholder: (context, url) =>
                                          Image.asset(
                                              "assets/images/default.png"),
                                      imageUrl:
                                          "http://137.184.74.132/api/files/x2o3wbfic58mx57/${e.id}/" +
                                              e.image),
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              e.categoryName,
                              style: TextStyle(color: Color(0xff999DA0)),
                            )
                          ]),
                        ))
                    .toList())
            : SizedBox());
  }
}
