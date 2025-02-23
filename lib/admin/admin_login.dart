import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryandecommerceapp/admin/home_admin.dart';
import 'package:fooddeliveryandecommerceapp/widget/widget_support.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController usernamecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: //isLoading ?
            Center(
      child: //CircularProgressIndicator()): // Show loading indicator
         Container(
            padding: EdgeInsets.zero,
        child: Stack(
          children: [

            Container(
              height: MediaQuery.of(context).size.height / 2.0,
              padding: EdgeInsets.only(top: 80.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffffefbf),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Image.asset("images/pan.png",
                      height: 150, width: 200, fit: BoxFit.fill),
                  Image.asset("images/logo.png",
                      height: 50, width: 150, fit: BoxFit.cover),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 3,
                left: 20,
                right: 20,
              ),
              child: Material(
                elevation: 30,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.0),
                      Center(
                        child: Text("Admin",
                            style: Appwidget.headlineTextFieldStyle()),
                      ),
                      SizedBox(height: 10.0),
                      Text("Username",
                          style: Appwidget.currentBoldTextFieldStyle()),
                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFececf8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: usernamecontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Username",
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text("Password",
                          style: Appwidget.currentBoldTextFieldStyle()),
                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFececf8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          obscureText: true,
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Password",
                            prefixIcon: Icon(Icons.password_outlined),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      GestureDetector(
                        onTap: () {
                          loginAdmin();
                        },
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: 150,
                            decoration: BoxDecoration(
                              color: Color(0xffef2b39),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  loginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()['username'] != usernamecontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Invalid Username",
              style: TextStyle(fontSize: 18.0),
            ),
          ));
        } else if (result.data()['password'] !=
            passwordcontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Wrong Password",
              style: TextStyle(fontSize: 18.0),
            ),
          ));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeAdmin()));
        }
      });
    });
  }
}
