import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class NotificationCard extends StatelessWidget {
  final Map item;
  const NotificationCard({Key? key, required this.item}) : super(key: key);
// This returns time ago from now
//   getfromNowTime(date) {
//     Jiffy().fromNow(); // a few seconds ago

// //You can also pass in a DateTime Object or a string or a list
//     Jiffy(DateTime.now()).fromNow; // a few seconds ago
// //or
//     Jiffy(DateTime(2018, 10, 25)).fromNow(); // a year ago
//     Jiffy("2020-10-25").fromNow();

//   }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xffF7F7F7),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    item["title"],
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  )),
              Text(
                Jiffy(item["created"]).fromNow(),
                style: TextStyle(color: Color(0xff999DA0), fontSize: 14),
              )
            ],
          ),
          Text(item["short_description"],
              style: TextStyle(color: Color(0xff999DA0), fontSize: 14))
        ]),
      ),
    );
  }
}
