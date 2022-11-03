import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_touch/model/Classifieds.dart';
import 'package:url_launcher/url_launcher.dart';

class ClassifiedsCard extends StatelessWidget {
  final Item item;
  const ClassifiedsCard({Key? key, required this.item}) : super(key: key);
  _makingPhoneCall(phone) async {
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
    return Container(
      decoration: BoxDecoration(
          border: Border(
        bottom:
            BorderSide(width: 1.0, color: Color.fromRGBO(180, 180, 180, 0.3)),
      )),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      item.title,
                      style: TextStyle(fontWeight: FontWeight.w500),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
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
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
                onTap: () => openwhatsapp(context, item.whatsapp),
                child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset(
                "assets/icons/whtsapp2.svg",
                width: 25,
              ),
            )),
            InkWell(
                onTap: () => _makingPhoneCall(item.phoneNumber),
                child: SvgPicture.asset(
              "assets/icons/phone2.svg",
              width: 25,
            ))
          ],
        )
        // Row(
        //   children: [
        //     item["phone_number"] != ""
        //         ? InkWell(
        //             onTap:_makingPhoneCall,
        //             child:const Icon(
        //               Icons.phone,
        //               size: 24,
        //               color: Color(0xff1C1D20),
        //             ),
        //           )
        //         : const SizedBox(),
        //     const SizedBox(
        //       width: 20,
        //     ),
        //     item["whatsapp_number"] != ""
        //         ? InkWell(
        //             onTap: () => openwhatsapp(context, item["whatsapp_number"]),
        //             child: SvgPicture.asset("assets/icons/whatsapp.svg"))
        //         : const SizedBox(),
        //     item["is_paid"]
        //         ? const Icon(
        //             Icons.keyboard_arrow_right_outlined,
        //             size: 30,
        //             color: Color(0xff1C1D20),
        //           )
        //         : const SizedBox()
        //   ],
        // )
      ]),
    );
  }
}
