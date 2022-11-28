import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:one_touch/Providers/HomeProvider.dart';

import 'package:one_touch/presentation/Api/api.dart';
import 'package:one_touch/presentation/pages/HyperMarket.dart';
import 'package:pocketbase/pocketbase.dart';
import "dart:async";
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:one_touch/model/category.dart' as cat;

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  @override
  initState() {
    super.initState();
    // var data =
    //     Provider.of<HomeProvider>(context, listen: false).getCategories();
  }

  cat.Category completeResponse = cat.Category(
      collectionId: "",
      collectionName: "",
      categoryName: "",
      categoryType: "",
      created: DateTime.now(),
      id: "",
      image: "",
      parentCategory: "",
      updated: DateTime.now());
  List localResponseData = [];
 

  @override
  Widget build(BuildContext context) {
    var data2 = Provider.of<HomeProvider>(context);

    print("categories ${data2.homePageData}");
    return Center(
      child: Wrap(
          runSpacing: 20,
          alignment: WrapAlignment.spaceBetween,
          children: data2.homePageData.categories
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    completeResponse = e;
              
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
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Column(children: [
                      CircleAvatar(
                        radius: 32.0,
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(32.0),
                          child: Container(
                            height: 40,
                            child: CachedNetworkImage(
                              fit: BoxFit.contain,
                                errorWidget: (context, url, error) =>
                                    Image.asset("assets/images/default.png"),
                                placeholder: (context, url) =>
                                    Image.asset("assets/images/default.png"),
                                imageUrl:
                                    "http://137.184.74.132/api/files/x2o3wbfic58mx57/${e.id}/" +
                                        e.image),
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Text(
                        e.categoryName,
                        style: TextStyle(color: Color(0xff999DA0)),
                      )
                    ]),
                  ),
                ),
              )
              .toList()
          //    [
          //   Column(children: [
          //     CircleAvatar(
          //       radius: 32.0,
          //       backgroundImage: AssetImage("assets/images/bakery.png"),
          //       backgroundColor: Colors.transparent,
          //     ),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Text(
          //       "Bakery",
          //       style: TextStyle(color: Color(0xff999DA0)),
          //     )
          //   ]),
          //   SizedBox(
          //     width: 22,
          //   ),
          //   Column(children: [
          //     CircleAvatar(
          //       radius: 32.0,
          //       backgroundImage: AssetImage("assets/images/jwellery.png"),
          //       backgroundColor: Colors.transparent,
          //     ),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Text(
          //       "Jwellery",
          //       style: TextStyle(color: Color(0xff999DA0)),
          //     )
          //   ]),
          //   SizedBox(
          //     width: 22,
          //   ),
          //   Column(children: [
          //     CircleAvatar(
          //       radius: 32.0,
          //       backgroundImage: AssetImage("assets/images/textiles.png"),
          //       backgroundColor: Colors.transparent,
          //     ),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Text(
          //       "Textiles",
          //       style: TextStyle(color: Color(0xff999DA0)),
          //     )
          //   ]),
          //   SizedBox(
          //     width: 22,
          //   ),
          //   Column(children: [
          //     CircleAvatar(
          //       radius: 32.0,
          //       backgroundImage: AssetImage("assets/images/electronics.png"),
          //       backgroundColor: Colors.transparent,
          //     ),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Text(
          //       "Electronics",
          //       style: TextStyle(color: Color(0xff999DA0)),
          //     )
          //   ]),
          //   SizedBox(
          //     width: 22,
          //   ),
          //   Column(children: [
          //     CircleAvatar(
          //       radius: 32.0,
          //       backgroundImage: AssetImage("assets/images/electronics.png"),
          //       backgroundColor: Colors.transparent,
          //     ),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Text(
          //       "Electronics",
          //       style: TextStyle(color: Color(0xff999DA0)),
          //     )
          //   ]),
          // ]),
          ),
    );
  }
}
