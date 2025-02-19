import 'package:flutter/material.dart';
import 'package:fooddeliveryandecommerceapp/service/widget_support.dart';
import 'package:fooddeliveryandecommerceapp/widget/widget_support.dart';

class DetailPage extends StatefulWidget {
  String image, name, price;
  DetailPage({required this.image, required this.name, required this.price});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late double price;
  int quantity = 1;
  double totalPrice = 0.0;
  @override
  void initState() {
    super.initState();
    try {
      price = double.parse(widget.price);
      totalPrice = double.parse(price.toStringAsFixed(2));
    } catch (e) {
      price = 0.0;
      totalPrice = 0.0;
      debugPrint('Invalid price format: ${widget.price}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20.0, left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.arrow_back,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: Image.asset(
                widget.image,
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              widget.name,
              style: AppWidget.HeadLineTextFieldStyle(),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "\$${widget.price}",
              style: AppWidget.boldTextFieldStyle(),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(
                  "Pizza is a popular Italian dish with a dough base topped with tomato sauce, cheese, and various ingredients. Baked until crispy or fluffy, it comes in many styles like Margherita and Pepperoni, enjoyed worldwide for its delicious flavors."),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Quantity",
              style: Appwidget.semiBoldTextFieldStyle(),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    quantity += 1;
                    totalPrice = totalPrice + double.parse(widget.price);
                    setState(() {});
                  },
                  child: Material(
                    elevation: 30.0,
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xffef2b39),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  quantity.toString(),
                  style: Appwidget.boldTextFieldStyle(),
                ),
                SizedBox(
                  width: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (quantity > 1) {
                        quantity -= 1;
                        totalPrice = price * quantity;
                      }
                    });
                  },
                  child: Material(
                    elevation: 30.0,
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xffef2b39),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  elevation: 30.0,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Color(0xffef2b39),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Text("\$${(price * quantity).toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      )),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Material(
                  elevation: 30.0,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Text(
                        "Order Now",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}