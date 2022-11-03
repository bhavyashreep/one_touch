import 'package:flutter/material.dart';
import 'package:one_touch/presentation/pages/Profile.dart';

class TitleBar extends StatefulWidget {
  final String title;
  const TitleBar({Key? key,required this.title}) : super(key: key);

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 60, left: 14, right: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [ GestureDetector(
                    // iconSize: 30,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back,size: 30,)),
                    onTap: () {
                       Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(
                       
                        ),
                      ),
                    );
                    },
                  ),  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                                  ),
                  ),],                  
                ),
                // Row(
                //   children: [
                //     Icon(
                //       Icons.place,
                //       color: Color.fromRGBO(153, 157, 160, 1),
                //     ),
                //     Text(
                //       "Sulthan Bathery, Wayanad",
                //       style: TextStyle(color: Color(0xff999DA0)),
                //     )
                //   ],
                // )
              ],
            ),
            GestureDetector(
              onTap: (){

              },
              child: CircleAvatar(
                radius: 24.0,
                backgroundImage: AssetImage("assets/images/profile.png"),
                backgroundColor: Colors.transparent,
              ),
            )
          ],
        ));
  }
}
