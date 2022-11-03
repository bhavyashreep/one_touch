import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_touch/presentation/pages/Login/LoginScreen.dart';
import 'package:one_touch/presentation/pages/Profile.dart';
import 'package:one_touch/presentation/pages/Notifications.dart';

class TitleBarHome extends StatefulWidget {
  final tokenn;
  final details;
  const TitleBarHome({Key? key, this.tokenn,this.details}) : super(key: key);

  @override
  State<TitleBarHome> createState() => _TitleBarHomeState();
}

class _TitleBarHomeState extends State<TitleBarHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 60, left: 14, right: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "OneTouch👆",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff39C7A5)),
                ),
                //  Row(
                //   children: [
                //      Icon(
                //       Icons.place,
                //       color: Color.fromRGBO(153, 157, 160, 1),
                //     ),
                //     // Text(
                //     //   "Sulthan Bathery, Wayanad",
                //     //   style: TextStyle(color: Color(0xff999DA0)),
                //     // )
                //   ],
                // )
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Notifications(),
                        ));
                  },
                  child: Icon(
                    Icons.notifications,
                    color: Colors.grey,
                    size: 28,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(),
                      ),
                    );
                  },
                  child: widget.tokenn != null
                      ? CircleAvatar(
                          radius: 24.0,
                          backgroundImage:
                              NetworkImage("http://137.184.74.132/api/files/a0nwgx35131zle5/${widget.details.id}/" +
                               widget.details.image,),
                          backgroundColor: Colors.transparent,
                        )
                      : GestureDetector(
                        onTap: (){
                          Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(
                        
                        ),
                      ),
                    );
                        },
                        child: Icon(Icons.login,color: Colors.grey,)),
                )
              ],
            )
          ],
        ));
  }
}
