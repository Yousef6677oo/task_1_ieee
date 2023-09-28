import 'package:flutter/material.dart';

import '../data/data_model/product_data_model.dart';
import '../ui/product/product_screen.dart';
import '../utilities/app_colors.dart';

class CustomBestSelling extends StatelessWidget {
  ProductDM productDataModel;

  CustomBestSelling({required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.accentColor,
            borderRadius: BorderRadius.circular(15)),
        width: width * 0.85,
        child: Row(
          children: [
            SizedBox(
              width: width * 0.04,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                  width: width * 0.22,
                  height: height * 0.11,
                  child: Image.network(
                    productDataModel.imagePath ?? '',
                    fit: BoxFit.fill,
                  )),
            ),
            SizedBox(
              width: width * 0.08,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: height * 0.025,
                  ),
                  const Text(
                    "Minimal Chair",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkFontColor),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  const Text(
                    "Lorem Ipsum",
                    style: TextStyle(color: AppColors.lightFontColor),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Text(
                    r"$125.00",
                    style:
                        TextStyle(fontSize: 15, color: AppColors.darkFontColor),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.05),
              child: Container(
                  width: width * 0.11,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: GestureDetector(
                      onTap: () async {
                        Navigator.pushNamed(context, ProductScreen.routeName,
                            arguments: productDataModel);
                      },
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                      ))),
            ),
            SizedBox(
              width: width * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
