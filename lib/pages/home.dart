import 'package:flutter/material.dart';
import 'package:fooddeliveryandecommerceapp/model/category_model.dart';
import 'package:fooddeliveryandecommerceapp/model/pizza_model.dart';
import 'package:fooddeliveryandecommerceapp/service/category_data.dart';
import 'package:fooddeliveryandecommerceapp/service/pizza_data.dart';
import 'package:fooddeliveryandecommerceapp/service/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<PizzaModel> pizza = [];
  String track = "0";

  // get index => null;

  @override
  void initState() {
    categories = getCategories();
    pizza = getPizza();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 40.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "images/logo.png",
                      height: 50,
                      width: 110,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "Order Your Favourite Food!",
                      style: AppWidget.SimpleLineTextFieldStyle(),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "images/boy.jpg",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0),
                    margin: EdgeInsets.only(right: 20.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFececf8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search food item..."),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Color(0xffef2b39),
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30.0,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 70,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(categories[index].name!,
                      categories[index].image!, index.toString());
                },
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: MediaQuery.of(context).size.height/2,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0),
                itemCount: pizza.length,
                itemBuilder: (context, index) {
                  return FoodTile(
                    pizza[index].name!,
                    pizza[index].image!,
                    pizza[index].price!);
            }),
            )
          ],
        ),
      ),
    );
  }

  Widget FoodTile(String name, String image, String price) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            image,
            height: 150,
            width: 150,
            fit: BoxFit.contain,
          ),
          Text(name, style: AppWidget.boldTextFieldStyle(),),
          Text(price, style: AppWidget.boldTextFieldStyle(),),
        ],
      ),
    );
  }

  Widget CategoryTile(String name, String image, String categoryindex) {
    return GestureDetector(
      onTap: () {
        track = categoryindex.toString();
        setState(() {});
      },
      child: track == categoryindex
          ? Container(
              margin: EdgeInsets.only(right: 20.0, bottom: 10.0),
              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        image,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        name,
                        style: AppWidget.whiteTextFieldStyle(),
                      )
                    ],
                  ),
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              margin: EdgeInsets.only(right: 20.0, bottom: 10.0),
              decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  Image.asset(
                    image,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    name,
                    style: AppWidget.SimpleLineTextFieldStyle(),
                  )
                ],
              ),
            ),
    );
  }
}
