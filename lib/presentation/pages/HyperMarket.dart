import 'package:flutter/material.dart';
import 'package:one_touch/Providers/HomeProvider.dart';
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

    Provider.of<HomeProvider>(context, listen: false)
        .getCategory(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    print("category id:${widget.categoryId}");
    var data = Provider.of<HomeProvider>(context);

    return Scaffold(
      body: data.isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Color(0xff39C7A5),
              ),
            )
          : SingleChildScrollView(

              // scrollDirection: Axis.horizontal,

              child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: data.category.subCategories
                              .map((e) => GestureDetector(
                                    onTap: (() => {
                                          data.getFilteredCategory(
                                              widget.categoryId, e["id"])
                                        }),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 22),
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
                                                    placeholder: (context,
                                                            url) =>
                                                        Image.asset(
                                                            "assets/images/default.png"),
                                                    imageUrl:
                                                        "http://137.184.74.132/api/files/${e["@collectionId"]}/${e["id"]}/" +
                                                            e["image"]),
                                              ),
                                              backgroundColor:
                                                  Colors.transparent,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 80,
                                            child: Text(
                                              e["category_name"],
                                              style: TextStyle(
                                                  color: Color(0xff999DA0)),
                                              softWrap: true,
                                              // textAlign: TextAlign.center,
                                              // overflow: TextOverflow.fade,
                                            ),
                                          )
                                        ]),
                                  ))
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
                        children: data.category.items
                            .map((e) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Type1Expanded(
                                        item: e,
                                      ),
                                    ),
                                  );
                                },
                                child: TileType1(
                                  item: e,
                                )))
                            .toList()),
                  )
                ],
              ),
            )),
    );
  }
}
