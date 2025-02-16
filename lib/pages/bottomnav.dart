import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fooddeliveryandecommerceapp/pages/home.dart';
import 'package:fooddeliveryandecommerceapp/pages/wallet.dart';
// import 'package:fooddeliveryandecommerceapp/pages/order.dart';
// import 'package:fooddeliveryandecommerceapp/pages/profile.dart';
import 'package:fooddeliveryandecommerceapp/pages/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  // late Widget currentPage;
  late Home Homepage;
  // late Profile profile;
  // late Order order;
  late Wallet wallet;
  
  @override
  void initState() {
    Homepage = const Home();
    // order = const Order();
    // profile = const Profile();
    wallet = const Wallet();
     pages =[Homepage];
    

    // pages =[Homepage, order, wallet, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // body: currentPage,
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.white, // Adjust this to match your design
        color: Colors.black,
        //buttonBackgroundColor: Colors.black,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
            //currentPage = pages[index];
          });
        },
        items: const [
          Icon(Icons.home_outlined, color: Colors.white),
          Icon(Icons.shopping_bag_outlined, color: Colors.white),
          Icon(Icons.wallet_outlined, color: Colors.white),
          Icon(Icons.person_outline, color: Colors.white),
        ],
        
      ),
      body: pages[currentTabIndex],
    );
  }
}
