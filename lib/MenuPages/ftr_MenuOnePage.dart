import 'package:flutter/material.dart';

class ftr_MenuOnePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      /*  image: image,
    */  child:new Image.asset(
      'images/tech_three.jpg',
      width: size.width,
      height: size.height,
      fit: BoxFit.fill,
    ),
      // color: color,
    );
  }
}