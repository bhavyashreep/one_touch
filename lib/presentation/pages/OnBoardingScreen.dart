import 'package:flutter/material.dart';
import 'package:one_touch/Providers/HomeProvider.dart';
import 'package:one_touch/Providers/MainProvider.dart';
import 'package:one_touch/presentation/pages/Dashboard.dart';
import 'package:one_touch/presentation/pages/Home.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  initState() {
    super.initState();
    // checkIsFirstInstalling();
    // fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<HomeProvider>(context);

    return Scaffold(
        // appBar: AppBar(),
        body: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset("assets/images/onBoardBg.png"),
          Container(
            // color: Colors.black,
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.only(left: 22, top: 28, right: 22, bottom: 0),
            child: Column(children: [
              const Text(
                "We deliver ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
              ),
              const Text(
                " everything at your ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
              ),
              const Text(
                " Doorstep",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 13,
              ),
              const Text(
                " Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff999DA0),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      //  Provider.of<MainProvider>(context).fetchCategories();
                      data.setIsFirtInstalling();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                          (route) => false);
                      // Navigator.pushAndRemoveUntil(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Home(),
                      //   ),
                      // );
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      // padding: EdgeInsets.symmetric(horizontal: 54),

                      primary: const Color(0xff39C7A5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(72),

                        // <-- Radius
                      ),
                    ),
                  ))
            ]),
          )
        ],
      ),
    ));
  }
}
