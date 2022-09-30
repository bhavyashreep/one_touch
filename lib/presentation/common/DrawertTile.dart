import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  // const DrawerTile({ Key? key }) : super(key: key);
  final String title;
  // final String imagePath;
  final Function onClickFunction;
  DrawerTile(this.title,this.onClickFunction, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(57, 199, 165, 0.1),
            ),
            // height: 45,
            child:  Text(
              this.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          onTap:(){
            onClickFunction();
          },
        );
  }
}


