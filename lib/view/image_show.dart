import 'package:animals/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:animals/helper/app.dart';

class ImageShow extends StatelessWidget {
  Rx<int> index;
  HomeController homeController = Get.put(HomeController());
  ImageShow(this.index, {Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> myKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: myKey,
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
      ),
      body: Center(
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Obx( () {
              return  MediaQuery.of(context).size.width>App.extra ? extraWidget(context) :
              MediaQuery.of(context).size.width>App.extra2 ? extra2Widget(context) :
              MediaQuery.of(context).size.width>App.xLarge ? xlargeWidget(context) :
              MediaQuery.of(context).size.width>App.xLarge2 ? xlarge2Widget(context) :
              MediaQuery.of(context).size.width>App.larg?largeWidget(context) :
              MediaQuery.of(context).size.width>App.larg2?large2Widget(context) :
              bigWidget(context);
            }
          ),
        )),
      ),
    );
  }

  body(BuildContext context, double top ,double left,double right,double width,double height,double fontSize) {
    return Stack(
      children: [
        RawKeyboardListener(
          autofocus: true,
          onKey: (key){
            if (key.runtimeType == RawKeyDownEvent) {
              //right
              if(key.data.logicalKey == LogicalKeyboardKey.arrowRight){
                if(index<homeController.gallary.length-1) {
                  index.value++;
                }
              }
              //left
              else if(key.data.logicalKey == LogicalKeyboardKey.arrowLeft){
                if(index>0) {
                  index.value--;
                }
              }
            }
          },
          focusNode: FocusNode(),
          child: Container(
            color: App.primery,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).size.height * 0.1),
                  child: PhotoView(
                    imageProvider:
                    NetworkImage(homeController.gallary[index.value].image!.replaceAll("localhost", "10.0.2.2")),
                    backgroundDecoration: const BoxDecoration(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: left,
          top: top,
          child: index.value==0?const Center(): Container(
            width: width,
            height: height,
            child: GestureDetector(
              onTap: () {
                index.value--;
              },
              child: Container(
                height: height,
                width: width,
                child: Icon(Icons.arrow_back_ios_outlined,size: fontSize,color: App.primery,),
              ),
            ),
          ),
        ),
        Positioned(
          right: right,
          top: top,
          child: index.value==homeController.gallary.length-1?const Center():
          GestureDetector(
            onTap: () {
              index.value++;
            },
            child: Container(
              height: height,
              width: width,
              child: Icon(Icons.arrow_forward_ios_outlined,size: fontSize,color: App.primery,),
            ),
          ),
        ),
      ],
    );
  }

  extraWidget(BuildContext context) {
    return body(context,MediaQuery.of(context).size.height*0.5 , 50,50, 200, 200,100);
  }
  extra2Widget(BuildContext context) {
    return body(context,MediaQuery.of(context).size.height*0.5 , 50,50, 190, 190,90);
  }
  xlargeWidget(BuildContext context) {
    return body(context,MediaQuery.of(context).size.height*0.5 , 50,50, 150, 150,80);
  }
  xlarge2Widget(BuildContext context) {
    return body(context,MediaQuery.of(context).size.height*0.5 , 50,50, 150, 150,70);
  }
  largeWidget(BuildContext context) {
    return body(context,MediaQuery.of(context).size.height*0.5 , 50,50, 100, 100,50);
  }
  large2Widget(BuildContext context) {
    return body(context,MediaQuery.of(context).size.height*0.5 , 50,50, 100, 100,50);
  }
  bigWidget(BuildContext context) {
    return body(context,MediaQuery.of(context).size.height*0.5 , 10,10, 70, 70,40);
  }

}
