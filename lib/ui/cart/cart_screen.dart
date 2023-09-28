import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/ui/cart/cart_view_model.dart';

import '../../data/data_model/cart_data_model.dart';
import '../../utilities/app_colors.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = "cart_screen";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartDM> listOfAllProducts = [];
  double selectedItems = 0;
  double shippingFee = 0;
  var viewModel = CartViewModel();

  bool isSelected = true;

  @override
  void initState() {
    viewModel.getProductsInCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    shippingFee = 0.12 * selectedItems;
    return BlocConsumer<CartViewModel, CartViewState>(
      bloc: viewModel,
      listenWhen: (previous, current) {
        if (current is GetProductsSuccessState) {
          listOfAllProducts = CartViewModel.listOfAllProducts;
        }
        return true;
      },
      buildWhen: (previous, current) {
        return true;
      },
      listener: (context, state) {},
      builder: (context, state) {
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
              onTap: () {
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
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  listOfAllProducts[index].isSelected =
                                      !listOfAllProducts[index].isSelected;
                                  if (listOfAllProducts[index].isSelected) {
                                    addSelectedItems(
                                        listOfAllProducts[index].price,
                                        listOfAllProducts[index].quantity);
                                  } else {
                                    removeSelectedItems(
                                        listOfAllProducts[index].price,
                                        listOfAllProducts[index].quantity);
                                  }
                                });
                              },
                              child: SizedBox(
                                width: width * 0.05,
                                height: height * 0.05,
                                child: Image.asset(
                                  listOfAllProducts[index].isSelected
                                      ? "assets/checked_icon.png"
                                      : "assets/unchecked_icon.png",
                                  color: listOfAllProducts[index].isSelected
                                      ? const Color(0xfffb5b58)
                                      : AppColors.buttonColor,
                                ),
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
                                  child: Image.network(
                                    "${listOfAllProducts[index].imagePath}",
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
                                  Text(
                                    listOfAllProducts[index].productName ?? '',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.darkFontColor),
                                  ),
                                  SizedBox(
                                    height: height * 0.05,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: Text(
                                          r"$"
                                          "${listOfAllProducts[index].price}"
                                          ".00",
                                          style: const TextStyle(
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
                                            GestureDetector(
                                              onTap: () {
                                                removeOne(index);
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                size: 20,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: width * 0.014,
                                                  vertical: height * 0.002),
                                              child: Text(
                                                  "${listOfAllProducts[index].quantity}"),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                addOne(index);
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                size: 20,
                                              ),
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
                      itemCount: listOfAllProducts.length),
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
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.07),
                            child: const Text(
                              "Selected Items",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkFontColor),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.07),
                            child: Text(
                              r"$" "${selectedItems.toStringAsFixed(2)}",
                              style: const TextStyle(
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
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.07),
                            child: const Text(
                              "Shipping Fee",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkFontColor),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.07),
                            child: Text(
                              r"$" "${shippingFee.toStringAsFixed(2)}",
                              style: const TextStyle(
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
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.07),
                            child: const Text(
                              "Subtotal",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.darkFontColor),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.07),
                            child: Text(
                              r"$"
                              "${(selectedItems + shippingFee).toStringAsFixed(2)}",
                              style: const TextStyle(
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
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.buttonColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)))),
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
      },
    );
  }

  removeOne(int index) {
    if (listOfAllProducts[index].quantity > 1) {
      setState(() {
        listOfAllProducts[index].quantity =
            listOfAllProducts[index].quantity - 1;
      });
    }
  }

  addOne(int index) {
    if (listOfAllProducts[index].quantity < 99) {
      setState(() {
        listOfAllProducts[index].quantity =
            listOfAllProducts[index].quantity + 1;
      });
    }
  }

  addSelectedItems(int price, int quantity) {
    selectedItems = selectedItems + (price * quantity);
  }

  removeSelectedItems(int price, int quantity) {
    selectedItems = selectedItems - (price * quantity);
  }
}
