import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/utilities/app_colors.dart';

import '../../components/custom_cart_icon.dart';
import '../../components/custom_explore_item.dart';
import '../../components/custom_profile_icon.dart';
import '../cart/cart_screen.dart';
import '../product/product_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home_screen";
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> listOfMockImages = [
    'assets/mock/mock_image_1.jpg',
    'assets/mock/mock_image_2.jpg',
    'assets/mock/mock_image_3.jpg',
    'assets/mock/mock_image_4.jpg',
    'assets/mock/mock_image_5.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(
        backgroundColor: AppColors.primaryColor,
      ),
      appBar: AppBar(
        toolbarHeight: height * 0.10,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/drawer_icon.svg",
            height: height * 0.2,
          ),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          CustomProfileIcon(),
          SizedBox(
            width: width * 0.015,
          ),
        ],
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.05,
              ),
              Expanded(
                flex: 9,
                child: SearchBar(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 15)),
                    leading: Image.asset(
                      "assets/search_icon.png",
                      width: width * 0.075,
                    ),
                    hintText: "Search",
                    hintStyle: MaterialStateProperty.all(const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.1,
                        color: AppColors.lightFontColor)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
              ),
              SizedBox(
                width: width * 0.01,
              ),
              Expanded(
                flex: 2,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, CartScreen.routeName);
                    },
                    child: CustomCartIcon()),
              ),
              SizedBox(
                width: width * 0.02,
              ),
            ],
          ),
          SizedBox(
            height: height * 0.035,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "Explore",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkFontColor),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.06),
            child: SizedBox(
              height: height * 0.36,
              child: ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(overscroll: false),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CustomExploreItem(
                      imagePath: listOfMockImages[index],
                    );
                  },
                  itemCount: listOfMockImages.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: width * 0.06,
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.042,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "Best Selling",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkFontColor),
            ),
          ),
          SizedBox(
            height: height * 0.035,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: SizedBox(
              height: height * 0.14,
              child: ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(overscroll: false),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.accentColor,
                            borderRadius: BorderRadius.circular(15)),
                        width: width * 0.85,
                        child: Row(
                          children: [
                            SizedBox(width: width*0.04,),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: SizedBox(
                                  width: width*0.22,
                                  height: height*0.11,
                                  child: Image.asset(
                                    listOfMockImages[index],
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            SizedBox(width: width*0.08,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(height: height*0.025,),
                                  const Text("Minimal Chair",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: AppColors.darkFontColor),textAlign: TextAlign.start,),
                                  SizedBox(height: height*0.005,),
                                  const Text("Lorem Ipsum",style: TextStyle(color: AppColors.lightFontColor),textAlign: TextAlign.start,),
                                  SizedBox(height: height*0.01,),
                                  const Text(r"$125.00",style: TextStyle(fontSize:15,color: AppColors.darkFontColor),textAlign: TextAlign.start,)
                                ],
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: height*0.05),
                              child: Container(
                                width: width*0.11,
                                  height: height*0.05,
                                  decoration: BoxDecoration(
                                    color: AppColors.buttonColor,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: GestureDetector(
                                      onTap: (){
                                        Navigator.pushNamed(context, ProductScreen.routeName,arguments: listOfMockImages[index]);
                                      },
                                      child: const Icon(Icons.arrow_forward_rounded,color: Colors.white,))),
                            ),
                            SizedBox(width: width*0.04,),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: listOfMockImages.length,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
