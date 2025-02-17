import 'package:flutter/material.dart';
import 'package:fooddeliveryandecommerceapp/pages/bottomnav.dart';
import 'package:fooddeliveryandecommerceapp/pages/detail_page.dart';
import 'package:fooddeliveryandecommerceapp/pages/home.dart';
import 'package:fooddeliveryandecommerceapp/pages/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
      ),
      home: BottomNav(),
    );
  }
}

