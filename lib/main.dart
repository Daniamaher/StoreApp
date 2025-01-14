import 'package:flutter/material.dart';
import 'package:store_app/Screens/home_page.dart';
import 'package:store_app/Screens/update_product_page.dart';

void main() {
  runApp(StoreAPP());
}

class StoreAPP extends StatelessWidget {
  const StoreAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProductPage.id:(context) => UpdateProductPage()
      },
      initialRoute: HomePage.id,
    );
  }
}
