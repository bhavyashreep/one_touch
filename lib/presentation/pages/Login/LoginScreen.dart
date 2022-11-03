import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:one_touch/infrastructure/firebase.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color sec_peach = const Color(0xff39C7A5);
  final _formKey = GlobalKey<FormState>();
  final numberController = new TextEditingController();
  bool isLoading = false;
  
  var verificationCode = "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Authentication authentication = Authentication();

  void changeState() {
    setState(() {
      isLoading = !isLoading;
      print(isLoading.toString());
      print("!!!!!!!!!!!!!!!!!!!!!11111");

    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.98,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * .2,
              // ),
              // Image.asset('assets/images/newlogo1 copy.png'),
              Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .3),
                  child: Text(
                    "OneTouch",
                    style: TextStyle(fontSize: 45),
                  )),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * .37,
              // ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "MOBILE NUMBER",
                          style: TextStyle(
                              color: Color(0xff888888),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Form(
                              key: _formKey,
                              child: Container(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      keyboardType: TextInputType.phone,
                                      controller: numberController,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(13)))),
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    !isLoading
                                        ? GestureDetector(
                                            child: Container(
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  color: sec_peach,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(13))),
                                              child: Center(
                                                child: Text(
                                                  "Sign In",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                            ),
                                            onTap: () async {
                                              authentication.otpGeneration(
                                                  context,
                                                  numberController.text,
                                                  changeState);
                                              // if (!isLoading) {
                                              //   if (_formKey.currentState
                                              //       .validate()) {
                                              //     changeState();
                                              //     displaySnackBar(
                                              //         "Generating Otp");
                                              //     authentication.otpGeneration(
                                              //       numberController,
                                              //       changeState,
                                              //       context,
                                              //     );
                                              //   }
                                              // }
                                            },
                                          )
                                        : Container(
                                            height: 60,
                                            decoration: BoxDecoration(
                                                color: sec_peach,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(13))),
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                              color: Colors.white,
                                            )),
                                          ),
                                    SizedBox(
                                      height: 27,
                                    ),
                                    // SkipLogin(),
                                    // SizedBox(
                                    //   height: 27,
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  displaySnackBar(text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
