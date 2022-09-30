//This is the card inside category expanded page, for type "shop"
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class TileType1 extends StatelessWidget {
  final Map item;

   const TileType1({Key? key, required this.item}) : super(key: key);
  _makingPhoneCall() async {
    var url = Uri.parse("tel:9776765434");
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
    print("item ${item}");
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
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
                        "http://137.184.74.132/api/files/${item["@collectionId"]}/${item["id"]}/" +
                            item["list_image"]),
              ),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item["name"]),
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: Color.fromRGBO(153, 157, 160, 1),
                      size: 20,
                    ),
                    Text(
                      "Kakkanad, Kochii",
                      style: TextStyle(color: Color(0xff999DA0)),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            item["phone_number"] != ""
                ? InkWell(
                    onTap:_makingPhoneCall,
                    child:const Icon(
                      Icons.phone,
                      size: 24,
                      color: Color(0xff1C1D20),
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              width: 20,
            ),
            item["whatsapp_number"] != ""
                ? InkWell(
                    onTap: () => openwhatsapp(context, item["whatsapp_number"]),
                    child: SvgPicture.asset("assets/icons/whatsapp.svg"))
                : const SizedBox(),
            item["is_paid"]
                ? const Icon(
                    Icons.keyboard_arrow_right_outlined,
                    size: 30,
                    color: Color(0xff1C1D20),
                  )
                : const SizedBox()
          ],
        )
      ]),
    );
  }
}
