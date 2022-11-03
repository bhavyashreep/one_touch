import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final passedContoller;
  final type;
  const InputForm({Key? key, this.passedContoller,this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passedContoller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is required!!';
        }
        return null;
      },

      // textAlign: TextAlign.center,

      keyboardType:type,
      decoration: InputDecoration(
        fillColor: Colors.white70,

        //hintText: 'Enter a product name eg. pension',
        hintStyle: TextStyle(fontSize: 16),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          borderSide: BorderSide(width: 1, color: Color(0xff39C7A5)),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          borderSide: BorderSide(width: 1, color: Color(0xffEEEEEE)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
        focusedErrorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
        filled: true,
        contentPadding: EdgeInsets.all(16),
      ),
    );
  }
}
class InputForm2 extends StatelessWidget {
  final passedContoller;
  final type;
  const InputForm2({Key? key, this.passedContoller,this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passedContoller,
     

      // textAlign: TextAlign.center,

      keyboardType:type,
      decoration: InputDecoration(
        fillColor: Colors.white70,

        //hintText: 'Enter a product name eg. pension',
        hintStyle: TextStyle(fontSize: 16),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          borderSide: BorderSide(width: 1, color: Color(0xff39C7A5)),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          borderSide: BorderSide(width: 1, color: Color(0xffEEEEEE)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
        focusedErrorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
        filled: true,
        contentPadding: EdgeInsets.all(16),
      ),
    );
  }
}
