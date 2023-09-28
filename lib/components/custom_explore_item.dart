import 'package:flutter/material.dart';
import 'package:task/data/data_model/product_data_model.dart';

import '../ui/cart/cart_screen.dart';
import '../utilities/app_colors.dart';

class CustomExploreItem extends StatelessWidget {
  ProductDM productDataModel;
  Function onHeartTab;
  Function onCartTab;

  CustomExploreItem(
      {required this.productDataModel,
      required this.onHeartTab,
      required this.onCartTab});

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
                        child: Image.network(
                          productDataModel.imagePath ?? '',
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Positioned(
                    top: height * 0.012,
                    left: width * 0.37,
                    child: GestureDetector(
                      onTap: () async {
                        await onHeartTab(
                            productDataModel.id, productDataModel.isFavorite);
                      },
                      child: CircleAvatar(
                          backgroundColor: productDataModel.isFavorite!
                              ? Colors.white
                              : Colors.transparent,
                          radius: 15,
                          child: Image.asset(
                            "assets/heart_icon.png",
                            width: 15,
                            color: const Color(0xfffb5b58),
                          )),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 15.0),
              child: Text(
                productDataModel.productName ?? '',
                style: const TextStyle(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    r"$" "${productDataModel.price}.00",
                    style: const TextStyle(
                        fontSize: 15, color: AppColors.darkFontColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () async {
                      await onCartTab(productDataModel);
                      Future.delayed(const Duration(seconds: 1)).then((value) =>
                          Navigator.pushNamed(context, CartScreen.routeName));
                    },
                    child: const CircleAvatar(
                        backgroundColor: AppColors.buttonColor,
                        radius: 15,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
