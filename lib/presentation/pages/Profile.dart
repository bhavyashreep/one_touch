import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_touch/Providers/HomeProvider.dart';
import 'package:one_touch/presentation/pages/BottomBarSelectingScreen.dart';
import 'package:one_touch/presentation/pages/Dashboard.dart';
import 'package:one_touch/presentation/pages/ItemAdd.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  initState() {
    super.initState();
    var data = Provider.of<HomeProvider>(context, listen: false).getProfile();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<HomeProvider>(context);
    print("dataaaaa ${data.profDetails.user}");

    return Scaffold(
      body: data.isLoading
          ? Center(
              child: CircularProgressIndicator(color: Color(0xff39C7A5)),
            )
          : SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            top: 60, left: 14, right: 14, bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              // iconSize: 30,
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    size: 30,
                                  )),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Profile(),
                                  ),
                                );
                              },
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ItemAdd(),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 35,
                                    color: Colors.grey,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    final viewData2 =
                                        await SharedPreferences.getInstance();
                                    viewData2.remove("token");

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>BottomBarSelectingScreen(),
                                      ),
                                    );
                                  },
                                  child: CircleAvatar(
                                    radius: 24.0,
                                    child: Icon(
                                      Icons.logout,
                                      color: Colors.grey,
                                    ),
                                    // backgroundImage: AssetImage("assets/images/profile.png"),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                    Container(
                      // padding: EdgeInsets.only(top:30 ),
                      height: 170,
                      width: 170,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) =>
                              Image.asset("assets/images/default.png"),
                          placeholder: (context, url) =>
                              Image.asset("assets/images/default.png"),
                          imageUrl:
                              "http://137.184.74.132/api/files/${data.profDetails.user.profile.collectionId}/${data.profDetails.user.profile.id}/" +
                                  data.profDetails.user.profile.photo,
                        ),
                      ),
                      decoration: BoxDecoration(
                          // color: Colors.red, borderRadius: BorderRadius.circular(8)
                          ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, top: 34),
                      child: Text(
                        data.profDetails.user.profile.userName,
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w700),
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Icon(
                    //       Icons.place,
                    //       color: Color.fromRGBO(153, 157, 160, 1),
                    //     ),
                    //     // Text(
                    //     //   data.profDetails.details.location,
                    //     //   style: TextStyle(color: Color(0xff999DA0)),
                    //     // )
                    //   ],
                    // ),
                    SizedBox(
                      height: 20,
                    ),

                    // Padding(
                    //   padding: EdgeInsets.only(top: 30),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Padding(
                    //                 padding: EdgeInsets.only(right: 14),
                    //                 child: SvgPicture.asset("assets/icons/glob.svg",width: 25,)),
                    //             Padding(
                    //                 padding: EdgeInsets.only(right: 14),
                    //                 child: SvgPicture.asset("assets/icons/fb.svg",width: 25)),
                    //             Padding(
                    //                 padding: EdgeInsets.only(right: 14),
                    //                 child:
                    //                     SvgPicture.asset("assets/icons/whtsapp2.svg",width: 25)),
                    //             Padding(
                    //                 padding: EdgeInsets.only(right: 14),
                    //                 child: SvgPicture.asset("assets/icons/phone2.svg",width: 25)),
                    //           ],
                    //         ),
                    // ),
                  ],
                ),
                // Text("Your Orders"),
                // Text("Order History"),
                // Text("Subscriptions"),
                // Text("Payment Details"),
                // Text("Privacy Policy"),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 34),
                  child: Text(
                    "Personal Deatils :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 14),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name   ",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          data.profDetails.user.profile.userName,
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ]),
                ),
                Divider(
                  color: Colors.grey[200],
                  thickness: 1,
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 14),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone Number   ",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          data.profDetails.user.profile.mobile,
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ]),
                ),

                Divider(
                  color: Colors.grey[200],
                  thickness: 1,
                ),
                // Container(
                //   padding:
                //       EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 14),
                //   child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           "Whatsapp   ",
                //           style: TextStyle(fontSize: 18),
                //         ),
                //         Text(
                //           data.profDetails.user.profile.mobile,
                //           style: TextStyle(fontSize: 20, color: Colors.grey),
                //         ),
                //       ]),
                // ),
                // Divider(
                //   color: Colors.grey[200],
                //   thickness: 1,
                // ),
                Padding(
                  padding: EdgeInsets.only(left: 15, top: 24),
                  child: Text(
                    "Contacts :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ...data.profDetails.contacts
                    .map((e) => Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: 10, left: 25, right: 25, bottom: 14),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              // padding: EdgeInsets.only(top:30 ),
                                              height: 70,
                                              width: 70,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      Image.asset(
                                                          "assets/images/default.png"),
                                                  placeholder: (context, url) =>
                                                      Image.asset(
                                                          "assets/images/default.png"),
                                                  imageUrl:
                                                      "http://137.184.74.132/api/files/${e["collectionId"]}/${e["id"]}/" +
                                                          e["image"],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Item Name : ",
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    Container(
                                                      width: 105,
                                                      child: Text(
                                                        e["name"],
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        softWrap: false,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Location : ",
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    Text(
                                                      e["location"],
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            return showDialog<void>(
                                              context: context,
                                              barrierDismissible:
                                                  false, // user must tap button!
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Are you sure want to delete this item?'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: Text('Confirm'),
                                                      onPressed: () {
                                                        data.deleteItem(
                                                            "contact", e["id"]);
                                                      },
                                                    ),
                                                    TextButton(
                                                      child: Text('Cancel'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ]),
                            ),
                            Divider(
                              color: Colors.grey[200],
                              thickness: 1,
                            ),
                          ],
                        ))
                    .toList(),
                Padding(
                  padding: EdgeInsets.only(left: 15, top: 24),
                  child: Text(
                    "Items :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ...data.profDetails.items
                    .map((item) => Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: 10, left: 25, right: 25, bottom: 14),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              // padding: EdgeInsets.only(top:30 ),
                                              height: 70,
                                              width: 70,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      Image.asset(
                                                          "assets/images/default.png"),
                                                  placeholder: (context, url) =>
                                                      Image.asset(
                                                          "assets/images/default.png"),
                                                  imageUrl:
                                                      "http://137.184.74.132/api/files/${item.collectionId}/${item.id}/" +
                                                          item.image,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Item Name : ",
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    Text(
                                                      item.name,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Location : ",
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                      Text(
                                                        item.location,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.grey),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            return showDialog<void>(
                                              context: context,
                                              barrierDismissible:
                                                  false, // user must tap button!
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Are you sure want to delete this item?'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: Text('Confirm'),
                                                      onPressed: () {
                                                        data.deleteItem(
                                                            "item", item.id);
                                                      },
                                                    ),
                                                    TextButton(
                                                      child: Text('Cancel'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ]),
                            ),
                            Divider(
                              color: Colors.grey[200],
                              thickness: 1,
                            ),
                          ],
                        ))
                    .toList()
              ],
            )),
    );
  }
}
