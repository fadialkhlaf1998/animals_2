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
                    child: MediaQuery.of(context).size.width>App.extra ? extraWidget(context) :
                    MediaQuery.of(context).size.width>App.extra2 ? extra2Widget(context) :
                    MediaQuery.of(context).size.width>App.xLarge ? xlargeWidget(context) :
                    MediaQuery.of(context).size.width>App.xLarge2 ? xlarge2Widget(context) :
                    MediaQuery.of(context).size.width>App.larg ? largeWidget(context) :
                    MediaQuery.of(context).size.width>App.larg2 ? large2Widget(context) :
                    bigWidget(context)
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

  textField(BuildContext context,TextEditingController controller,String translate, double width,double height,double fontSize) {
    return Container(
        width: width,
        height: height,
        color: Colors.grey[200],
        child: TextField(
          controller: controller,
          style: TextStyle(fontSize: fontSize,
              fontFamily: "POPPINS"),
          textAlignVertical: TextAlignVertical.bottom,
          decoration:  InputDecoration(
            hintText: App_Localization.of(context).translate(translate),
            hintStyle: TextStyle(color: Colors.grey[500],
                fontSize: fontSize, fontFamily: "POPPINS"),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
            ),
            enabledBorder:const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
            ),
          ),
        )
    );
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
          textField(context, homeController.name, "name", MediaQuery.of(context).size.width*0.5, 70, 23),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.email, "email", MediaQuery.of(context).size.width*0.5, 70, 23),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.phone, "phone", MediaQuery.of(context).size.width*0.5, 70, 23),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.city, "city", MediaQuery.of(context).size.width*0.5, 70, 23),
          SizedBox(height: MediaQuery.of(context).size.width*0.02),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.05,
            child: Text(App_Localization.of(context).translate("pet_details").toUpperCase(),
              style: TextStyle(
                  fontFamily: "FOUNDRYGRIDNIK",
                  fontSize: 23,
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
                textField(context, homeController.pet, "pet", MediaQuery.of(context).size.width*0.22, 70, 23),
                textField(context, homeController.breed, "breed", MediaQuery.of(context).size.width*0.22, 70, 23),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textField(context, homeController.date, "date", MediaQuery.of(context).size.width*0.22, 70, 23),
                Stack(
                  children: [
                    textField(context, homeController.certificate, "vaccination_certificate", MediaQuery.of(context).size.width*0.22, 70, 23),
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
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Text(App_Localization.of(context).translate("submit").toUpperCase(),style:
                    TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                        fontFamily: "POPPINS",
                        fontSize: 23
                    ),),
                  ),
                )
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 50, 23),
        ],
      ),
    );
  }
  extra2Widget(BuildContext context) {
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
                        color: App.primery,fontSize:65,
                        fontWeight: FontWeight.bold),maxLines: 1)
            ),
          ),
          textField(context, homeController.name, "name", MediaQuery.of(context).size.width*0.5, 65, 21),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.email, "email", MediaQuery.of(context).size.width*0.5, 65, 21),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.phone, "phone", MediaQuery.of(context).size.width*0.5, 65, 21),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.city, "city", MediaQuery.of(context).size.width*0.5, 65, 21),
          SizedBox(height: MediaQuery.of(context).size.width*0.02),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.05,
            child: Text(App_Localization.of(context).translate("pet_details").toUpperCase(),
              style: TextStyle(
                  fontFamily: "FOUNDRYGRIDNIK",
                  fontSize: 21,
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
                textField(context, homeController.pet, "pet", MediaQuery.of(context).size.width*0.22, 65, 21),
                textField(context, homeController.breed, "breed", MediaQuery.of(context).size.width*0.22, 65, 21),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textField(context, homeController.date, "date", MediaQuery.of(context).size.width*0.22, 65, 21),
                Stack(
                  children: [
                    textField(context, homeController.certificate, "vaccination_certificate", MediaQuery.of(context).size.width*0.22, 65, 21),
                    Positioned(
                        right: 0,
                        top: 16,
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
                                    fontSize: 19
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
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: Text(App_Localization.of(context).translate("submit").toUpperCase(),style:
                    TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                        fontFamily: "POPPINS",
                        fontSize: 21
                    ),),
                  ),
                )
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 45, 21),
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
          textField(context, homeController.name, "name", MediaQuery.of(context).size.width*0.5, 60, 19),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.email, "email", MediaQuery.of(context).size.width*0.5, 60, 19),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.phone, "phone", MediaQuery.of(context).size.width*0.5, 60, 19),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.city, "city", MediaQuery.of(context).size.width*0.5,60, 19),
          SizedBox(height: MediaQuery.of(context).size.width*0.02),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.05,
            child: Text(App_Localization.of(context).translate("pet_details").toUpperCase(),
              style: TextStyle(
                  fontFamily: "FOUNDRYGRIDNIK",
                  fontSize: 19,
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
                textField(context, homeController.pet, "pet", MediaQuery.of(context).size.width*0.22, 60, 19),
                textField(context, homeController.breed, "breed", MediaQuery.of(context).size.width*0.22,60, 19),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textField(context, homeController.date, "date", MediaQuery.of(context).size.width*0.22,60, 19),
                Stack(
                  children: [
                    textField(context, homeController.certificate, "vaccination_certificate", MediaQuery.of(context).size.width*0.22,60, 19),
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
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                        )
                    ),
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
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(App_Localization.of(context).translate("submit").toUpperCase(),style:
                    TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                        fontFamily: "POPPINS",
                        fontSize: 19
                    ),),
                  ),
                )
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 40, 19),
        ],
      ),
    );
  }
  xlarge2Widget(BuildContext context) {
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
                        color: App.primery,fontSize:55,
                        fontWeight: FontWeight.bold),maxLines: 1)
            ),
          ),
          textField(context, homeController.name, "name", MediaQuery.of(context).size.width*0.5, 55, 17),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.email, "email", MediaQuery.of(context).size.width*0.5,  55, 17),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.phone, "phone", MediaQuery.of(context).size.width*0.5,  55, 17),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.city, "city", MediaQuery.of(context).size.width*0.5, 55, 17),
          SizedBox(height: MediaQuery.of(context).size.width*0.02),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.05,
            child: Text(App_Localization.of(context).translate("pet_details").toUpperCase(),
              style: TextStyle(
                  fontFamily: "FOUNDRYGRIDNIK",
                  fontSize: 17,
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
                textField(context, homeController.pet, "pet", MediaQuery.of(context).size.width*0.22, 55, 17),
                textField(context, homeController.breed, "breed", MediaQuery.of(context).size.width*0.22, 55, 17),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textField(context, homeController.date, "date", MediaQuery.of(context).size.width*0.22, 55, 17),
                Stack(
                  children: [
                    textField(context, homeController.certificate, "vaccination_certificate", MediaQuery.of(context).size.width*0.22, 55, 17),
                    Positioned(
                        right: 0,
                        top: 14,
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
                                    fontSize: 17
                                ),
                              ),
                            ),
                          ),
                        )
                    ),
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
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(9),
                    child: Text(App_Localization.of(context).translate("submit").toUpperCase(),style:
                    TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                        fontFamily: "POPPINS",
                        fontSize: 17
                    ),),
                  ),
                )
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 35, 17),
        ],
      ),
    );
  }
  largeWidget(BuildContext context) {
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
                        color: App.primery,fontSize:45,
                        fontWeight: FontWeight.bold),maxLines: 1)
            ),
          ),
          textField(context, homeController.name, "name", MediaQuery.of(context).size.width*0.5, 40, 15),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.email, "email", MediaQuery.of(context).size.width*0.5, 40, 15),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.phone, "phone", MediaQuery.of(context).size.width*0.5, 40, 15),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.city, "city", MediaQuery.of(context).size.width*0.5,40, 15),
          SizedBox(height: MediaQuery.of(context).size.width*0.02),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.05,
            child: Text(App_Localization.of(context).translate("pet_details").toUpperCase(),
              style: TextStyle(
                  fontFamily: "FOUNDRYGRIDNIK",
                  fontSize: 15,
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
                textField(context, homeController.pet, "pet", MediaQuery.of(context).size.width*0.22,40, 15),
                textField(context, homeController.breed, "breed", MediaQuery.of(context).size.width*0.22,40, 15),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textField(context, homeController.date, "date", MediaQuery.of(context).size.width*0.22,40, 15),
                Stack(
                  children: [
                    textField(context, homeController.certificate, "vaccination_certificate", MediaQuery.of(context).size.width*0.22,40, 15),
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
                                    fontSize: 14
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
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Text(App_Localization.of(context).translate("submit").toUpperCase(),style:
                    TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                        fontFamily: "POPPINS",
                        fontSize: 15
                    ),),
                  ),
                )
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 30, 15),
        ],
      ),
    );
  }
  large2Widget(BuildContext context) {
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
                        color: App.primery,fontSize:35,
                        fontWeight: FontWeight.bold),maxLines: 1)
            ),
          ),
          textField(context, homeController.name, "name", MediaQuery.of(context).size.width*0.5, 35, 12),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.email, "email", MediaQuery.of(context).size.width*0.5,35, 12),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.phone, "phone", MediaQuery.of(context).size.width*0.5,35, 12),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.city, "city", MediaQuery.of(context).size.width*0.5,35, 12),
          SizedBox(height: MediaQuery.of(context).size.width*0.02),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.05,
            child: Text(App_Localization.of(context).translate("pet_details").toUpperCase(),
              style: TextStyle(
                  fontFamily: "FOUNDRYGRIDNIK",
                  fontSize: 12,
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
                textField(context, homeController.pet, "pet", MediaQuery.of(context).size.width*0.23,35, 12),
                textField(context, homeController.breed, "breed", MediaQuery.of(context).size.width*0.23,35, 12),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textField(context, homeController.date, "date", MediaQuery.of(context).size.width*0.23,35, 12),
                Stack(
                  children: [
                    textField(context, homeController.certificate, "vaccination_certificate", MediaQuery.of(context).size.width*0.23,35, 12),
                    Positioned(
                        right: 0,
                        top: 8,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            width: 50,
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
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          GestureDetector(
            onTap: () {
              //todo submit
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width*0.13,
                decoration: BoxDecoration(
                    color: App.primery,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(App_Localization.of(context).translate("submit").toUpperCase(),style:
                    TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                        fontFamily: "POPPINS",
                        fontSize: 12
                    ),),
                  ),
                )
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 25, 12),
        ],
      ),
    );
  }
  bigWidget(BuildContext context) {
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
                        color: App.primery,fontSize:30,
                        fontWeight: FontWeight.bold),maxLines: 1)
            ),
          ),
          textField(context, homeController.name, "name", MediaQuery.of(context).size.width*0.5, 30, 10),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.email, "email", MediaQuery.of(context).size.width*0.5,30, 10),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.phone, "phone", MediaQuery.of(context).size.width*0.5,30, 10),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          textField(context, homeController.city, "city", MediaQuery.of(context).size.width*0.5,30, 10),
          SizedBox(height: MediaQuery.of(context).size.width*0.02),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.05,
            child: Text(App_Localization.of(context).translate("pet_details").toUpperCase(),
              style: TextStyle(
                  fontFamily: "FOUNDRYGRIDNIK",
                  fontSize: 10,
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
                textField(context, homeController.pet, "pet", MediaQuery.of(context).size.width*0.24,30, 10),
                textField(context, homeController.breed, "breed", MediaQuery.of(context).size.width*0.24,30, 10),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textField(context, homeController.date, "date", MediaQuery.of(context).size.width*0.24,30, 10),
                Stack(
                  children: [
                    textField(context, homeController.certificate, "vaccination_certificate", MediaQuery.of(context).size.width*0.24,30, 10),
                    Positioned(
                        right: 0,
                        top: 8,
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
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          GestureDetector(
            onTap: () {
              //todo submit
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width*0.13,
                decoration: BoxDecoration(
                    color: App.primery,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(App_Localization.of(context).translate("submit").toUpperCase(),style:
                    TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                        fontFamily: "POPPINS",
                        fontSize: 10
                    ),),
                  ),
                )
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 20, 10),
        ],
      ),
    );
  }
}
