import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final serachText;
  final onChange;

  const SearchBox({Key? key, this.serachText, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        style: TextStyle(color: Colors.black, fontSize: 20),
        controller: serachText,
        onChanged: (val){onChange(val);},
        cursorColor: Colors.black,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search_outlined),
            fillColor: Color(0xffF7F7F7),
            filled: true,
            // labelText: ,
            labelStyle: TextStyle(
                // color: Color(0xFFDDC187),
                fontSize: 14,
                fontWeight: FontWeight.w400),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF7F7F7), width: 1),
                borderRadius: BorderRadius.circular(95)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF7F7F7), width: 1),
                borderRadius: BorderRadius.circular(95)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(95),
              borderSide: BorderSide(color: Color(0xFFF7F7F7)),
            )),
      ),
    );
  }
}
