import 'package:flutter/material.dart';
import 'package:one_touch/presentation/common/SearchBox.dart';
import 'package:one_touch/presentation/common/TileType1.dart';
import 'package:one_touch/presentation/common/TileType2.dart';
import 'package:one_touch/presentation/common/TileType3.dart';
import 'package:one_touch/presentation/common/TitleBar.dart';

class Emergency extends StatefulWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        child: Column(
          children: [
            TitleBar(title: "Labour",),
            SizedBox(
              height: 21,
            ),
            SearchBox(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 22),
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
