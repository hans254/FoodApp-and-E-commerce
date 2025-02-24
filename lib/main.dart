import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryandecommerceapp/admin/admin_login.dart';
import 'package:fooddeliveryandecommerceapp/admin/all_order.dart';
import 'package:fooddeliveryandecommerceapp/admin/home_add.dart';
import 'package:fooddeliveryandecommerceapp/admin/home_admin.dart';
import 'package:fooddeliveryandecommerceapp/admin/manage_users.dart';
import 'package:fooddeliveryandecommerceapp/pages/bottomnav.dart';
import 'package:fooddeliveryandecommerceapp/pages/detail_page.dart';
import 'package:fooddeliveryandecommerceapp/pages/home.dart';
import 'package:fooddeliveryandecommerceapp/pages/login.dart';
import 'package:fooddeliveryandecommerceapp/pages/onboard.dart';
import 'package:fooddeliveryandecommerceapp/pages/signup.dart';
import 'firebase_options.dart'; // Add this import

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform, // Use generated options
    );
    runApp(const MyApp());
  } catch (e) {
    print('Firebase initialization failed: $e');
    // Optionally, run a fallback app with an error screen
    runApp(const ErrorApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Resturant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomeAdmin(),
    );
  }
}

// Fallback app for initialization failure
class ErrorApp extends StatelessWidget {
  const ErrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Failed to initialize app. Please check your setup.'),
        ),
      ),
    );
  }
}
