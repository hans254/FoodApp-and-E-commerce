import 'package:flutter/material.dart';
import 'package:fooddeliveryandecommerceapp/model/burger_model.dart';
import 'package:fooddeliveryandecommerceapp/model/category_model.dart';
import 'package:fooddeliveryandecommerceapp/model/chinese_model.dart';
import 'package:fooddeliveryandecommerceapp/model/pizza_model.dart';
import 'package:fooddeliveryandecommerceapp/pages/detail_page.dart';
import 'package:fooddeliveryandecommerceapp/service/burger_data.dart';
import 'package:fooddeliveryandecommerceapp/service/category_data.dart';
import 'package:fooddeliveryandecommerceapp/service/chinese_data.dart';
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
  List<BurgerModel> burger = [];
  List<ChineseModel> chinese = [];
  String track = "0";

  // get index => null;

  @override
  void initState() {
    categories = getCategories();
    pizza = getPizza();
    burger = getBurger();
    chinese = getChinese();
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
            track == "0"
                ? Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.6,
                                  mainAxisSpacing: 20.0,
                                  crossAxisSpacing: 10.0),
                          itemCount: pizza.length,
                          itemBuilder: (context, index) {
                            return FoodTile(pizza[index].name!,
                                pizza[index].image!, pizza[index].price!);
                          }),
                    ),
                  )
                : track == "1"
                    ? Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10.0),
                          child: GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.6,
                                      mainAxisSpacing: 20.0,
                                      crossAxisSpacing: 10.0),
                              itemCount: burger.length,
                              itemBuilder: (context, index) {
                                return FoodTile(burger[index].name!,
                                    burger[index].image!, burger[index].price!);
                              }),
                        ),
                      )
                    : track == "2"
                        ? Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 10.0),
                              child: GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.6,
                                          mainAxisSpacing: 20.0,
                                          crossAxisSpacing: 10.0),
                                  itemCount: chinese.length,
                                  itemBuilder: (context, index) {
                                    return FoodTile(
                                        chinese[index].name!,
                                        chinese[index].image!,
                                        chinese[index].price!);
                                  }),
                            ),
                          )
                        : track == "3"
                            ? Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 10.0),
                                  child: GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 0.6,
                                              mainAxisSpacing: 20.0,
                                              crossAxisSpacing: 10.0),
                                      itemCount: pizza.length,
                                      itemBuilder: (context, index) {
                                        return FoodTile(
                                            pizza[index].name!,
                                            pizza[index].image!,
                                            pizza[index].price!);
                                      }),
                                ),
                              )
                            : track == "4"
                                ? Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10.0),
                                      child: GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  childAspectRatio: 0.6,
                                                  mainAxisSpacing: 20.0,
                                                  crossAxisSpacing: 10.0),
                                          itemCount: pizza.length,
                                          itemBuilder: (context, index) {
                                            return FoodTile(
                                                pizza[index].name!,
                                                pizza[index].image!,
                                                pizza[index].price!);
                                          }),
                                    ),
                                  )
                                : Container(),
          ],
        ),
      ),
    );
  }

  Widget FoodTile(String name, String image, String price) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      padding: EdgeInsets.only(left: 10.0, top: 10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              image,
              height: 150,
              width: 150,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            name,
            style: AppWidget.boldTextFieldStyle(),
          ),
          Text(
            "\$" + price,
            style: AppWidget.boldTextFieldStyle(),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(image: image, name: name, price: price)));
                },

                child: Container(
                  height: 30.0,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomRight: Radius.circular(20)),
                  ),
                  child:
                      Icon(Icons.arrow_forward, color: Colors.white, size: 30.0),
                ),
              ),
              
            ],
          )
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
