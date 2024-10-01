import 'package:flutter/material.dart';
import 'package:technodom/home_page.dart';
import 'package:provider/provider.dart';
import 'package:technodom/payment.dart';
import 'package:technodom/search.dart';
import 'about_us.dart';
import 'auth.dart';
import 'cart_model.dart';
import 'cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CartModel(),
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => AuthWidget(),
        '/h': (context) => HomePage(),
        '/c':(context) => CartPage(),
        '/s':(context) => Search(),
        '/a':(context) => AboutUs(),
        '/p':(context) => Payment(),
      },
    )
    );
  }
}
