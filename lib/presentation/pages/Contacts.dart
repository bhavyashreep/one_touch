import 'package:flutter/material.dart';
import 'package:one_touch/Providers/HomeProvider.dart';
import 'package:one_touch/presentation/common/SearchBox.dart';
import 'package:one_touch/presentation/common/TileType1.dart';
import 'package:one_touch/presentation/common/TileType2.dart';
import 'package:one_touch/presentation/common/TileType3.dart';
import 'package:one_touch/presentation/common/TileType4.dart';
import 'package:one_touch/presentation/common/TitleBar.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  initState() {
    super.initState();
    var data =
        Provider.of<HomeProvider>(context, listen: false).getContacts();
  }

  @override
  Widget build(BuildContext context) {
    var data2 = Provider.of<HomeProvider>(context);

    return data2.isLoading?Center(child: CircularProgressIndicator(color: Color(0xff39C7A5),),):Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleBar(
              title: "Contacts",
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
                    children: data2.contacts.subCategories
                        .map((e) => GestureDetector(
                              onTap: (() => {
                                    // data2.getFilteredCategory(
                                    //     widget.categoryId, e["id"])
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
                child: Text("Contacts",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w500))),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 22),
              child: Column(
                  children: data2.contacts.items
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
                          child: TileType4(
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
