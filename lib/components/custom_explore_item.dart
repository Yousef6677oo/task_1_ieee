import 'package:flutter/material.dart';

import '../utilities/app_colors.dart';

class CustomExploreItem extends StatelessWidget {
  String imagePath;
  bool isFavorait = true;

  CustomExploreItem({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.accentColor,
          borderRadius: BorderRadius.circular(25),
        ),
        width: width * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: height * 0.015,
            ),
            Stack(
              children: [
                SizedBox(
                  width: width * 0.5,
                  height: height * 0.2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Positioned(
                    top: height * 0.012,
                    left: width * 0.37,
                    child: CircleAvatar(
                        backgroundColor:
                            isFavorait ? Colors.white : Colors.transparent,
                        radius: 15,
                        child: Image.asset(
                          "assets/heart_icon.png",
                          width: 15,
                          color: const Color(0xfffb5b58),
                        )))
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, top: 15.0),
              child: Text(
                "Item Name",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkFontColor),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, top: 4.0),
              child: Text(
                "Description",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightFontColor),
              ),
            ),
            SizedBox(
              height: height * 0.016,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    r"$250.00",
                    style:
                        TextStyle(fontSize: 15, color: AppColors.darkFontColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: CircleAvatar(
                      backgroundColor: AppColors.buttonColor,
                      radius: 15,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
