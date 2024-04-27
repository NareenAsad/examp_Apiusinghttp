import 'package:examp_api_using_http/controller/provider/cart_provider.dart';
import 'package:examp_api_using_http/view/product_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductListPage(),
      ),
    );
  }
}
