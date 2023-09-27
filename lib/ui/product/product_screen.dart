import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = "product_screen";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              SizedBox(
                  height: height*0.55,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(60)
                    ),
                    child: Image.asset(args,fit: BoxFit.cover,))),
              Positioned(
                top: height*0.04,
                child: Row(
                  children: [
                    SizedBox(width: width*0.04,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: width*0.28,),
                    const Text(
                      "Product",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkFontColor,
                      ),
                    ),
                    SizedBox(width: width*0.18,),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                              width: width*0.11,
                              child: Image.asset("assets/shopping_cart_icon.png",)),
                        ),
                        Positioned(
                          left: width * 0.145,
                          top: height * 0.029,
                          child: const CircleAvatar(
                            backgroundColor: Color(0xfffb5b58),
                            radius: 5,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: height*0.55,
                  child: const Icon(Icons.heart_broken_rounded))

            ],
          ),
        ],
      ),
    );
  }
}
