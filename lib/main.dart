import 'package:flutter/material.dart';
import 'package:one_touch/Providers/HomeProvider.dart';
import 'package:one_touch/presentation/pages/Dashboard.dart';
import 'package:one_touch/presentation/pages/Home.dart';
import 'package:one_touch/presentation/pages/OnBoardingScreen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';



 void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (ctx) => HomeProvider())],
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
          home: Home(),
        ));
  }
}
