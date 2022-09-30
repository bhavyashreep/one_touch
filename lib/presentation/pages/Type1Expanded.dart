import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Type1Expanded extends StatelessWidget {
  final Map item;
  const Type1Expanded({Key? key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      item["name"],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      item["short_description"],
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
                          "Kakkanad, Kochi",
                          style: TextStyle(color: Color(0xffF2F2F2)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(right: 14),
                            child: SvgPicture.asset("assets/icons/glob.svg")),
                        Padding(
                            padding: EdgeInsets.only(right: 14),
                            child: SvgPicture.asset("assets/icons/fb.svg")),
                        Padding(
                            padding: EdgeInsets.only(right: 14),
                            child:
                                SvgPicture.asset("assets/icons/whtsapp2.svg")),
                        Padding(
                            padding: EdgeInsets.only(right: 14),
                            child: SvgPicture.asset("assets/icons/phone2.svg")),
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
      Container(
          height: 140,

          // width: 100,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
          // color: Colors.red,
          child: Image.asset("assets/images/banner.png")),
      SizedBox(
        height: 18,
      ),
      Container(
          height: 140,

          // width: 100,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
          // color: Colors.red,
          child: Image.asset("assets/images/banner2.png")),
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
