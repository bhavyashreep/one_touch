import 'dart:async';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:one_touch/Providers/HomeProvider.dart';
import 'package:one_touch/infrastructure/firebase.dart';
import 'package:one_touch/presentation/pages/Dashboard.dart';
import 'package:one_touch/presentation/pages/Login/RegistrationScreen.dart';
import 'package:provider/provider.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class OtpVerificationScreen extends StatefulWidget {
  final String smsCode;

  String number;
  var value;

  OtpVerificationScreen(
      {this.value, required this.number, required this.smsCode});
  Color sec_peach = const Color(0xff39C7A5);

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  Authentication authentication = Authentication();

  int start = 60;
  bool resendEnable = false;
  var data;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final otpController = new TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  bool isDataPresent = false;
  late Timer _timer;

  void startTimer() {
    const onsec = Duration(seconds: 1);
    _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          resendEnable = true;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  void changeState() {
    setState(() {
      isLoading = !isLoading;
      print(isLoading.toString());
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startTimer();
  }

  Widget build(BuildContext context) {
    var data = Provider.of<HomeProvider>(context);

    // print(

    //     "*********************${widget.smsCode}*****${widget.number}****${widget.value}");
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .2),
                child: Text(
                  "OneTouch",
                  style: TextStyle(fontSize: 45),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * .31,
            ),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 25),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "OTP",
                              style: TextStyle(
                                  color: Color(0xff888888),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            )),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: otpController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(13)))),
                                ),
                                resendEnable
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isLoading = true;
                                          });
                                          authentication.otpGeneration(context,
                                              widget.number, changeState);
                                          setState(() {
                                            isLoading = false;
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: 12, bottom: 14),
                                          alignment: Alignment.centerRight,
                                          child: Text("Resend",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.blue)),
                                        ),
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(
                                            top: 12, bottom: 14),
                                        alignment: Alignment.centerRight,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text("Resend code in ",
                                                style: TextStyle(fontSize: 12)),
                                            Text(
                                              "${start}",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            )
                                          ],
                                        ),
                                      ),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: widget.sec_peach,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(13))),
                                    child: Center(
                                      child: Text(
                                        "Verify",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  onTap: () async {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    print("otpssssssss" +
                                        widget.value +
                                        "INPUTTT" +
                                        otpController.text.toString());
                                    try {
                                      await _auth
                                          .signInWithCredential(
                                              PhoneAuthProvider.credential(
                                                  verificationId: widget.value,
                                                  smsCode: otpController.text
                                                      .toString()))
                                          .then((user) async {
                                        print("otp verified");
                                        setState(() {
                                          isLoading = false;
                                        });
                                        data
                                            .checkUserExist(widget.number)
                                            .then((value) => {
                                                  data.isexist
                                                      ? Navigator
                                                          .pushAndRemoveUntil(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Dashboard(
                                                                 ),
                                                              ),
                                                              (route) => false)
                                                      : Navigator
                                                          .pushAndRemoveUntil(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        RegisterForm(
                                                                  number: widget
                                                                      .number,
                                                                ),
                                                              ),
                                                              (route) => false)
                                                });
                                        // Navigator.pushAndRemoveUntil(
                                        //     context,v
                                        //     MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           RegisterForm(
                                        //         number: widget.number,
                                        //       ),
                                        //     ),
                                        //     (route) => false);
                                      });
                                    } catch (e) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      print("second error" + e.toString());
                                      authentication.displaySnackBar(
                                          "Authentication error", context);
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
