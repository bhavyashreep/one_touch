import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_touch/presentation/common/DrawertTile.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // padding: EdgeInsets.zero,
      children: [
        const SizedBox(
          height: 50,
        ),
        ListTile(
          title: const Center(
            child: Text(
              "OneTouch",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(
          height: 34,
        ),
        DrawerTile(
          "My Account",
          () {
            Navigator.pop(context);
          },
        ),
        DrawerTile(
          "Share App",
          () {
            Navigator.pop(context);
          },
        ),
        DrawerTile(
          "Wishlist",
          () {
            Navigator.pop(context);
          },
        ),
        DrawerTile(
          "About",
          () {
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: GestureDetector(
            onTap: () {},
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                 Text("Logout",
                    style: TextStyle(color: Color(0xff999DA0), fontSize: 20)),
                // Icon(Icons.login_outlined),
                const SizedBox(width: 14),
                SvgPicture.asset("assets/icons/logout.svg")
               
              ]),
            ),
          )
        )
      ],
    );
  }
}
