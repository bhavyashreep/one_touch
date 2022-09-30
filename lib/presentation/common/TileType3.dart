import 'package:flutter/material.dart';

class TileType3 extends StatelessWidget {
  const TileType3({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 32.0,
                              backgroundImage:
                                  AssetImage("assets/images/hypermarket.png"),
                              backgroundColor: Colors.transparent,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Lulu Mall"),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.place,
                                      color: Color.fromRGBO(153, 157, 160, 1),
                                      size: 20,
                                    ),
                                    Text(
                                      "Kakkanad, Kochi",
                                      style:
                                          TextStyle(color: Color(0xff999DA0)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_outlined,
                          size: 30,
                          
                          color: Color(0xff1C1D20),
                        )
                      ]),
                );
  }
}