import 'package:animals/app_localization.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:animals/view/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zoom_widget/zoom_widget.dart';

class Contact extends StatelessWidget {
  final HomeController homeController = Get.find();
  final GlobalKey<ScaffoldState> myKey = GlobalKey();

  Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      key: myKey,
      endDrawer: App.myDrawer(context, homeController,myKey),
      body: RefreshIndicator(
        onRefresh: ()async{
          Get.offAllNamed("/");
        },
        child: Zoom(
          maxZoomWidth: MediaQuery.of(context).size.width,
          maxZoomHeight: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image/Background.png")
                        )
                    ),
                    child: MediaQuery.of(context).size.width>App.extra?extraWidget(context) :
                    MediaQuery.of(context).size.width>App.xLarge?xlargeWidget(context) :
                    MediaQuery.of(context).size.width>App.larg?largegWidget(context)
                        :MediaQuery.of(context).size.width>App.big?bigWidget(context)
                        :medWidget(context)
                ),
                // Positioned(child: App.header(context, homeController,myKey)),
                Positioned(child: Header()),
                Positioned(
                    right: 0,
                    child: App.languageBarHome(context, homeController)
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  extraWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.13),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(
                child: Text(App_Localization.of(context).translate("book_an_assessment").toUpperCase(),
                    style: const TextStyle(
                        fontFamily: "FOUNDRYGRIDNIK",
                        color: App.primery,fontSize:70,
                        fontWeight: FontWeight.bold),maxLines: 1)
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: 70,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 25,
                    fontFamily: "POPPINS"),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("name"),
                  hintStyle: TextStyle(color: Colors.grey[500],
                      fontSize: 25, fontFamily: "POPPINS"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: 70,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 25, fontFamily: "POPPINS"),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("email"),
                  hintStyle: TextStyle(color: Colors.grey[500],
                      fontSize: 25, fontFamily: "POPPINS"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: 70,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 25, fontFamily: "POPPINS"),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("phone"),
                  hintStyle: TextStyle(color: Colors.grey[500],
                      fontSize: 25, fontFamily: "POPPINS"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: 70,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 25, fontFamily: "POPPINS"),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("city"),
                  hintStyle: TextStyle(color: Colors.grey[500],
                      fontSize: 25, fontFamily: "POPPINS"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.02),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.05,
            child: Text(App_Localization.of(context).translate("pet_details").toUpperCase(),
              style: TextStyle(
                  fontFamily: "FOUNDRYGRIDNIK",
                  fontSize: 25,
                  color: App.purple,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.015),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width*0.22,
                    height: 70,
                    color: Colors.grey[200],
                    child: TextField(
                      style: TextStyle(fontSize: 25, fontFamily: "POPPINS"),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("pet"),
                        hintStyle: TextStyle(color: Colors.grey[500],
                            fontSize: 25, fontFamily: "POPPINS"),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                      ),
                    )
                ),
                Container(
                    width: MediaQuery.of(context).size.width*0.22,
                    height: 70,
                    color: Colors.grey[200],
                    child: TextField  (
                      textAlignVertical: TextAlignVertical.bottom,
                      style: TextStyle(fontSize: 25, fontFamily: "POPPINS"),
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("breed"),
                        hintStyle: TextStyle(color: Colors.grey[500],
                            fontSize: 25, fontFamily: "POPPINS"),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width*0.22,
                    height: 70,
                    color: Colors.grey[200],
                    child: TextField(
                      style: TextStyle(fontSize: 25),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("date"),
                        hintStyle: TextStyle(color: Colors.grey[500],
                            fontSize: 25, fontFamily: "POPPINS"),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                      ),
                    )
                ),
                Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width*0.22,
                        height: 70,
                        color: Colors.grey[200],
                        child: TextField (
                          style: TextStyle(fontSize: 2,),
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("vaccination_certificate"),
                            hintStyle: TextStyle(color: Colors.grey[500],
                                fontSize: 25, fontFamily: "POPPINS"),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                          ),
                        )
                    ),
                    Positioned(
                      right: 0,
                        top: 18,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: 100,
                            height: 35,
                            decoration: BoxDecoration(
                                color: App.purple,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Center(
                              child: Text(App_Localization.of(context).translate("upload").toUpperCase(),
                                style: TextStyle(
                                    fontFamily: "POPPINS",
                                    color: Colors.white,
                                    fontSize: 20
                                ),
                              ),
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          GestureDetector(
            onTap: () {
              //todo submit
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width*0.12,
                decoration: BoxDecoration(
                    color: App.primery,
                    borderRadius: BorderRadius.circular(50/2)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(App_Localization.of(context).translate("submit").toUpperCase(),style:
                    TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                        fontFamily: "POPPINS",
                        fontSize: 25
                    ),),
                  ),
                )
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("© 2022 by The Barkley Pet Camp",
                    style: TextStyle(
                        fontFamily: "POPPINS",
                        fontSize: 20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
  xlargeWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.12),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(
                child: Text(App_Localization.of(context).translate("book_an_assessment").toUpperCase(),
                    style: const TextStyle(
                        fontFamily: "FOUNDRYGRIDNIK",
                        color: App.primery,fontSize:60,
                        fontWeight: FontWeight.bold),maxLines: 1)
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: 60,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 20,
                    fontFamily: "POPPINS"
                ),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("name"),
                  hintStyle: TextStyle(color: Colors.grey[500],
                      fontSize: 20, fontFamily: "POPPINS"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: 60,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 20, fontFamily: "POPPINS"),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("email"),
                  hintStyle: TextStyle(color: Colors.grey[500],
                      fontSize: 20, fontFamily: "POPPINS"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: 60,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 20, fontFamily: "POPPINS"),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("phone"),
                  hintStyle: TextStyle(color: Colors.grey[500],
                      fontSize: 20, fontFamily: "POPPINS"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: 60,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 20, fontFamily: "POPPINS"),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("city"),
                  hintStyle: TextStyle(color: Colors.grey[500],
                      fontSize: 20, fontFamily: "POPPINS"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.02),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.05,
            child: Text(App_Localization.of(context).translate("pet_details").toUpperCase(),
              style: TextStyle(
                  fontFamily: "FOUNDRYGRIDNIK",
                  fontSize: 20,
                  color: App.purple,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.015),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width*0.22,
                    height: 60,
                    color: Colors.grey[200],
                    child: TextField(
                      style: TextStyle(fontSize: 20, fontFamily: "POPPINS"),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("pet"),
                        hintStyle: TextStyle(color: Colors.grey[500],
                            fontSize: 20, fontFamily: "POPPINS"),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                      ),
                    )
                ),
                Container(
                    width: MediaQuery.of(context).size.width*0.22,
                    height: 60,
                    color: Colors.grey[200],
                    child: TextField  (
                      textAlignVertical: TextAlignVertical.bottom,
                      style: TextStyle(fontSize: 20, fontFamily: "POPPINS"),
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("breed"),
                        hintStyle: TextStyle(color: Colors.grey[500],
                            fontSize: 20, fontFamily: "POPPINS"),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width*0.22,
                    height: 60,
                    color: Colors.grey[200],
                    child: TextField(
                      style: TextStyle(fontSize: 20,fontFamily: "POPPINS"),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("date"),
                        hintStyle: TextStyle(color: Colors.grey[500],
                            fontSize: 20, fontFamily: "POPPINS"),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                      ),
                    )
                ),
                Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width*0.22,
                        height: 60,
                        color: Colors.grey[200],
                        child: TextField (
                          style: TextStyle(fontSize: 20,fontFamily: "POPPINS"),
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("vaccination_certificate"),
                            hintStyle: TextStyle(color: Colors.grey[500],
                                fontSize: 20, fontFamily: "POPPINS"),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                          ),
                        )
                    ),
                    Positioned(
                        right: 0,
                        top: 15,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                                color: App.purple,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Center(
                              child: Text(App_Localization.of(context).translate("upload").toUpperCase(),
                                style: TextStyle(
                                    fontFamily: "POPPINS",
                                    color: Colors.white,
                                    fontSize: 15
                                ),
                              ),
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          GestureDetector(
            onTap: () {
              //todo submit
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width*0.12,
                decoration: BoxDecoration(
                    color: App.primery,
                    borderRadius: BorderRadius.circular(50/2)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(App_Localization.of(context).translate("submit").toUpperCase(),style:
                    TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                        fontFamily: "POPPINS",
                        fontSize: 20
                    ),),
                  ),
                )
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("© 2022 by The Barkley Pet Camp",
                    style: TextStyle(
                        fontFamily: "POPPINS",
                        fontSize: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }
  largegWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.12),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(
                child: Text(App_Localization.of(context).translate("book_an_assessment").toUpperCase(),
                    style: const TextStyle(
                        fontFamily: "FOUNDRYGRIDNIK",
                        color: App.primery,fontSize:50,
                        fontWeight: FontWeight.bold),maxLines: 1)
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: 40,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 16,
                    fontFamily: "POPPINS"
                ),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("name"),
                  hintStyle: TextStyle(color: Colors.grey[500],
                      fontSize: 16, fontFamily: "POPPINS"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: 40,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 16, fontFamily: "POPPINS"),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("email"),
                  hintStyle: TextStyle(color: Colors.grey[500],
                      fontSize: 16, fontFamily: "POPPINS"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: 40,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 16, fontFamily: "POPPINS"),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("phone"),
                  hintStyle: TextStyle(color: Colors.grey[500],
                      fontSize: 16, fontFamily: "POPPINS"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: 40,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 16, fontFamily: "POPPINS"),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("city"),
                  hintStyle: TextStyle(color: Colors.grey[500],
                      fontSize: 16, fontFamily: "POPPINS"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.02),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.05,
            child: Text(App_Localization.of(context).translate("pet_details").toUpperCase(),
              style: TextStyle(
                  fontFamily: "FOUNDRYGRIDNIK",
                  fontSize: 16,
                  color: App.purple,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.015),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width*0.22,
                    height: 40,
                    color: Colors.grey[200],
                    child: TextField(
                      style: TextStyle(fontSize: 16, fontFamily: "POPPINS"),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("pet"),
                        hintStyle: TextStyle(color: Colors.grey[500],
                            fontSize: 16, fontFamily: "POPPINS"),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                      ),
                    )
                ),
                Container(
                    width: MediaQuery.of(context).size.width*0.22,
                    height: 40,
                    color: Colors.grey[200],
                    child: TextField  (
                      textAlignVertical: TextAlignVertical.bottom,
                      style: TextStyle(fontSize: 16, fontFamily: "POPPINS"),
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("breed"),
                        hintStyle: TextStyle(color: Colors.grey[500],
                            fontSize: 16, fontFamily: "POPPINS"),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width*0.22,
                    height: 40,
                    color: Colors.grey[200],
                    child: TextField(
                      style: TextStyle(fontSize: 16,fontFamily: "POPPINS"),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("date"),
                        hintStyle: TextStyle(color: Colors.grey[500],
                            fontSize: 16, fontFamily: "POPPINS"),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                      ),
                    )
                ),
                Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width*0.22,
                        height: 40,
                        color: Colors.grey[200],
                        child: TextField (
                          style: TextStyle(fontSize: 16,fontFamily: "POPPINS"),
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("vaccination_certificate"),
                            hintStyle: TextStyle(color: Colors.grey[500],
                                fontSize: 16, fontFamily: "POPPINS"),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                          ),
                        )
                    ),
                    Positioned(
                        right: 0,
                        top: 10,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: 70,
                            height: 20,
                            decoration: BoxDecoration(
                                color: App.purple,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Center(
                              child: Text(App_Localization.of(context).translate("upload").toUpperCase(),
                                style: TextStyle(
                                    fontFamily: "POPPINS",
                                    color: Colors.white,
                                    fontSize: 11
                                ),
                              ),
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          GestureDetector(
            onTap: () {
              //todo submit
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width*0.12,
                decoration: BoxDecoration(
                    color: App.primery,
                    borderRadius: BorderRadius.circular(50/2)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(App_Localization.of(context).translate("submit").toUpperCase(),style:
                    TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                        fontFamily: "POPPINS",
                        fontSize: 16
                    ),),
                  ),
                )
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("© 2022 by The Barkley Pet Camp",
                    style: TextStyle(
                        fontFamily: "POPPINS",
                        fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }
  bigWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.13),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(
                child: Text(App_Localization.of(context).translate("book_an_assessment").toUpperCase(),
                    style: const TextStyle(
                        fontFamily: "FOUNDRYGRIDNIK",
                        color: App.primery,fontSize:35,
                        fontWeight: FontWeight.bold),maxLines: 1)
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 35,
              color: Colors.grey[200],
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                style: TextStyle(fontSize: 12,fontFamily: "POPPINS"),
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("name"),
                  hintStyle: TextStyle(color: Colors.grey[500],fontSize: 12,fontFamily: "POPPINS"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: 35,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 12,fontFamily: "POPPINS"),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("email"),
                  hintStyle: TextStyle(color: Colors.grey[500],fontSize: 12,fontFamily: "POPPINS"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: 35,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 12,fontFamily: "POPPINS"),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("phone"),
                  hintStyle: TextStyle(color: Colors.grey[500],fontSize: 12,fontFamily: "POPPINS"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: 35,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 12,fontFamily: "POPPINS"),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("city"),
                  hintStyle: TextStyle(color: Colors.grey[500],fontSize: 12,fontFamily: "POPPINS"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.02),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.05,
            child: Text(App_Localization.of(context).translate("pet_details").toUpperCase(),
              style: TextStyle(
                  fontFamily: "FOUNDRYGRIDNIK",
                  color: App.purple,fontSize:12,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.015),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width*0.22,
                    height: 35,
                    color: Colors.grey[200],
                    child: TextField(
                      style: TextStyle(fontSize: 12,fontFamily: "POPPINS"),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("pet"),
                        hintStyle: TextStyle(color: Colors.grey[500],fontSize: 12,fontFamily: "POPPINS"),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                      ),
                    )
                ),
                Container(
                    width: MediaQuery.of(context).size.width*0.22,
                    height: 35,
                    color: Colors.grey[200],
                    child: TextField  (
                      style: TextStyle(fontSize: 12,fontFamily: "POPPINS"),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("breed"),
                        hintStyle: TextStyle(color: Colors.grey[500],fontSize: 12,fontFamily: "POPPINS"),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width*0.22,
                    height: 35,
                    color: Colors.grey[200],
                    child: TextField(
                      style: TextStyle(fontSize: 12,fontFamily: "POPPINS"),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("date"),
                        hintStyle: TextStyle(color: Colors.grey[500],fontSize: 12,fontFamily: "POPPINS"),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                      ),
                    )
                ),
                Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width*0.22,
                        height: 35,
                        color: Colors.grey[200],
                        child: TextField (
                          style: TextStyle(fontSize: 12,fontFamily: "POPPINS"),
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("vaccination_certificate"),
                            hintStyle: TextStyle(color: Colors.grey[500],fontSize: 12,fontFamily: "POPPINS"),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                          ),
                        )
                    ),
                    Positioned(
                        right: 0,
                        top: 8,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            width: 50,
                            height: 18,
                            decoration: BoxDecoration(
                                color: App.purple,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(
                              child: Text(App_Localization.of(context).translate("upload").toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "POPPINS",
                                    fontSize: 8
                                ),
                              ),
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.06),
          GestureDetector(
            onTap: () {
              //todo submit
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                width: MediaQuery.of(context).size.width*0.13,
                decoration: BoxDecoration(
                    color: App.primery,
                    borderRadius: BorderRadius.circular(50/2)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(App_Localization.of(context).translate("submit").toUpperCase(),
                      style: TextStyle(
                          fontFamily: "POPPINS",
                          fontWeight: FontWeight.bold,color: Colors.white,fontSize: 12),),
                  ),
                )
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("© 2022 by The Barkley Pet Camp",
                    style: TextStyle(
                        fontFamily: "POPPINS",
                        fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
  medWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.15),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.15,
            child: Center(
                child: Text(App_Localization.of(context).translate("book_an_assessment").toUpperCase(),
                    style: const TextStyle(
                        fontFamily: "FOUNDRYGRIDNIK",
                        color: App.primery,fontSize:20,
                        fontWeight: FontWeight.bold),maxLines: 1)
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 30,
              color: Colors.grey[200],
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                style: TextStyle(fontSize: 10,fontFamily: "POPPINS"),
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("name"),
                  hintStyle: TextStyle(color: Colors.grey[500],fontSize: 10,fontFamily: "POPPINS"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: 30,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 10,fontFamily: "POPPINS"),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("email"),
                  hintStyle: TextStyle(color: Colors.grey[500],fontSize: 10,fontFamily: "POPPINS"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: 30,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 10,fontFamily: "POPPINS"),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("phone"),
                  hintStyle: TextStyle(color: Colors.grey[500],fontSize: 10,fontFamily: "POPPINS"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: 30,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 10,fontFamily: "POPPINS"),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("city"),
                  hintStyle: TextStyle(color: Colors.grey[500],fontSize: 10,fontFamily: "POPPINS"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.02),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.05,
            child: Text(App_Localization.of(context).translate("pet_details").toUpperCase(),
              style: TextStyle(
                  fontFamily: "FOUNDRYGRIDNIK",
                  color: App.purple,fontSize:10,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.015),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width*0.24,
                    height: 30,
                    color: Colors.grey[200],
                    child: TextField(
                      style: TextStyle(fontSize: 10,fontFamily: "POPPINS"),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("pet"),
                        hintStyle: TextStyle(color: Colors.grey[500],fontSize: 10,fontFamily: "POPPINS"),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                      ),
                    )
                ),
                Container(
                    width: MediaQuery.of(context).size.width*0.24,
                    height: 30,
                    color: Colors.grey[200],
                    child: TextField  (
                      style: TextStyle(fontSize: 10,fontFamily: "POPPINS"),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("breed"),
                        hintStyle: TextStyle(color: Colors.grey[500],fontSize: 10,fontFamily: "POPPINS"),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width*0.24,
                    height: 30,
                    color: Colors.grey[200],
                    child: TextField(
                      style: TextStyle(fontSize: 10,fontFamily: "POPPINS"),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("date"),
                        hintStyle: TextStyle(color: Colors.grey[500],fontSize: 10,fontFamily: "POPPINS"),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                      ),
                    )
                ),
                Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width*0.24,
                        height: 30,
                        color: Colors.grey[200],
                        child: TextField (
                          style: TextStyle(fontSize: 10,fontFamily: "POPPINS"),
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("vaccination_certificate"),
                            hintStyle: TextStyle(color: Colors.grey[500],fontSize: 10,fontFamily: "POPPINS"),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                          ),
                        )
                    ),
                    Positioned(
                        right: 0,
                        top: 7,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            width: 33,
                            height: 15,
                            decoration: BoxDecoration(
                                color: App.purple,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(
                              child: Text(App_Localization.of(context).translate("upload").toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "POPPINS",
                                    fontSize: 6
                                ),
                              ),
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.06),
          GestureDetector(
            onTap: () {
              //todo submit
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                width: MediaQuery.of(context).size.width*0.15,
                decoration: BoxDecoration(
                    color: App.primery,
                    borderRadius: BorderRadius.circular(50/2)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(App_Localization.of(context).translate("submit").toUpperCase(),
                      style: TextStyle(
                          fontFamily: "POPPINS",
                          fontWeight: FontWeight.bold,color: Colors.white,fontSize: 10),),
                  ),
                )
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("© 2022 by The Barkley Pet Camp",
                    style: TextStyle(
                        fontFamily: "POPPINS",
                        fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
