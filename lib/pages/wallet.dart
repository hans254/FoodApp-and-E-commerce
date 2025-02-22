import 'package:flutter/material.dart';
import 'package:fooddeliveryandecommerceapp/widget/widget_support.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: 60.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Wallet",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Material(
                        elevation: 30,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Image.asset("images/wallet.png", height: 80, width: 80,fit: BoxFit.cover,),
                              SizedBox(width: 50.0,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Your Wallet", style: Appwidget.boldTextFieldStyle(),),
                                  Text("\$0.00", style: Appwidget.headlineTextFieldStyle(),)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xfff2f2f2)),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                          ),
                          child: Text(
                            "\$100",
                            style: Appwidget.boldTextFieldStyle(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xfff2f2f2)),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                          ),
                          child: Text(
                            "\$500",
                            style: Appwidget.boldTextFieldStyle(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xfff2f2f2)),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                          ),
                          child: Text(
                            "\$1000",
                            style: Appwidget.boldTextFieldStyle(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xfff2f2f2)),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                          ),
                          child: Text(
                            "\$2000",
                            style: Appwidget.boldTextFieldStyle(),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 50.0),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0xffef2b39),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "Add Money",
                          style: TextStyle(
                            color: Colors.white, 
                            fontSize: 20.0,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ))
            ],
          )),
    );
  }
}
