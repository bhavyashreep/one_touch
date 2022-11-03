import 'package:flutter/material.dart';
import 'package:one_touch/Providers/HomeProvider.dart';

import 'package:one_touch/presentation/common/TitleBar.dart';
import 'package:one_touch/presentation/components/NotificationCard.dart';
import 'package:provider/provider.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
   void initState() {
    super.initState();
    // fetchCategories();
    Provider.of<HomeProvider>(context, listen: false).getNotofications();
  }

  @override
  Widget build(BuildContext context) {
     var data = Provider.of<HomeProvider>(context);
     print("${data.notificationsAll}aaa ");

    return Scaffold(
      body:data.isLoading?Center(child: CircularProgressIndicator(color: Color(0xff39C7A5),),) :SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TitleBar(title: "Notifications"),
            GestureDetector(onTap: () {},
            child:  Padding(
              padding: EdgeInsets.only(top:30,bottom: 14),
              child: Text(
                  "Clear All",
                  style: TextStyle(color: Color(0xff999DA0), fontSize: 14),
                ),
            ),),
            ...data.notificationsAll.items.map(((e) =>NotificationCard(item:e) ))
            // data.notifications.map((e) =>NotificationCard().toList()))
            // NotificationCard(),
            // NotificationCard(),
            // NotificationCard(),
          ],
        ),
      )),
    );
  }
}
