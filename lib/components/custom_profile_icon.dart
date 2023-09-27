import 'package:flutter/material.dart';

import '../utilities/app_colors.dart';

class CustomProfileIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(10)),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Icon(Icons.person),
        ),
      ),
    );
  }
}
