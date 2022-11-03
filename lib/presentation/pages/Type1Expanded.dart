import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_touch/Providers/HomeProvider.dart';
import 'package:one_touch/model/SingleCategory.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';


class Type1Expanded extends StatefulWidget {
  final Item item;
  const Type1Expanded({Key? key, required this.item}) : super(key: key);

  @override
  State<Type1Expanded> createState() => _Type1ExpandedState();
}

class _Type1ExpandedState extends State<Type1Expanded> {
  @override
  initState() {
    super.initState();
    var data = Provider.of<HomeProvider>(context, listen: false)
        .getItemDetails(widget.item.id);
  }

  _launchURLBrowser(passedUrl) async {
    var url = Uri.parse(passedUrl);
    // if (await canLaunchUrl(url)) {
    await launchUrl(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }

  _makingPhoneCall(phone) async {
    var url = Uri.parse("tel:$phone");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  openwhatsapp(context, String whatsapp) async {
    var whatsappUrl = "whatsapp://send?phone=+91$whatsapp" +
        "&text=${Uri.encodeComponent("hi")}";
    try {
      launchUrl(Uri.parse(whatsappUrl));
    } catch (e) {
      //To handle error and display error message
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: new Text("whatsapp not installed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    var data2 = Provider.of<HomeProvider>(context);

    return data2.isLoading?Center(child: CircularProgressIndicator(color: Color(0xff39C7A5),),):Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Stack(
        children: [
          ClipPath(
            clipper: ClippingClass(),
            child: Container(
              padding: EdgeInsets.only(bottom: 60, left: 16, right: 76),
              width: MediaQuery.of(context).size.width,
              height: 450,
              decoration: BoxDecoration(
                // color: new Color.fromRGBO(255, 0, 0, 0.5),
                image: DecorationImage(
                  image: AssetImage("assets/images/onBoardBg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ClipPath(
            clipper: ClippingClass(),
            child: Container(
                padding: EdgeInsets.only(bottom: 60, left: 16, right: 36),
                width: MediaQuery.of(context).size.width,
                height: 450,
                decoration: BoxDecoration(
                  color: new Color.fromRGBO(53, 53, 53, 0.59),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    // SizedBox(height: 40,),
                    Text(
                      widget.item.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      widget.item.shortDescription,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.place,
                          color: Color(0xffF2F2F2),
                          size: 20,
                        ),
                        Text(
                          widget.item.location,
                          style: TextStyle(color: Color(0xffF2F2F2)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _launchURLBrowser(widget.item.website);
                          },
                          child: Padding(
                              padding: EdgeInsets.only(right: 14),
                              child: SvgPicture.asset("assets/icons/glob.svg")),
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchURLBrowser(widget.item.facebook);
                          },
                          child: Padding(
                              padding: EdgeInsets.only(right: 14),
                              child: SvgPicture.asset("assets/icons/fb.svg")),
                        ),
                        GestureDetector(
                          onTap: () {
                            openwhatsapp(context, widget.item.whatsappNumber);
                          },
                          child: Padding(
                              padding: EdgeInsets.only(right: 14),
                              child: SvgPicture.asset(
                                  "assets/icons/whtsapp2.svg")),
                        ),
                        GestureDetector(
                          onTap: () {
                            _makingPhoneCall(widget.item.phoneNumber);
                          },
                          child: Padding(
                              padding: EdgeInsets.only(right: 14),
                              child:
                                  SvgPicture.asset("assets/icons/phone2.svg")),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
      Container(
          padding: EdgeInsets.only(top: 40, left: 14, right: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today’s Offers",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.keyboard_arrow_right_outlined,
                size: 30,
                color: Color(0xff1C1D20),
              )
            ],
          )),
      SizedBox(
        height: 18,
      ),
      ...data2.itemDetils.offers.map((e)=>  Container(
        padding: EdgeInsets.only(bottom: 18),
                    height: 140,

                    // width: 100,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(9)),
                    // color: Colors.red,
                    child: CachedNetworkImage(
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/default.png"),
                        placeholder: (context, url) =>
                            Image.asset("assets/images/default.png"),
                        imageUrl:
                            "http://137.184.74.132/api/files/${e.collectionId}/${e.id}/" +
                                e.image))),
      // Container(
      //     height: 140,

      //     // width: 100,
      //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
      //     // color: Colors.red,
      //     child: Image.asset("assets/images/banner.png")),
      SizedBox(
        height: 18,
      ),
      // Container(
      //     height: 140,

      //     // width: 100,
      //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
      //     // color: Colors.red,
      //     child: Image.asset("assets/images/banner2.png")),
    ])));
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
