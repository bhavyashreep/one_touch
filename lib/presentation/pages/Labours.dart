import 'package:flutter/material.dart';
import 'package:one_touch/presentation/common/SearchBox.dart';
import 'package:one_touch/presentation/common/TileType1.dart';
import 'package:one_touch/presentation/common/TileType2.dart';
import 'package:one_touch/presentation/common/TitleBar.dart';

class Labours extends StatelessWidget {
  const Labours({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleBar(title: "Labour",),
            SizedBox(
              height: 21,
            ),
            SearchBox(),
            SizedBox(
              height: 32,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                Column(children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage("assets/images/2.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welders",
                    style: TextStyle(color: Color(0xff999DA0)),
                  )
                ]),
                SizedBox(
                  width: 22,
                ),
                Column(children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage("assets/images/1.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Fabrication",
                    style: TextStyle(color: Color(0xff999DA0)),
                  )
                ]),
                SizedBox(
                  width: 22,
                ),
                Column(children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage("assets/images/3.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Plumbing",
                    style: TextStyle(color: Color(0xff999DA0)),
                  )
                ]),
                SizedBox(
                  width: 22,
                ),
                Column(children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage("assets/images/1.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Plumbing",
                    style: TextStyle(color: Color(0xff999DA0)),
                  )
                ]),
              ]),
            ),
            SizedBox(
              height: 22,
            ),
            Text("Welders",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
            Container(
              padding: EdgeInsets.symmetric( horizontal: 10, vertical: 14),
              child: Column(
                children: [
                  // ListTile(
                  //   leading: CircleAvatar(
                  //         radius: 42.0,
                  //         backgroundImage: AssetImage("assets/images/hypermarket.png"),
                  //         backgroundColor: Colors.transparent,
                  //       ),
                  //   title: Text("Lulu Mall"),
                  //   subtitle:  Row(
                  //     children: [
                  //       Icon(

                  //         Icons.place,
                  //         color: Color.fromRGBO(153, 157, 160, 1),
                  //         size: 20,
                  //       ),
                  //       Text(
                  //         "Kakkanad, Kochi",
                  //         style: TextStyle(color: Color(0xff999DA0)),
                  //       )
                  //     ],
                  //   ),
                  //   trailing: Icon(Icons.keyboard_arrow_right_outlined)
                  // )

                  // TileType2(),
                  Divider(
                    thickness: 2,
                    color: Color.fromRGBO(180, 180, 180, 0.08),
                  ),
                  // TileType2(),
                  Divider(
                    thickness: 2,
                    color: Color.fromRGBO(180, 180, 180, 0.08),
                  ),
                  // TileType2()
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
