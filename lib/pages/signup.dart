import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryandecommerceapp/pages/bottomnav.dart';
import 'package:fooddeliveryandecommerceapp/pages/login.dart';
import 'package:fooddeliveryandecommerceapp/service/database.dart';
import 'package:fooddeliveryandecommerceapp/service/shared_pref.dart';
import 'package:fooddeliveryandecommerceapp/widget/widget_support.dart';
import 'package:random_string/random_string.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String email = "", password = "", name = "";
  TextEditingController namecontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isLoading = false; // Add loading state

  Future<void> registration() async {
    if (mailcontroller.text.isEmpty || passwordcontroller.text.isEmpty || namecontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Please fill all fields", style: TextStyle(fontSize: 18.0)),
        ),
      );
      return;
    }

    setState(() => isLoading = true); // Show loading
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: mailcontroller.text.trim(), // Use controller directly
        password: passwordcontroller.text, // Use controller directly
      );
      String id = randomAlphaNumeric(10);
      Map<String, dynamic> userInfoMap = {
        "Name": namecontroller.text,
        "Email": mailcontroller.text,
        "id": id,
        "Wallet":"0",
      };
      await SharedpreferenceHelper().saveUserEmail(mailcontroller.text);
      await SharedpreferenceHelper().saveUserName(namecontroller.text);
      await DatabaseMethods().addUserDetails(userInfoMap, id);
      if (mounted) { // Check if widget is still mounted
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNav()));
      }
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'weak-password':
          message = "Password provided is too weak.";
          break;
        case 'email-already-in-use':
          message = "The account already exists for that email.";
          break;
        case 'invalid-email':
          message = "The email address is invalid.";
          break;
        default:
          message = "An error occurred: ${e.message}";
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(message, style: TextStyle(fontSize: 18.0)),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text("Unexpected error: $e", style: TextStyle(fontSize: 18.0)),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => isLoading = false); // Hide loading
    }
  }

  @override
  void dispose() {
    namecontroller.dispose();
    mailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading indicator
          : Container(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2.5,
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
                        Image.asset("images/pan.png", height: 150, width: 200, fit: BoxFit.fill),
                        Image.asset("images/logo.png", height: 50, width: 150, fit: BoxFit.cover),
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
                        height: MediaQuery.of(context).size.height / 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30.0),
                            Center(
                              child: Text("SignUp", style: Appwidget.headlineTextFieldStyle()),
                            ),
                            SizedBox(height: 10.0),
                            Text("Name", style: Appwidget.currentBoldTextFieldStyle()),
                            SizedBox(height: 10.0),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFececf8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextField(
                                controller: namecontroller,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter Name",
                                  prefixIcon: Icon(Icons.person),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text("Email", style: Appwidget.currentBoldTextFieldStyle()),
                            SizedBox(height: 10.0),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFececf8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextField(
                                controller: mailcontroller,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter Email",
                                  prefixIcon: Icon(Icons.email_outlined),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text("Password", style: Appwidget.currentBoldTextFieldStyle()),
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
                              onTap: registration, // Call directly, validation inside
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
                                      "SignUp",
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account? ", style: Appwidget.semiBoldTextFieldStyle()),
                                SizedBox(width: 5.0),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                                  },
                                  child: Text("Login", style: Appwidget.currentBoldTextFieldStyle()),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}