import 'package:animals/app_localization.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:animals/view/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_widget/zoom_widget.dart';

class BookAssessment extends StatelessWidget {
  final HomeController homeController = Get.find();
  final GlobalKey<ScaffoldState> myKey = GlobalKey();

  BookAssessment({Key? key}) : super(key: key);

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
                    child:MediaQuery.of(context).size.width>App.larg?largegWidget(context)
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

  largegWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.12),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(
                child: Text(App_Localization.of(context).translate("book_an_assessment").toUpperCase(),
                    style: const TextStyle(
                        fontFamily: "FOUNDRYGRIDNIK",
                        color: App.primery,fontSize:40,
                        fontWeight: FontWeight.bold),maxLines: 1)
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: 40,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("name"),
                  hintStyle: TextStyle(color: Colors.grey[500],fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
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
                style: TextStyle(fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("email"),
                  hintStyle: TextStyle(color: Colors.grey[500],fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
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
                style: TextStyle(fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("phone"),
                  hintStyle: TextStyle(color: Colors.grey[500],fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
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
                style: TextStyle(fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("city"),
                  hintStyle: TextStyle(color: Colors.grey[500],fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
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
                  fontSize: MediaQuery.of(context).size.width > 2000 ? App.largeFontSize(MediaQuery.of(context).size.width) : 20,
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
                      style: TextStyle(fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("pet"),
                        hintStyle: TextStyle(color: Colors.grey[500],fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
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
                      style: TextStyle(fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("breed"),
                        hintStyle: TextStyle(color: Colors.grey[500],fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
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
                      style: TextStyle(fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("date"),
                        hintStyle: TextStyle(color: Colors.grey[500],fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
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
                          style: TextStyle(fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("vaccination_certificate"),
                            hintStyle: TextStyle(color: Colors.grey[500],fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
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
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            width: 60,
                            height: 20,
                            decoration: BoxDecoration(
                              color: App.purple,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(
                              child: Text(App_Localization.of(context).translate("upload").toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10
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
                        fontFamily: "FOUNDRYGRIDNIK",
                        fontSize: App.largeFontSize(MediaQuery.of(context).size.width)
                        ),),
                  ),
                )
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.3),
          App.footer(context,homeController),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("© 2022 by The Barkley Pet Camp",
                    style: TextStyle(
                        fontFamily: "FOUNDRYGRIDNIK",
                        fontSize: 12)),
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
          SizedBox(height: MediaQuery.of(context).size.width*0.12),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(
                child: Text(App_Localization.of(context).translate("book_an_assessment").toUpperCase(),
                    style: const TextStyle(
                        fontFamily: "FOUNDRYGRIDNIK",
                        color: App.primery,fontSize:30,
                        fontWeight: FontWeight.bold),maxLines: 1)
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 35,
              color: Colors.grey[200],
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                style: TextStyle(fontSize: 12),
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("name"),
                  hintStyle: TextStyle(color: Colors.grey[500],fontSize: 12),
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
                style: TextStyle(fontSize: 12),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("email"),
                  hintStyle: TextStyle(color: Colors.grey[500],fontSize: 12),
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
                style: TextStyle(fontSize: 12),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("phone"),
                  hintStyle: TextStyle(color: Colors.grey[500],fontSize: 12),
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
                style: TextStyle(fontSize: 12),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("city"),
                  hintStyle: TextStyle(color: Colors.grey[500],fontSize: 12),
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
                  color: App.purple,fontSize:16,
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
                      style: TextStyle(fontSize: 12),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("pet"),
                        hintStyle: TextStyle(color: Colors.grey[500],fontSize: 12),
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
                      style: TextStyle(fontSize: 12),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("breed"),
                        hintStyle: TextStyle(color: Colors.grey[500],fontSize: 12),
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
                      style: TextStyle(fontSize: 12),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("date"),
                        hintStyle: TextStyle(color: Colors.grey[500],fontSize: 12),
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
                          style: TextStyle(fontSize: 12),
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("vaccination_certificate"),
                            hintStyle: TextStyle(color: Colors.grey[500],fontSize: 12),
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
                        fontFamily: "FOUNDRYGRIDNIK",
                          fontWeight: FontWeight.bold,color: Colors.white,fontSize: 12),),
                  ),
                )
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.3),
          App.footer(context,homeController),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("© 2022 by The Barkley Pet Camp",
                    style: TextStyle(
                        fontFamily: "FOUNDRYGRIDNIK",
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
          SizedBox(height: MediaQuery.of(context).size.width*0.14),
          SizedBox(
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
              width: MediaQuery.of(context).size.width * 0.6,
              height: 30,
              color: Colors.grey[200],
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                style: TextStyle(fontSize: 11),
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("name"),
                  hintStyle: TextStyle(color: Colors.grey[500],fontSize: 11),
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
              width: MediaQuery.of(context).size.width*0.6,
              height: 30,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 11),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("email"),
                  hintStyle: TextStyle(color: Colors.grey[500],fontSize: 11),
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
              width: MediaQuery.of(context).size.width*0.6,
              height: 30,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 11),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("phone"),
                  hintStyle: TextStyle(color: Colors.grey[500],fontSize: 11),
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
              width: MediaQuery.of(context).size.width*0.6,
              height: 30,
              color: Colors.grey[200],
              child: TextField(
                style: TextStyle(fontSize: 11),
                textAlignVertical: TextAlignVertical.bottom,
                decoration:  InputDecoration(
                  hintText: App_Localization.of(context).translate("city"),
                  hintStyle: TextStyle(color: Colors.grey[500],fontSize: 11),
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
            width: MediaQuery.of(context).size.width*0.6,
            height: MediaQuery.of(context).size.height*0.05,
            child: Text(App_Localization.of(context).translate("pet_details").toUpperCase(),
              style: TextStyle(
                fontFamily: "FOUNDRYGRIDNIK",
                  color: App.purple,fontSize:13,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.015),
          Container(
            width: MediaQuery.of(context).size.width*0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width*0.27,
                    height: 30,
                    color: Colors.grey[200],
                    child: TextField(
                      style: TextStyle(fontSize: 11),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("pet"),
                        hintStyle: TextStyle(color: Colors.grey[500],fontSize: 11),
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
                    width: MediaQuery.of(context).size.width*0.27,
                    height: 30,
                    color: Colors.grey[200],
                    child: TextField  (
                      style: TextStyle(fontSize: 11),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("breed"),
                        hintStyle: TextStyle(color: Colors.grey[500],fontSize: 11),
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
            width: MediaQuery.of(context).size.width*0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width*0.27,
                    height: 30,
                    color: Colors.grey[200],
                    child: TextField(
                      style: TextStyle(fontSize: 11),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration:  InputDecoration(
                        hintText: App_Localization.of(context).translate("date"),
                        hintStyle: TextStyle(color: Colors.grey[500],fontSize: 11),
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
                        width: MediaQuery.of(context).size.width*0.27,
                        height: 30,
                        color: Colors.grey[200],
                        child: TextField (
                          style: TextStyle(fontSize: 11),
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("vaccination_certificate"),
                            hintStyle: TextStyle(color: Colors.grey[500],fontSize: 11),
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
                            width: 45,
                            height: 15,
                            decoration: BoxDecoration(
                                color: App.purple,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(
                              child: Text(App_Localization.of(context).translate("upload").toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 7
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
                width: MediaQuery.of(context).size.width*0.16,
                decoration: BoxDecoration(
                    color: App.primery,
                    borderRadius: BorderRadius.circular(50/2)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(App_Localization.of(context).translate("submit").toUpperCase(),
                      style: TextStyle(
                          fontFamily: "FOUNDRYGRIDNIK",
                          fontWeight: FontWeight.bold,color: Colors.white,fontSize: 11),),
                  ),
                )
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.3),
          App.footer(context,homeController),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("© 2022 by The Barkley Pet Camp",
                    style: TextStyle(
                        fontFamily: "FOUNDRYGRIDNIK",
                        fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
