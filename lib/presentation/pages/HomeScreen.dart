
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:one_touch/presentation/pages/Dashboard.dart';


// class HomeScreen extends StatefulWidget {
//   static const routeName = "help-desk-screen";

//   @override
//   _HomeScreen createState() => _HomeScreen();
// }

// class _HomeScreen extends State<HomeScreen> {
//   int _currentIndex;

//   final List<Widget> _chilren = [
//     Dashboard(),
//     ContactScreen(),
   
//   ];
//   void onTappedBar(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _currentIndex = 0;
//   }

//   @override
//   Widget build(BuildContext context) {
//      final providerData=Provider.of<MainProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.search,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               providerData.setSearch(true);
//               print("${providerData.search}");
             

//             },
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.analytics,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               Navigator.pushNamed(
//                   context, SurveyListScreen.routeName);
//             },
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.notifications,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               Navigator.pushNamed(
//                   context, NotificationScreen.routeName);
//             },
//           ),
//         ],
//       ),
//       drawer: Drawer(child: DrawerItems()),
//       body: bottomBarSelection(),
//       bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Color(0xff602439),
//           //Color(0xff7370FD),
//           selectedItemColor: Color(0xFFDDC187),
//           unselectedItemColor: Colors.white38,

//           //Color(0xff7370FD),
//           onTap: onTappedBar,
//           currentIndex: _currentIndex,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.home,
//                 size: 20,
//               ),
//               label: "HOME",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.account_circle,
//                 size: 20,
//               ),
//               label: "CONTACT",
//             ),
//             BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 "assets/helpDesk.svg",
//                 color: Colors.white38,
//               ),
//               label: "HELP DESK",
//             ),
//           ]),
//     );
//   }

//   Widget bottomBarSelection() {
//     if (_currentIndex == 3)
//       return null;
//     else
//       return _chilren[_currentIndex];
//   }
// }
