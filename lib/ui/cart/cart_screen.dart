import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = "cart_screen";
  List<String> listOfMockImages = [
    'assets/mock/mock_image_1.jpg',
    'assets/mock/mock_image_2.jpg',
    'assets/mock/mock_image_3.jpg',
    'assets/mock/mock_image_4.jpg',
    'assets/mock/mock_image_5.jpg'
  ];
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: height * 0.1,
        actions: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("assets/shopping_cart_icon.png"),
              ),
              Positioned(
                left: width * 0.144,
                top: height * 0.029,
                child: const CircleAvatar(
                  backgroundColor: Color(0xfffb5b58),
                  radius: 5,
                ),
              )
            ],
          ),
          SizedBox(
            width: width * 0.01,
          ),
        ],
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: const Text(
          "Cart",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.darkFontColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: height * 0.01,
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(
                          width: width * 0.04,
                        ),
                        SizedBox(
                          width: width * 0.05,
                          height: height * 0.05,
                          child: Image.asset(
                            isSelected
                                ? "assets/checked_icon.png"
                                : "assets/unchecked_icon.png",
                            color: isSelected?const Color(0xfffb5b58):AppColors.buttonColor,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.04,
                        ),
                        SizedBox(
                          width: width * 0.27,
                          height: height * 0.13,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                listOfMockImages[index],
                                fit: BoxFit.fill,
                              )),
                        ),
                        SizedBox(
                          width: width * 0.06,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                "Minimalist Chair",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkFontColor),
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 4.0),
                                    child: Text(
                                      r"$235.00",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xfffb5b58),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.lightFontColor,
                                            width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        const Icon(
                                          Icons.remove,
                                          size: 20,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * 0.014,
                                              vertical: height * 0.002),
                                          child: const Text("1"),
                                        ),
                                        const Icon(
                                          Icons.add,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: height * 0.035,
                    );
                  },
                  itemCount: listOfMockImages.length),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Card(
            margin: const EdgeInsets.all(0),
            elevation: 15,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(45),
                topLeft: Radius.circular(45),
              ),
            ),
            child: Container(
              height: height * 0.33,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(45),
                  topLeft: Radius.circular(45),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                        child: const Text(
                          "Selected Items",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.darkFontColor),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                        child: const Text(
                          r"$235.00",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xfffb5b58)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                        child: const Text(
                          "Shipping Fee",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.darkFontColor),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                        child: const Text(
                          r"$30.00",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xfffb5b58)),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    indent: width * 0.07,
                    endIndent: width * 0.07,
                    height: height * 0.05,
                    thickness: 1.5,
                    color: AppColors.lightFontColor,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                        child: const Text(
                          "Subtotal",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkFontColor),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                        child: const Text(
                          r"$265.00",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xfffb5b58)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(20)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.buttonColor),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)))),
                        onPressed: null,
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
