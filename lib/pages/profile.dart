import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryandecommerceapp/service/auth.dart';
import 'package:fooddeliveryandecommerceapp/service/shared_pref.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? profile, name, email; // phone, address;

  final ImagePicker _picker = ImagePicker();
  File? selectImage;

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);

    selectImage = File(image!.path);
    setState(() {
      uploadItem();
    });
  }

  uploadItem() async {
    if (selectImage != null) {
      String addId = randomAlphaNumeric(10);
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child("blogImages").child(addId);

      final UploadTask task = firebaseStorageRef.putFile(selectImage!);

      var downloadUrl = await (await task).ref.getDownloadURL();
      await SharedpreferenceHelper.saveUserProfile(downloadUrl);
      setState(() {});
    }
  }

  getthesharedpref() async {
    profile = await SharedpreferenceHelper().getUserProfile();
    name = await SharedpreferenceHelper().getUserName();
    email = await SharedpreferenceHelper().getUserEmail();

    setState(() {});
  }

  onthisload() async {
    await getthesharedpref();
    setState(() {});
  }

  @override
  void initState() {
    onthisload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: name == null
          ? CircularProgressIndicator()
          : Container(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
                        height: MediaQuery.of(context).size.height / 3.6,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Color(0xffef2b39),
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.elliptical(
                                    MediaQuery.of(context).size.width, 105.0))),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 5),
                          child: Material(
                            elevation: 10,
                            borderRadius: BorderRadius.circular(60),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: selectImage == null
                                  ? GestureDetector(
                                      onTap: () {
                                        getImage();
                                      },
                                      child: profile == null
                                          ? Image.asset(
                                              "images/boy.jpg",
                                              height: 120,
                                              width: 120,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              profile!,
                                              height: 120,
                                              width: 120,
                                              fit: BoxFit.cover,
                                            ),
                                    )
                                  : Image.file(selectImage!),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 90.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              name!,
                              style: TextStyle(
                                fontSize: 45.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Material(
                      elevation: 2.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.person, color: Color(0xffef2b39), size: 40.0),
                            SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  name!,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Material(
                      elevation: 2.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.mail, color: Color(0xffef2b39), size: 40.0),
                            SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  email!,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Material(
                      elevation: 2.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.description, color: Color(0xffef2b39), size: 40.0),
                            SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Terms and Conditions",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      AuthMethods().deleteuser();
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Material(
                        elevation: 2.0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 10.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.delete, color: Color(0xffef2b39), size: 40.0),
                              SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Delete Account",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      AuthMethods().SignOut();
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Material(
                        elevation: 2.0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 10.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.logout, color: Color(0xffef2b39), size: 40.0),
                              SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "LogOut",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
