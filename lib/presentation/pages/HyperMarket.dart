import 'package:flutter/material.dart';
import 'package:one_touch/Providers/MainProvider.dart';
import 'package:one_touch/presentation/common/SearchBox.dart';
import 'package:one_touch/presentation/common/TileType1.dart';
import 'package:one_touch/presentation/common/TileType2.dart';
import 'package:one_touch/presentation/common/TitleBar.dart';
import 'package:one_touch/presentation/pages/Type1Expanded.dart';
import "dart:async";
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HyperMarket extends StatefulWidget {
  final String categoryId;
  final String categoryName;

  const HyperMarket(
      {Key? key, required this.categoryId, required this.categoryName})
      : super(key: key);

  @override
  State<HyperMarket> createState() => _HyperMarketState();
}

class _HyperMarketState extends State<HyperMarket> {
  @override
  void initState() {
    super.initState();
    Provider.of<MainProvider>(context, listen: false)
        .fetchList(widget.categoryId);
    Provider.of<MainProvider>(context, listen: false).fetchSubCategories();
  }

  @override
  Widget build(BuildContext context) {
    print("category id:${widget.categoryId}");
    var data = Provider.of<MainProvider>(context);

    return Scaffold(
      body: data.isLoading == LoadingState.waiting
          ? Center(
              child: CircularProgressIndicator(
                color: Color(0xff39C7A5),
              ),
            )
          : SingleChildScrollView(
              child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  TitleBar(title: widget.categoryName),
                  SizedBox(
                    height: 21,
                  ),
                  SearchBox(),
                  SizedBox(
                    height: 32,
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: data.subCategories
                              .map((e) => Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 22),
                                      child: CircleAvatar(
                                        radius: 40.0,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                          child: CachedNetworkImage(
                                              errorWidget: (context, url,
                                                      error) =>
                                                  Image.asset(
                                                      "assets/images/default.png"),
                                              placeholder: (context, url) =>
                                                  Image.asset(
                                                      "assets/images/default.png"),
                                              imageUrl:
                                                  "http://137.184.74.132/api/files/${e["@collectionId"]}/${e["id"]}/" +
                                                      e["image"]),
                                        ),
                                        backgroundColor: Colors.transparent,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Welders",
                                      style:
                                          TextStyle(color: Color(0xff999DA0)),
                                    )
                                  ]))
                              .toList())),
                  SizedBox(
                    height: 22,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(widget.categoryName,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500))),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 22),
                    child: Column(
                        children: data.list
                            .map((e) => e["type"] == "shop"
                                
                                ? GestureDetector(
                                    onTap: () {
                                      e["is_paid"]?
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Type1Expanded(item:e),
                                        ),
                                      ):null;
                                    },
                                    child:
                                TileType1(item: e)
                                 )
                                : GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Type1Expanded(item: e,),
                                        ),
                                      );
                                    },
                                    child: TileType2(
                                      item: e,
                                    )))
                            .toList()
                        //  [
                        // ListTile(
                        //   leading: CircleAvatar(
                        //         radius: 42.0,
                        //         backgroundImage: AssetImage("assets/images/hypermarket.png"),
                        //         backgroundColor: Colors.transparent,
                        //       ),
                        //   title: Text("Lulu Mall"),
                        //   subtitle:  Row(
                        //     children: [
                        //       Icon(
                        //         Icons.place,
                        //         color: Color.fromRGBO(153, 157, 160, 1),
                        //         size: 20,
                        //       ),
                        //       Text(
                        //         "Kakkanad, Kochi",
                        //         style: TextStyle(color: Color(0xff999DA0)),
                        //       )
                        //     ],
                        //   ),
                        //   trailing: Icon(Icons.keyboard_arrow_right_outlined)
                        // )

                        //   GestureDetector(
                        //       onTap: () {
                        //         Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //             builder: (context) => Type1Expanded(),
                        //           ),
                        //         );
                        //       },
                        //       child: TileType1()),
                        //   Divider(
                        //     thickness: 2,
                        //     color: Color.fromRGBO(180, 180, 180, 0.08),
                        //   ),
                        //   TileType1(),
                        //   Divider(
                        //     thickness: 2,
                        //     color: Color.fromRGBO(180, 180, 180, 0.08),
                        //   ),
                        //   TileType1()
                        // ],
                        ),
                  )
                ],
              ),
            )),
    );
  }
}
