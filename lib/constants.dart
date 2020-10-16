import 'package:flutter/material.dart';

var kPrimaryColor = Colors.red[400];

var authTopContainerStyle = BoxDecoration(
  boxShadow:[
    BoxShadow(
        color: Colors.red.withOpacity(.4),
        spreadRadius: 5,
        blurRadius: 9,
        offset: Offset(0,5)
    ),
  ],
  color: kPrimaryColor,
);

var textInputDecoration = InputDecoration(
  fillColor: Colors.grey[100],
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide(
      color: Colors.grey[500].withOpacity(0.7),
      width: 0.2,
    ),
  ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
       color: kPrimaryColor,
       width: 2.0,
    ),
  ),
);

var errorTextStyle = TextStyle(
  color: kPrimaryColor,
  fontFamily: 'Poppins',
  fontSize: 13
);

