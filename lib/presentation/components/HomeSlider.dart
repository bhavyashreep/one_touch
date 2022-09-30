import 'package:flutter/material.dart';
import 'package:one_touch/Providers/MainProvider.dart';
import 'package:pocketbase/pocketbase.dart';
import "dart:async";
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  @override
  void initState() {
    super.initState();
    // fetchCategories();
    Provider.of<MainProvider>(context, listen: false).getHomePageOffers();
  }

 
  @override
  Widget build(BuildContext context) {
    
    var data = Provider.of<MainProvider>(context);
    return 
    // data.isLoading==LoadingState.waiting
    //     ? Center(child: CircularProgressIndicator())
    //     : 
        PageView(
            scrollDirection: Axis.horizontal,
            children: data.offers
                .map((e) => Container(
                    height: 140,

                    // width: 100,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(9)),
                    // color: Colors.red,
                    child: CachedNetworkImage(
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/banner.png"),
                        placeholder: (context, url) =>
                            Image.asset("assets/images/banner.png"),
                        imageUrl:
                            "http://137.184.74.132/api/files/${e["@collectionId"]}/${e["id"]}/" +
                                e["image"])))
                .toList());
  }
}
