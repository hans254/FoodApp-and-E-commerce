import 'package:flutter/material.dart';
import 'package:fooddeliveryandecommerceapp/model/category_model.dart';
import 'package:fooddeliveryandecommerceapp/service/category_data.dart';
import 'package:fooddeliveryandecommerceapp/service/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  
  // get index => null;

  @override
  void initState() {
    categories = getCategories();
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
            SizedBox(height: 20.0,),
            Container(
                height: 60,
                child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index){
                  return CategoryTile(
                    image: categories[index].image!, 
                    name: categories[index].name!,);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatefulWidget {
  String name, image;
  CategoryTile({required this.name, required this.image});

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      margin: EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
        color: Color(0xffef2b39),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Image.asset(widget.image, height: 40, width: 40, fit: BoxFit.cover,),
          SizedBox(height: 10.0,),
          Text(widget.name, style: AppWidget.whiteTextFieldStyle(),)
        ],
      ),
    );
  }
}
