import 'package:flutter/material.dart';

class CustomCartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset("assets/shopping_cart_icon.png"),
        ),
        Positioned(
          left: width * 0.115,
          top: height * 0.019,
          child: const CircleAvatar(
            backgroundColor: Color(0xfffb5b58),
            radius: 5,
          ),
        ),
      ],
    );
  }
}
