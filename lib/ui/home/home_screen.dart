import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/ui/home/home_view_model.dart';
import 'package:task/ui/product/product_screen.dart';
import 'package:task/utilities/app_colors.dart';

import '../../components/custom_best_selling.dart';
import '../../components/custom_cart_icon.dart';
import '../../components/custom_explore_item.dart';
import '../../components/custom_profile_icon.dart';
import '../../data/data_model/product_data_model.dart';
import '../cart/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductDM> listOfAllProducts = [];

  var scaffoldKey = GlobalKey<ScaffoldState>();

  var viewModel = HomeViewModel();

  @override
  void initState() {
    getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<HomeViewModel, HomeViewState>(
      bloc: viewModel,
      listenWhen: (previous, current) {
        if (current is GetListOfProductSuccessState) {
          listOfAllProducts = HomeViewModel.listOfAllProducts;
        }
        if (current is ChangeFavoriteSuccessState) {
          setState(() async {
            getAllProducts();
          });
        }
        return true;
      },
      buildWhen: (previous, current) {
        return true;
      },
      listener: (context, state) {},
      builder: (context, state) {
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
              onPressed: () async {
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
          body: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: ListView(
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                      behavior:
                          const ScrollBehavior().copyWith(overscroll: false),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ProductScreen.routeName,
                                  arguments: listOfAllProducts[index]);
                            },
                            child: CustomExploreItem(
                              productDataModel: listOfAllProducts[index],
                              onHeartTab: onHeartTab,
                              onCartTab: onCartTab,
                            ),
                          );
                        },
                        itemCount: listOfAllProducts.length,
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
                      behavior:
                          const ScrollBehavior().copyWith(overscroll: false),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomBestSelling(
                            productDataModel: listOfAllProducts[index],
                          );
                        },
                        itemCount: listOfAllProducts.length,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> onHeartTab(String id, bool stateOfSelected) async {
    await viewModel.changeFavorite(id, stateOfSelected);
  }

  Future<void> onCartTab(ProductDM productDM) async {
    await viewModel.addProductToCart(productDM);
  }

  Future<void> getAllProducts() async {
    await viewModel.getAllProducts();
  }
}
