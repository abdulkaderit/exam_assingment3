
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
const colorRed = Color.fromRGBO(231,28, 36, 1);
const colorGreen = Color.fromRGBO(36,191, 115, 1);
const colorWhite = Color.fromRGBO(255,255,255, 1);
const colorDarkBlue = Color.fromRGBO(44,62, 80, 1);

SvgPicture screenBackground(context){
  return SvgPicture.asset(
    'assets/images/',
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}

InputDecoration appInputDecoration(label){
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: colorGreen,width: 2)
    ),
    fillColor: colorWhite,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 15),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: colorDarkBlue, width: 1.5 )
    ),
      border: OutlineInputBorder(),
    labelText: label
  );
}