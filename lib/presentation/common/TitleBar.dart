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
                  children: [
                       Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                                  ),
                  ),],                  
                ),
          
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
