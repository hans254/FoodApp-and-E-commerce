import 'package:flutter/material.dart';
import 'package:fooddeliveryandecommerceapp/pages/select_account.dart';
import 'package:fooddeliveryandecommerceapp/pages/signup.dart';
import 'package:fooddeliveryandecommerceapp/widget/content_model.dart';
import 'package:fooddeliveryandecommerceapp/widget/widget_support.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
                  child: Column(
                    
                    children: [
                      Image.asset(
                        contents[index].image,
                        height: 500,
                        width: MediaQuery.of(context).size.width/1.1,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 40.0),
                      Text(
                        contents[index].title,
                        style: Appwidget.headlineTextFieldStyle(),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        contents[index].description,
                        textAlign: TextAlign.center,
                        style: Appwidget.currentBoldTextFieldStyle(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentIndex == contents.length - 1) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const SelectAccount()));
              }
              _controller.nextPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.bounceIn);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20.0)),
              height: 60,
              margin: const EdgeInsets.all(40),
              width: double.infinity,
              child: Center(
                child: Text(
                  currentIndex == contents.length - 1 ? "Start" : "Next",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10.0,
      width: currentIndex == index ? 18 : 7,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: currentIndex == index ? Colors.black87 : Colors.black38,
      ),
    );
  }
}
