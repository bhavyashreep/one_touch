import 'package:flutter/material.dart';
import 'package:one_touch/Providers/HomeProvider.dart';
import 'package:one_touch/presentation/common/SearchBox.dart';
import 'package:one_touch/presentation/common/TileType1.dart';
import 'package:one_touch/presentation/common/TileType2.dart';
import 'package:one_touch/presentation/common/TileType3.dart';
import 'package:one_touch/presentation/common/TitleBar.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Emergency extends StatefulWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  @override
  initState() {
    super.initState();
    var data =
        Provider.of<HomeProvider>(context, listen: false).getEmergencies();
  }

  @override
  Widget build(BuildContext context) {
    var data2 = Provider.of<HomeProvider>(context);

    return Scaffold(
      body:data2.isLoading?Center(child: CircularProgressIndicator(color: Color(0xff39C7A5),),): SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleBar(
              title: "Emergency",
            ),
            SizedBox(
              height: 21,
            ),
            SearchBox(),
            SizedBox(
              height: 21,
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: data2.emergencyData.subCategories
                        .map((e) => GestureDetector(
                              onTap: (() => {
                                    data2.getFilteredCategory(
                                        data2.emergencyData.items[0].collectionId, e.id,""),
                                  }),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
                                                  "http://137.184.74.132/api/files/${e.collectionId}/${e.id}/" +
                                                      e.image),
                                        ),
                                        backgroundColor: Colors.transparent,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 80,
                                      child: Text(
                                        e.categoryName,
                                        style:
                                            TextStyle(color: Color(0xff999DA0)),
                                        softWrap: true,
                                        // textAlign: TextAlign.center,
                                        // overflow: TextOverflow.fade,
                                      ),
                                    )
                                  ]),
                            ))
                        .toList())),
            SizedBox(
              height: 21,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Emergency",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w500))),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 22),
              child: Column(
                  children: data2.emergencyData.items
                      .map((e) => GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => Type2Expanded(
                            //       item: e,
                            //     ),
                            //   ),
                            // );
                          },
                          child: TileType2(
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
