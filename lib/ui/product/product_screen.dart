import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:task/data/data_model/product_data_model.dart';
import 'package:task/ui/product/product_view_model.dart';

import '../../utilities/app_colors.dart';
import '../cart/cart_screen.dart';

class ProductScreen extends StatefulWidget {
  static const String routeName = "product_screen";

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<bool> listOfSelected = [
    true,
    false,
    false,
  ];

  var viewModel = ProductViewModel();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var args = ModalRoute.of(context)!.settings.arguments as ProductDM;
    return BlocBuilder<ProductViewModel, ProductViewState>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: height * 0.6,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: height * 0.04),
                            child: SizedBox(
                                width: double.infinity,
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(60)),
                                    child: Image.network(
                                      args.imagePath ?? 'sssss',
                                      fit: BoxFit.cover,
                                    ))),
                          ),
                        ),
                        Positioned(
                            top: height * 0.526,
                            left: width * 0.79,
                            child: GestureDetector(
                              onTap: () {
                                viewModel.changeFavorite(
                                    args.id!, args.isFavorite!);
                              },
                              child: CircleAvatar(
                                radius: 27,
                                backgroundColor: args.isFavorite!
                                    ? Colors.white
                                    : Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Image.asset("assets/heart_icon.png"),
                                ),
                              ),
                            )),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.1),
                          child: Text(
                            r"$" "${args.price}" ".00",
                            style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                                color: Color(0xfffb5b58)),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.008,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.1),
                              child: Text(
                                args.productName ?? '',
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkFontColor),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.18,
                            ),
                            RatingBar.builder(
                              initialRating: args.rating,
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemSize: 20,
                              onRatingUpdate: (rating) {},
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            Text(
                              "${args.rating}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkFontColor),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.1),
                          child: const Text(
                            "Color option",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.1),
                          child: SizedBox(
                            width: width * 0.1,
                            height: height * 0.055,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      listOfSelected[index] =
                                          !listOfSelected[index];
                                    });
                                  },
                                  child: CircleAvatar(
                                    radius: 14,
                                    backgroundColor:
                                        "${args.listOfColors![index]}"
                                            .toColor(),
                                    child: CircleAvatar(
                                      radius: 11,
                                      backgroundColor: listOfSelected[index]
                                          ? Colors.white
                                          : Colors.transparent,
                                      child: CircleAvatar(
                                        backgroundColor:
                                            "${args.listOfColors![index]}"
                                                .toColor(),
                                        radius: 9,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: args.listOfColors!.length,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: width * 0.01,
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.008,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.1),
                          child: const Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.1),
                          child: Text(
                            args.description ?? '',
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: AppColors.lightFontColor,
                                height: 1.8),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: height * 0.04,
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.04,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.28,
                    ),
                    const Text(
                      "Product",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkFontColor,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.18,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, CartScreen.routeName);
                      },
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SizedBox(
                              width: width * 0.11,
                              child: Image.asset(
                                "assets/shopping_cart_icon.png",
                              ),
                            ),
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
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CartScreen.routeName,
                        arguments: args);
                  },
                  child: Container(
                    width: width * 0.53,
                    height: height * 0.085,
                    decoration: const BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(60))),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.07, right: width * 0.02),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),
                        const Text(
                          "Add to cart",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
