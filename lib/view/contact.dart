import 'package:animals/app_localization.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:animals/view/homeHeader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_widget/zoom_widget.dart';

class Contact extends StatelessWidget {
  final HomeController homeController = Get.find();
  final GlobalKey<ScaffoldState> myKey = GlobalKey();

  Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Positioned(child: HomeHeader()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  textField(BuildContext context,TextEditingController controller,String translate, double width,double height,double fontSize) {
    return Container(
        width: width,
        height: height,
        color: Colors.grey[200],
        child: TextField(
          controller: controller,
          style: TextStyle(fontSize: fontSize,
              letterSpacing: 1,
              fontFamily: "POPPINS"),
          textAlignVertical: TextAlignVertical.bottom,
          decoration:  InputDecoration(
            hintText: App_Localization.of(context).translate(translate),
            hintStyle: TextStyle(color: Colors.grey[500],
                letterSpacing: 1,
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
  uploadBtn(BuildContext context,double width,double height,double borderRadius,double fontSize,double hPadding) {
    return GestureDetector(
      onTap: () {
        //todo
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: hPadding),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: App.purple,
                borderRadius: BorderRadius.circular(borderRadius)
            ),
            child: Center(
              child: Text(App_Localization.of(context).translate("upload").toUpperCase(),
                style: TextStyle(
                    fontFamily: "POPPINS",
                    color: Colors.white,
                    letterSpacing: 0.5,
                    fontSize: fontSize
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  submitButton(BuildContext context,double width,double height,double fontSize) {
    return GestureDetector(
      onTap: (){
        //todo submit
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: App.primery,
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.1),
        ),
        child: Center(
          child: Text(App_Localization.of(context).translate("submit").toUpperCase(),style:TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontFamily: "POPPINS",
              letterSpacing: 2,
              fontWeight: FontWeight.bold),),
        ),
      )
    );
  }

  extraWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.14),
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
                        child: uploadBtn(context, 100, 35, 30, 20, 10)
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          submitButton(context, MediaQuery.of(context).size.width*0.12, 70, 23),
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
                        child: uploadBtn(context, 100, 35, 30, 19, 10)
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          submitButton(context, MediaQuery.of(context).size.width*0.13, 65, 21),
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
          SizedBox(height: MediaQuery.of(context).size.width * 0.13),
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
                        child: uploadBtn(context, 90, 30, 30, 18, 10)
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          submitButton(context, MediaQuery.of(context).size.width * 0.13, 56, 17),
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
          SizedBox(height: MediaQuery.of(context).size.width * 0.14),
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
                textField(context, homeController.pet, "pet", MediaQuery.of(context).size.width*0.23, 55, 17),
                textField(context, homeController.breed, "breed", MediaQuery.of(context).size.width*0.23, 55, 17),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textField(context, homeController.date, "date", MediaQuery.of(context).size.width*0.23, 55, 17),
                Stack(
                  children: [
                    textField(context, homeController.certificate, "vaccination_certificate", MediaQuery.of(context).size.width*0.23, 55, 17),
                    Positioned(
                        right: 0,
                        top: 14,
                        child: uploadBtn(context, 90, 30, 30, 17, 10)
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          submitButton(context,MediaQuery.of(context).size.width*0.14, 50, 17),
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
          SizedBox(height: MediaQuery.of(context).size.width * 0.14),
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
                textField(context, homeController.pet, "pet", MediaQuery.of(context).size.width*0.24,40, 15),
                textField(context, homeController.breed, "breed", MediaQuery.of(context).size.width*0.24,40, 15),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textField(context, homeController.date, "date", MediaQuery.of(context).size.width*0.24,40, 15),
                Stack(
                  children: [
                    textField(context, homeController.certificate, "vaccination_certificate", MediaQuery.of(context).size.width*0.24,40, 15),
                    Positioned(
                        right: 0,
                        top: 10,
                        child: uploadBtn(context, 70, 20, 20, 14, 8)
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          submitButton(context, MediaQuery.of(context).size.width*0.15,45,15),
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
          SizedBox(height: MediaQuery.of(context).size.width * 0.16),
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
                textField(context, homeController.pet, "pet", MediaQuery.of(context).size.width*0.24,35, 12),
                textField(context, homeController.breed, "breed", MediaQuery.of(context).size.width*0.24,35, 12),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textField(context, homeController.date, "date", MediaQuery.of(context).size.width*0.24,35, 12),
                Stack(
                  children: [
                    textField(context, homeController.certificate, "vaccination_certificate", MediaQuery.of(context).size.width*0.24,35, 12),
                    Positioned(
                        right: 0,
                        top: 8,
                        child: uploadBtn(context, 50, 20, 30, 10, 6)
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          submitButton(context, MediaQuery.of(context).size.width*0.16, 38, 12),
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
          SizedBox(height: MediaQuery.of(context).size.width * 0.16),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textField(context, homeController.pet, "pet", MediaQuery.of(context).size.width*0.4,30, 10),
              SizedBox(height: MediaQuery.of(context).size.width*0.01),
              textField(context, homeController.breed, "breed", MediaQuery.of(context).size.width*0.4,30, 10),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textField(context, homeController.date, "date", MediaQuery.of(context).size.width*0.4,30, 10),
              SizedBox(height: MediaQuery.of(context).size.width*0.01),
              Stack(
                children: [
                  textField(context, homeController.certificate, "vaccination_certificate", MediaQuery.of(context).size.width*0.4,30, 10),
                  Positioned(
                      right: 0,
                      top: 8,
                      child: uploadBtn(context, 60, 15, 15, 9, 5)
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          submitButton(context, MediaQuery.of(context).size.width*0.18, 35, 10),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 20, 10),
        ],
      ),
    );
  }
}
