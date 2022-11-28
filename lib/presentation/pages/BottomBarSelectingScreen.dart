import 'package:flutter/material.dart';

import 'package:one_touch/presentation/pages/Classifieds.dart';
import 'package:one_touch/presentation/pages/Contacts.dart';
import 'package:one_touch/presentation/pages/Dashboard.dart';
import 'package:one_touch/presentation/pages/Emergency.dart';

import 'package:one_touch/presentation/pages/Notifications.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_touch/presentation/pages/News.dart';


class BottomBarSelectingScreen extends StatefulWidget {
  const BottomBarSelectingScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarSelectingScreen> createState() =>
      _BottomBarSelectingScreenState();
}

class _BottomBarSelectingScreenState extends State<BottomBarSelectingScreen> {
  @override
  PageController controller = PageController();

  final List<Widget> _chilren = [
    Dashboard(),
    Emergency(),
    News(),
    Contacts(),
    Classifieds(),
  ];

  int _curr = 0;

  int _currentIndex = 0;

  void onTappedBar(int index) {
    print(index);
    setState(() {
      _currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomBarSelection(),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Color(0xff602439),
          //Color(0xff7370FD),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white38,

          //Color(0xff7370FD),
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Icon(
                  Icons.home,
                  size: 34,
                  color: Colors.grey[800],
                ),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Icon(
                  Icons.home,
                  size: 34,
                  color: Color.fromRGBO(79, 79, 79, 0.24),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: SizedBox(
                    width: 24,
                    child: SvgPicture.asset(
                      "assets/icons/bottomIcon4.svg",
                    )),
                activeIcon: SizedBox(
                    width: 24,
                    child: SvgPicture.asset(
                      "assets/icons/bottomIcon4.svg",
                      color: Colors.black,
                    )),
                label: '',
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
              activeIcon: SizedBox(
                  width: 24,
                  child:  Icon(Icons.newspaper_outlined,color: Colors.grey,)),
              icon: SizedBox(
                  width: 24,
                  child: Icon(Icons.newspaper_outlined,color: Colors.grey[400],)),
              label: '',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              activeIcon: SizedBox(
                  width: 24,
                  child: SvgPicture.asset("assets/icons/bottomIcon1.svg",
                      color: Colors.black)),
              icon: SizedBox(
                  width: 24,
                  child: SvgPicture.asset("assets/icons/bottomIcon1.svg")),
              label: '',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              activeIcon: SizedBox(
                  width: 24,
                  child: SvgPicture.asset(
                    "assets/icons/bottomIcon2.svg",
                    color: Colors.black,
                  )),
              icon: SizedBox(
                  width: 24,
                  child: SvgPicture.asset(
                    "assets/icons/bottomIcon2.svg",
                  )),
              label: '',
              backgroundColor: Colors.blue,
            ),
          ],

          // currentIndex: _selectedIndex,

          // iconSize: 24,

          // onTap: _onItemTapped,

          elevation: 5),
    );
  }

  Widget bottomBarSelection() {
    return _chilren[_currentIndex];
  }
}
