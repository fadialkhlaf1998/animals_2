import 'package:animals/controller/home_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:animals/view/header.dart';
import 'package:animals/view/image_show.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_widget/zoom_widget.dart';

class Gallery extends StatelessWidget {
  final HomeController homeController = Get.find();
  final GlobalKey<ScaffoldState> myKey = GlobalKey();

  Gallery({Key? key}) : super(key: key);

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
                  MediaQuery.of(context).size.width>App.xLarge ? xLargeWidget(context) :
                  MediaQuery.of(context).size.width>App.xLarge2 ? xLarge2Widget(context) :
                  MediaQuery.of(context).size.width>App.larg ? largeWidget(context) :
                  MediaQuery.of(context).size.width>App.larg2 ? larg2Widget(context) : bigWidget(context)
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
    );
  }

  extraWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.13),
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 6/4
                ),
                scrollDirection: Axis.vertical,
                itemCount: homeController.gallary.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Get.to(()=>ImageShow(index.obs));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    homeController.gallary[index].image!
                                ),
                                fit: BoxFit.cover)),
                      )
                  );
                }),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 50, 23),
        ],
      ),
    );
  }
  extra2Widget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.13),
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 6/4
                ),
                scrollDirection: Axis.vertical,
                itemCount: homeController.gallary.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Get.to(()=>ImageShow(index.obs));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    homeController.gallary[index].image!
                                ),
                                fit: BoxFit.cover)),
                      )
                  );
                }),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 45, 21),
        ],
      ),
    );
  }
  xLargeWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.12),
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 6/4
                ),
                scrollDirection: Axis.vertical,
                itemCount: homeController.gallary.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Get.to(()=>ImageShow(index.obs));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    homeController.gallary[index].image!
                                ),
                                fit: BoxFit.cover)),
                      )
                  );
                }),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 40, 19),
        ],
      ),
    );
  }
  xLarge2Widget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.12),
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 6/4
                ),
                scrollDirection: Axis.vertical,
                itemCount: homeController.gallary.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Get.to(()=>ImageShow(index.obs));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    homeController.gallary[index].image!
                                ),
                                fit: BoxFit.cover)),
                      )
                  );
                }),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 35, 17),
        ],
      ),
    );
  }
  largeWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.12),
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 6/4
                ),
                scrollDirection: Axis.vertical,
                itemCount: homeController.gallary.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(()=>ImageShow(index.obs));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                homeController.gallary[index].image!
                              ),
                              fit: BoxFit.cover)),
                    )
                  );
                }),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 30, 15),
        ],
      ),
    );
  }
  larg2Widget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.13),
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 6/4
                ),
                scrollDirection: Axis.vertical,
                itemCount: homeController.gallary.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Get.to(()=>ImageShow(index.obs));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    homeController.gallary[index].image!
                                ),
                                fit: BoxFit.cover)),
                      )
                  );
                }),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 25, 12),
        ],
      ),
    );
  }
  bigWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox( height: MediaQuery.of(context).size.width * 0.15),
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 6/4
                ),
                scrollDirection: Axis.vertical,
                itemCount: homeController.gallary.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Get.to(()=>ImageShow(index.obs));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    homeController.gallary[index].image!
                                ),
                                fit: BoxFit.cover)),
                      )
                  );
                }),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 20, 10),
        ],
      ),
    );
  }

}