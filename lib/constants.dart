import 'package:flutter/material.dart';
const Color mainColor=Colors.teal;
Widget height(double h){
  return SizedBox(
    height: h,
  );
}
Widget width(double w){
  return SizedBox(
    width: w,
  );
}
void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
}
