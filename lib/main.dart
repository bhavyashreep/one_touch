import 'package:flutter/material.dart';
import 'package:one_touch/Providers/MainProvider.dart';
import 'package:one_touch/presentation/pages/Dashboard.dart';
import 'package:one_touch/presentation/pages/Home.dart';
import 'package:one_touch/presentation/pages/OnBoardingScreen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (ctx) => MainProvider())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'OneTouch',
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
            ),
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'DM Sans',
            primarySwatch: Colors.blue,
          ),
          home:Home()  ,
        ));
  }
}
