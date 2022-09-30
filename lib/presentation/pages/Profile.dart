import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';


class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding:
                      EdgeInsets.only(top: 60, left: 14, right: 14, bottom: 30),
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
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 24.0,
                          child: Icon(
                            Icons.settings,
                            color: Colors.grey,
                          ),
                          // backgroundImage: AssetImage("assets/images/profile.png"),
                          backgroundColor: Colors.transparent,
                        ),
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
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/default.png"),
                      placeholder: (context, url) =>
                          Image.asset("assets/images/default.png"),
                      imageUrl: "assets/images/profileImg.png"),
                ),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(8)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8, top: 34),
                child: Text(
                  "Kathy Gibson",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.place,
                    color: Color.fromRGBO(153, 157, 160, 1),
                  ),
                  Text(
                    "Sulthan Bathery, Wayanad",
                    style: TextStyle(color: Color(0xff999DA0)),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: 14),
                              child: SvgPicture.asset("assets/icons/glob.svg",width: 25,)),
                          Padding(
                              padding: EdgeInsets.only(right: 14),
                              child: SvgPicture.asset("assets/icons/fb.svg",width: 25)),
                          Padding(
                              padding: EdgeInsets.only(right: 14),
                              child:
                                  SvgPicture.asset("assets/icons/whtsapp2.svg",width: 25)),
                          Padding(
                              padding: EdgeInsets.only(right: 14),
                              child: SvgPicture.asset("assets/icons/phone2.svg",width: 25)),
                        ],
                      ),
              )
            ],
          ),
          // Text("Your Orders"),
          // Text("Order History"),
          // Text("Subscriptions"),
          // Text("Payment Details"),
          // Text("Privacy Policy"),


        ],
      )),
    );
  }
}
