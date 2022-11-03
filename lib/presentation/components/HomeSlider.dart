import 'package:flutter/material.dart';
import 'package:one_touch/Providers/HomeProvider.dart';
import 'package:one_touch/Providers/MainProvider.dart';
import 'package:pocketbase/pocketbase.dart';
import "dart:async";
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  final controller;
  const HomeSlider({Key? key,this.controller}) : super(key: key);

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {

  @override
  void initState() {
    super.initState();
   

    // fetchCategories();
    // Provider.of<HomeProvider>(context, listen: false).getHomePageOffers();
  }
  // PageController _controller=PageController();

 
  @override
  Widget build(BuildContext context) {
    
    var data = Provider.of<HomeProvider>(context);
    return 
    // data.isLoading==LoadingState.waiting
    //     ? Center(child: CircularProgressIndicator())
    //     : 
  // Column(children: [ 
    // ScrollingPageIndicator(
    //                               dotColor: Colors.grey,
    //                               dotSelectedColor: Color(0xff40BFB4),
    //                               dotSize: 6,
    //                               dotSelectedSize: 8,
    //                               dotSpacing: 12,
    //                               controller: _controller,
    //                               itemCount: data.homePageData.offers.length,
    //                               orientation: Axis.horizontal,
    //                             ),
      
                                PageView(
          controller: widget.controller,
            scrollDirection: Axis.horizontal,
            children: data.homePageData.offers
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
                            "http://137.184.74.132/api/files/${e.collectionId}/${e.id}/" +
                                e.image)))
                .toList());
                // ]);
        
  }
}
