import 'package:flutter/material.dart';
import 'package:fooddeliveryandecommerceapp/admin/add_food.dart';
import 'package:fooddeliveryandecommerceapp/admin/admin_login.dart';
import 'package:fooddeliveryandecommerceapp/admin/all_order.dart';
import 'package:fooddeliveryandecommerceapp/admin/manage_users.dart';
import 'package:fooddeliveryandecommerceapp/pages/login.dart';
import 'package:fooddeliveryandecommerceapp/widget/widget_support.dart';

class SelectAccount extends StatefulWidget {
  const SelectAccount({super.key});

  @override
  State<SelectAccount> createState() => _SelectAccountState();
}

class _SelectAccountState extends State<SelectAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: 60.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Select Acount",
                    style: Appwidget.headlineTextFieldStyle(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
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
                    height: 50.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AdminLogin()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "images/delivery-man.png",
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                "Proceed to\nAdmin Login",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Color(0xffef2b39),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "images/team.png",
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                "Customer\nLogin",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Color(0xffef2b39),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
