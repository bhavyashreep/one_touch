import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:one_touch/Providers/MainProvider.dart';
import 'package:one_touch/presentation/pages/HyperMarket.dart';
import 'package:pocketbase/pocketbase.dart';
import "dart:async";
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   print("calling");

  //   Provider.of<MainProvider>(context).fetchCategories().catchError((onError) {
  //     ("not found");
  //     (onError);
  //   });
  //   print("calling bb");

  //   super.didChangeDependencies();
  // }

  Map<String, dynamic> completeResponse = {};
  List localResponseData = [];
  Future<void> localStorage() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("offData")) {
      this.localResponseData.add(completeResponse);
      print("in");
      var localArray = json.encode(this.localResponseData);
      final offlineData = await SharedPreferences.getInstance();
      offlineData.setString("offData", localArray);
      print("$localArray locally storing datas ");
    } else {
      final offDataGet = await SharedPreferences.getInstance();
      // offDataGet.clear();
      final fetchedData = offDataGet.getString('offData');
      print("$fetchedData fetched data");

      var decodedData = json.decode(fetchedData.toString());
      print("$decodedData decoded data");
      // if(decodedData.length != 0){
      var isAvail = false;
      for (var i = 0; i < decodedData.length; i++) {
        if (decodedData[i]["id"] == completeResponse["id"]) {
          isAvail = true;
        }
      }
      if (!isAvail) {
        decodedData.add(completeResponse);
        print("yes ${decodedData.length}");
        print("$decodedData after adding________________");
        if (decodedData.length >= 5) {
          var reversedList = new List.from(decodedData.reversed);

          decodedData = reversedList.sublist(0, 5);
          decodedData = new List.from(decodedData.reversed);

          print("yes2 ${decodedData.length}");

          // decodedData = reverse().reversed().toList();
        }
        offDataGet.setString("offData", json.encode(decodedData));

        // }
        // to view stored response
        final viewData = await SharedPreferences.getInstance();
        final view = viewData.getString('offData');
        var views = json.decode(view.toString());
        print("$views decoded data after added");
      }
      // this.surveyRresponse.clear();
      // print("$surveyRresponse cleared survey response");
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<MainProvider>(context);
    data.fetchCategories();
    print("categories ${data.categories}");
    return Center(
      child: Wrap(
          runSpacing: 20,
          alignment: WrapAlignment.start,
          children: data.categories
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    completeResponse = e;
                    localStorage();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HyperMarket(
                          categoryId: e["id"],
                          categoryName: e["category_name"],
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
                          borderRadius: BorderRadius.circular(32.0),
                          child: CachedNetworkImage(
                              errorWidget: (context, url, error) =>
                                  Image.asset("assets/images/default.png"),
                              placeholder: (context, url) =>
                                  Image.asset("assets/images/default.png"),
                              imageUrl:
                                  "http://137.184.74.132/api/files/x2o3wbfic58mx57/${e["id"]}/" +
                                      e["image"]),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        e["category_name"],
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
