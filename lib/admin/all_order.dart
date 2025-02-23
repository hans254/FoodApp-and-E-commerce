import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryandecommerceapp/service/database.dart';
import 'package:fooddeliveryandecommerceapp/widget/widget_support.dart';

class AllOrders extends StatefulWidget {
  const AllOrders({super.key});

  @override
  State<AllOrders> createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {

  getontheload()async{
    orderStream = await DatabaseMethods().getAdminOrders();
    setState(() {
      
    });
  }

  @override
  void initState(){
    super.initState();
    getontheload();
  }

  Stream? orderStream;

  Widget allOrders() {
    return StreamBuilder(
        stream: orderStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                      child: Material(
                        elevation: 30,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Color(0xffef2b39),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      ds["Address"],
                                      style:
                                          Appwidget.currentBoldTextFieldStyle(),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      ds["FoodImage"],
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      width: 30.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ds["FoodName"],
                                          style: Appwidget
                                              .headlineTextFieldStyle(),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.format_list_numbered,
                                              color: Color(0xffef2b39),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Text(
                                              ds["Quantity"],
                                              style: Appwidget
                                                  .boldTextFieldStyle(),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Icon(
                                              Icons.monetization_on,
                                              color: Color(0xffef2b39),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Text(
                                              "\$" + ds["Total"],
                                              style: Appwidget
                                                  .boldTextFieldStyle(),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.person, color: Color(0xffef2b39),),
                                            SizedBox(width: 10.0,),
                                            Text(ds["Name"], style: Appwidget.semiBoldTextFieldStyle(),)
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.mail, color: Color(0xffef2b39),),
                                            SizedBox(width: 10.0,),
                                            Text(ds["Email"], style: Appwidget.semiBoldTextFieldStyle(),)
                                          ],
                                        ),
                                        SizedBox(height: 5.0,),
                                        Text(
                                          ds["Status"] + "!",
                                          style: TextStyle(
                                              color: Color(0xffef2b39),
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )),
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
        margin: EdgeInsets.only(top: 40.0,),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xffef2b39),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width/6),
                  Text("All Orders", style: Appwidget.headlineTextFieldStyle(),)
                ],
              ),
            
            ),
            SizedBox(height: 30.0,),
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
                      height: MediaQuery.of(context).size.height/1.5,
                      child: allOrders(),
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
