import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryandecommerceapp/service/database.dart';
import 'package:fooddeliveryandecommerceapp/widget/widget_support.dart';

class ManageUsers extends StatefulWidget {
  const ManageUsers({super.key});

  @override
  State<ManageUsers> createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
  getontheload() async {
    userStream = await DatabaseMethods().getAllUsers();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getontheload();
  }

  Stream? userStream;

  Widget allUsers() {
    return StreamBuilder(
        stream: userStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Container(
                      margin: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 20.0),
                      child: Material(
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: Image.asset(
                                      "images/boy.jpg",
                                      height: 90,
                                      width: 90,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.person,
                                              color: Color(0xffef2b39)),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            ds["Name"],
                                            style:
                                                Appwidget.boldTextFieldStyle(),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.mail,
                                              color: Color(0xffef2b39)),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            ds["Email"],
                                            style: Appwidget
                                                .semiBoldTextFieldStyle(),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await DatabaseMethods()
                                              .deleteUser(ds["Id"]);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          width: 100,
                                          height: 50,
                                          child: Center(
                                            child: Text("Remove",
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: 40.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xffef2b39),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 4),
                  Text(
                    "Current Users",
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
                    height: 20.0,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    child: allUsers(),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
