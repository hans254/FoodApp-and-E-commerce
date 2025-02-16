import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20.0, left: 10.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(color: Color(0xffef2b39), borderRadius: BorderRadius.circular(30)),
                child: Icon(Icons.arrow_back, size: 30.0, color: Colors.white,),
              ),
            )
          ],
        ),
      ),
    );
  }
}