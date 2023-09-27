import 'package:flutter/material.dart';
import 'package:task/ui/cart/cart_screen.dart';
import 'package:task/ui/home/home_screen.dart';
import 'package:task/ui/product/product_screen.dart';
import 'package:task/utilities/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'This is the first task in ieee',
      initialRoute: HomeScreen.routeName,
      theme: AppThemes.lightTheme,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        CartScreen.routeName: (_) => CartScreen(),
        ProductScreen.routeName: (_) => ProductScreen(),
      },
    );
  }
}
