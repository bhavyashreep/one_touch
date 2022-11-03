import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:http/http.dart' as http;

import 'package:jiffy/jiffy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:one_touch/presentation/pages/Login/OtpScreen.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String cred = "";

  Future<void> otpGeneration(context, number,changeState) async {
    changeState();
    var phoneNumber = number;
    print("number" + number);
    phoneNumber = number.trim();
    await _auth.verifyPhoneNumber(
        phoneNumber: '+91${phoneNumber}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          print("___________________________________");

          ;

          // ANDROID ONLY!

          // Sign the user in (or link) with the auto-generated credential
          await _auth.signInWithCredential(credential).then(
              (value) => print("************${credential.smsCode}********"));
        },
        verificationFailed: (FirebaseAuthException error) {
          displaySnackBar('Validation error, please try again later', context);
          
          changeState();
        },
        codeSent: (verificationId, [forceResendingToken]) {
          print("________________________");
          print("________________________$verificationId");

          changeState();
          
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => OtpVerificationScreen(
                      smsCode: cred,
                      value: verificationId,
                      number: phoneNumber)));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
                  changeState();
        },
        timeout: Duration(seconds: 60));
  }
  // String cred;
  // Future<void> otpGeneration(TextEditingController numberController,
  //     Function changeState, BuildContext context) {
  //   print("**********1");
  //   var isValidUser = true;
  //   print("**********0");
  //   var phoneNumber = '+91 ' + numberController.text.trim();
  //   verificationCompleted: (PhoneAuthCredential credential) async {
  //   // ANDROID ONLY!

  //   // Sign the user in (or link) with the auto-generated credential
  //   await _auth.signInWithCredential(credential);
  // },
  //       verificationFailed: (FirebaseAuthException error) {
  //         displaySnackBar('Validation error, please try again later', context);
  //         changeState();
  //       },
  //       codeSent: (verificationId, [forceResendingToken]) {
  //         changeState();
  //         // Navigator.push(
  //         //     context,
  //         //     MaterialPageRoute(
  //         //         builder: (BuildContext context) => OtpVerificationScreen(
  //         //             smsCode: cred,
  //         //             value: verificationId,
  //         //             number: phoneNumber)));
  //       },
  // codeAutoRetrievalTimeout: (String verificationId) {
  //   // changeState();
  // },
  //       timeout: Duration(seconds: 60)
  //     );
  //     //await verifyPhoneNumber;
  //   } else {
  //     //non valid user
  //     changeState();
  //     displaySnackBar('Number not found, please sign up first', context);
  //   }

  // }

  displaySnackBar(text, context) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
