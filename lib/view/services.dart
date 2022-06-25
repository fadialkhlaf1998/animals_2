import 'package:animals/helper/app.dart';
import 'package:animals/model/post.dart';
import 'package:animals/view/header.dart';
import 'package:animals/view/on_hover.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animals/app_localization.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:zoom_widget/zoom_widget.dart';

class Services extends StatelessWidget {
  Services({Key? key}) : super(key: key);

  final HomeController homeController = Get.find();
  final GlobalKey<ScaffoldState> myKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      key: myKey,
      body: RefreshIndicator(
        onRefresh: () async {
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
                    child: MediaQuery.of(context).size.width>App.extra ? extraWidget(context):
                    MediaQuery.of(context).size.width>App.extra2 ? extra2Widget(context):
                    MediaQuery.of(context).size.width>App.xLarge ? xlargeWidget(context):
                    MediaQuery.of(context).size.width>App.xLarge2 ? xlarge2Widget(context):
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

  //************************ Extra ************************
  extraWidget(BuildContext context){
    return SingleChildScrollView(
      controller: homeController.scrollController,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.13),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(child: Text(App_Localization.of(context).translate("services").toUpperCase(),
                            style: TextStyle(
                                color: App.primery,
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                                fontFamily: "FOUNDRYGRIDNIK"
                            ))),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.08),
                  child:extraService(count:1,ratio:1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.13,radius:60,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 60,op: 1),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          extraDescription(context,homeController.selectedServices.value),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          App.footer(context,homeController),
          App.copyrights(context, 50, 23),
        ],
      ),
    );
  }
  extraService({required int count, required double ratio, required List<Post> posts,required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      height: height,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: ratio),
          scrollDirection: Axis.horizontal,
          itemCount: posts.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                homeController.btmNavBarIndex.value = 2;
                homeController.selectedServices.value = index;
                Future.delayed(Duration(milliseconds: 500)).then((value) {
                  homeController.scrollDown();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: background,
                  boxShadow: [shadow ? App.boxShadow : App.noShadow],
                  borderRadius:
                  radius == null ? null : BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius)),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: img_radius == null
                                ? null
                                : BorderRadius.only(
                                topLeft: Radius.circular(radius!),
                                topRight: Radius.circular(radius)),
                            image: DecorationImage(
                                image: NetworkImage(posts[index]
                                    .image!
                                    .replaceAll(
                                    "localhost", "10.0.2.2")),
                                fit: BoxFit.cover)),
                        child: Align(
                          alignment: AlignmentDirectional.bottomStart,
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.25,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                              child: Text(
                                posts[index].title!,
                                style: TextStyle(
                                    fontFamily: "POPPINS",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
  extraDescription(BuildContext context,int index){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.width * 0.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration:BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(homeController.service[index].image!),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.topRight,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(homeController.service[index].title.toString(),
                          style: TextStyle(
                            fontFamily: "FOUNDRYGRIDNIK",
                            fontWeight: FontWeight.bold,
                            color: App.blue,
                            fontSize: 70,
                          ),maxLines: 2,)
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Text(homeController.service[index].stringDescription.toString(),
                        style: TextStyle(
                            fontFamily: "POPPINS",
                            fontSize: 23,
                            color: Colors.black.withOpacity(0.8)),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              homeController.btmNavBarIndex.value = 6;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.14,
                              decoration: BoxDecoration(
                                  color: App.primery,
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.1)
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(App_Localization.of(context).translate("book_an_assessment"),style:TextStyle(
                                      color: Colors.white ,
                                      fontFamily: "POPPINS",
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),),
                                ),
                              ) ,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //************************ Extra2 ************************
  extra2Widget(BuildContext context){
    return SingleChildScrollView(
      controller: homeController.scrollController,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.13),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(child: Text(App_Localization.of(context).translate("services").toUpperCase(),
                            style: TextStyle(
                                color: App.primery,
                                fontSize: 65,
                                fontWeight: FontWeight.bold,
                                fontFamily: "FOUNDRYGRIDNIK"
                            ))),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.08),
                  child:extra2Service(count:1,ratio:1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.13,radius:60,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 60,op: 1),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          extra2Description(context,homeController.selectedServices.value),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          App.footer(context,homeController),
          App.copyrights(context, 45, 21),
        ],
      ),
    );
  }
  extra2Service({required int count, required double ratio, required List<Post> posts,required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      height: height,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: ratio),
          scrollDirection: Axis.horizontal,
          itemCount: posts.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                homeController.btmNavBarIndex.value = 2;
                homeController.selectedServices.value = index;
                Future.delayed(Duration(milliseconds: 500)).then((value) {
                  homeController.scrollDown();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: background,
                  boxShadow: [shadow ? App.boxShadow : App.noShadow],
                  borderRadius:
                  radius == null ? null : BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius)),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: img_radius == null
                                ? null
                                : BorderRadius.only(
                                topLeft: Radius.circular(radius!),
                                topRight: Radius.circular(radius)),
                            image: DecorationImage(
                                image: NetworkImage(posts[index]
                                    .image!
                                    .replaceAll(
                                    "localhost", "10.0.2.2")),
                                fit: BoxFit.cover)),
                        child: Align(
                          alignment: AlignmentDirectional.bottomStart,
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.25,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                              child: Text(
                                posts[index].title!,
                                style: TextStyle(
                                    fontFamily: "POPPINS",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
  extra2Description(BuildContext context,int index){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.width * 0.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration:BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(homeController.service[index].image!),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.topRight,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(homeController.service[index].title.toString(),
                          style: TextStyle(
                            fontFamily: "FOUNDRYGRIDNIK",
                            fontWeight: FontWeight.bold,
                            color: App.blue,
                            fontSize: 65,
                          ),maxLines: 2,)
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Text(homeController.service[index].stringDescription.toString(),
                        style: TextStyle(
                            fontFamily: "POPPINS",
                            fontSize: 21,
                            color: Colors.black.withOpacity(0.8)),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              homeController.btmNavBarIndex.value = 6;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.14,
                              decoration: BoxDecoration(
                                  color: App.primery,
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.1)
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Text(App_Localization.of(context).translate("book_an_assessment"),style:TextStyle(
                                      color: Colors.white ,
                                      fontFamily: "POPPINS",
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold),),
                                ),
                              ) ,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //************************ xLarge ************************
  xlargeWidget(BuildContext context){
    return SingleChildScrollView(
      controller: homeController.scrollController,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.12),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(child: Text(App_Localization.of(context).translate("services").toUpperCase(),
                            style: TextStyle(
                                color: App.primery,
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                fontFamily: "FOUNDRYGRIDNIK"
                            ))),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.08),
                  child: xLargeService(count:1,ratio:1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.13,radius:60,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 60,op: 1),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          xlargDescription(context,homeController.selectedServices.value),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          App.footer(context,homeController),
          App.copyrights(context, 40, 19),
        ],
      ),
    );
  }
  xLargeService({required int count, required double ratio, required List<Post> posts, required double height ,required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      height: height,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: ratio),
          itemCount: posts.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                homeController.btmNavBarIndex.value = 2;
                homeController.selectedServices.value = index;
                Future.delayed(Duration(milliseconds: 500)).then((value) {
                  homeController.scrollDown();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: background,
                  boxShadow: [shadow ? App.boxShadow : App.noShadow],
                  borderRadius:
                  radius == null ? null : BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius)),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: img_radius == null
                                ? null
                                : BorderRadius.only(
                                topLeft: Radius.circular(radius!),
                                topRight: Radius.circular(radius)),
                            image: DecorationImage(
                                image: NetworkImage(posts[index]
                                    .image!
                                    .replaceAll(
                                    "localhost", "10.0.2.2")),
                                fit: BoxFit.cover)),
                        child: Align(
                          alignment: AlignmentDirectional.bottomStart,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Text(
                                posts[index].title!,
                                style: TextStyle(
                                    fontFamily: "POPPINS",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
  xlargDescription(BuildContext context,int index){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.width * 0.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration:BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(homeController.service[index].image!),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.topRight,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(homeController.service[index].title.toString(),
                          style: TextStyle(
                            fontFamily: "FOUNDRYGRIDNIK",
                            fontWeight: FontWeight.bold,
                            color: App.blue,
                            fontSize: 60,
                          ),maxLines: 2,)
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Text(homeController.service[index].stringDescription.toString(),
                        style: TextStyle(
                            fontFamily: "POPPINS",
                            fontSize: 19,
                            color: Colors.black.withOpacity(0.8)),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              homeController.btmNavBarIndex.value = 6;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.14,
                              decoration: BoxDecoration(
                                  color: App.primery,
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.1)
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(13),
                                  child: Text(App_Localization.of(context).translate("book_an_assessment"),style:TextStyle(
                                      color: Colors.white ,
                                      fontFamily: "POPPINS",
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),),
                                ),
                              ) ,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //************************ xLarge2 ************************
  xlarge2Widget(BuildContext context){
    return SingleChildScrollView(
      controller: homeController.scrollController,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.12),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(child: Text(App_Localization.of(context).translate("services").toUpperCase(),
                            style: TextStyle(
                                color: App.primery,
                                fontSize: 55,
                                fontWeight: FontWeight.bold,
                                fontFamily: "FOUNDRYGRIDNIK"
                            ))),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.08),
                  child:xLarge2Service(count:1,ratio:1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.13,radius:60,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 60,op: 1),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          xlarg2Description(context,homeController.selectedServices.value),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          App.footer(context,homeController),
          App.copyrights(context, 35, 17),
        ],
      ),
    );
  }
  xLarge2Service({required int count, required double ratio, required List<Post> posts, required double height ,required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      height: height,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: ratio),
          itemCount: posts.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                homeController.btmNavBarIndex.value = 2;
                homeController.selectedServices.value = index;
                Future.delayed(Duration(milliseconds: 500)).then((value) {
                  homeController.scrollDown();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: background,
                  boxShadow: [shadow ? App.boxShadow : App.noShadow],
                  borderRadius:
                  radius == null ? null : BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius)),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: img_radius == null
                                ? null
                                : BorderRadius.only(
                                topLeft: Radius.circular(radius!),
                                topRight: Radius.circular(radius)),
                            image: DecorationImage(
                                image: NetworkImage(posts[index]
                                    .image!
                                    .replaceAll(
                                    "localhost", "10.0.2.2")),
                                fit: BoxFit.cover)),
                        child: Align(
                          alignment: AlignmentDirectional.bottomStart,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Text(
                                posts[index].title!,
                                style: TextStyle(
                                    fontFamily: "POPPINS",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
  xlarg2Description(BuildContext context,int index){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.width * 0.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration:BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(homeController.service[index].image!),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.topRight,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(homeController.service[index].title.toString(),
                          style: TextStyle(
                            fontFamily: "FOUNDRYGRIDNIK",
                            fontWeight: FontWeight.bold,
                            color: App.blue,
                            fontSize: 55,
                          ),maxLines: 2,)
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Text(homeController.service[index].stringDescription.toString(),
                        style: TextStyle(
                            fontFamily: "POPPINS",
                            fontSize: 17,
                            color: Colors.black.withOpacity(0.8)),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              homeController.btmNavBarIndex.value = 6;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.14,
                              decoration: BoxDecoration(
                                  color: App.primery,
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.1)
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(App_Localization.of(context).translate("book_an_assessment"),style:TextStyle(
                                      color: Colors.white ,
                                      fontFamily: "POPPINS",
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),),
                                ),
                              ) ,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //************************ Large ************************
  largeWidget(BuildContext context){
    return SingleChildScrollView(
      controller: homeController.scrollController,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.12),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(child: Text(App_Localization.of(context).translate("services").toUpperCase(),
                            style: TextStyle(
                                color: App.primery,
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                                fontFamily: "FOUNDRYGRIDNIK"
                            ))),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                  child:largService(count:1,ratio: 1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.13,radius:50,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 50,op: 1),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          largDescription(context,homeController.selectedServices.value),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          App.footer(context,homeController),
          App.copyrights(context,30, 15)
        ],
      ),
    );
  }
  largService({required int count, required double ratio, required List<Post> posts,required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      height: height,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: ratio),
          itemCount: posts.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                homeController.btmNavBarIndex.value = 2;
                homeController.selectedServices.value = index;
                Future.delayed(Duration(milliseconds: 500)).then((value) {
                  homeController.scrollDown();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: background,
                  boxShadow: [shadow ? App.boxShadow : App.noShadow],
                  borderRadius:
                  radius == null ? null : BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius)),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: img_radius == null
                                ? null
                                : BorderRadius.only(
                                topLeft: Radius.circular(radius!),
                                topRight: Radius.circular(radius)),
                            image: DecorationImage(
                                image: NetworkImage(posts[index]
                                    .image!
                                    .replaceAll(
                                    "localhost", "10.0.2.2")),
                                fit: BoxFit.cover)),
                        child: Align(
                          alignment: AlignmentDirectional.bottomStart,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                              child: Text(
                                posts[index].title!,
                                style: TextStyle(
                                    fontFamily: "POPPINS",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );}
  largDescription(BuildContext context,int index){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.width * 0.35,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration:BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(homeController.service[index].image!),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(homeController.service[index].title.toString(),
                        style: TextStyle(
                          fontFamily: "FOUNDRYGRIDNIK",
                          fontWeight: FontWeight.bold,
                          color: App.blue,
                          fontSize: 45,
                        ),maxLines: 2,)
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Text(homeController.service[index].stringDescription.toString(),
                        style: TextStyle(
                          fontFamily: "POPPINS",
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.8)),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              homeController.btmNavBarIndex.value = 6;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              decoration: BoxDecoration(
                                  color: App.primery,
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.1)
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(App_Localization.of(context).translate("book_an_assessment"),style:TextStyle(
                                      color: Colors.white ,
                                      fontFamily: "POPPINS",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),),
                                ),
                              ) ,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //************************ Large2 ************************
  large2Widget(BuildContext context){
    return SingleChildScrollView(
      controller: homeController.scrollController,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.13),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(child: Text(App_Localization.of(context).translate("services").toUpperCase(),
                            style: TextStyle(
                                color: App.primery,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                fontFamily: "FOUNDRYGRIDNIK"
                            ))),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                  child:larg2Service(count:1,ratio: 1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.13,radius:35,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 35,op: 1),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          larg2Description(context,homeController.selectedServices.value),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          App.footer(context,homeController),
          App.copyrights(context,25, 12)
        ],
      ),
    );
  }
  larg2Service({required int count, required double ratio, required List<Post> posts,required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      height: height,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: ratio),
          itemCount: posts.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                homeController.btmNavBarIndex.value = 2;
                homeController.selectedServices.value = index;
                Future.delayed(Duration(milliseconds: 500)).then((value) {
                  homeController.scrollDown();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: background,
                  boxShadow: [shadow ? App.boxShadow : App.noShadow],
                  borderRadius:
                  radius == null ? null : BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius)),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: img_radius == null
                                ? null
                                : BorderRadius.only(
                                topLeft: Radius.circular(radius!),
                                topRight: Radius.circular(radius)),
                            image: DecorationImage(
                                image: NetworkImage(posts[index]
                                    .image!
                                    .replaceAll(
                                    "localhost", "10.0.2.2")),
                                fit: BoxFit.cover)),
                        child: Align(
                          alignment: AlignmentDirectional.bottomStart,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                              child: Text(
                                posts[index].title!,
                                style: TextStyle(
                                    fontFamily: "POPPINS",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );}
  larg2Description(BuildContext context,int index){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.width * 0.35,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration:BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(homeController.service[index].image!),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.topRight,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(homeController.service[index].title.toString(),
                          style: TextStyle(
                            fontFamily: "FOUNDRYGRIDNIK",
                            fontWeight: FontWeight.bold,
                            color: App.blue,
                            fontSize: 40,
                          ),maxLines: 2,)
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Text(homeController.service[index].stringDescription.toString(),
                        style: TextStyle(
                            fontFamily: "POPPINS",
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.8)),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              homeController.btmNavBarIndex.value = 6;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.18,
                              decoration: BoxDecoration(
                                  color: App.primery,
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.1)
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(11),
                                  child: Text(App_Localization.of(context).translate("book_an_assessment"),style:TextStyle(
                                      color: Colors.white ,
                                      fontFamily: "POPPINS",
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),),
                                ),
                              ) ,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //************************ Big ************************
  bigWidget(BuildContext context){
    return SingleChildScrollView(
      controller: homeController.scrollController,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.15),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(child: Text(App_Localization.of(context).translate("services").toUpperCase(),
                            style: const TextStyle(
                                color: App.primery,
                                fontFamily: "FOUNDRYGRIDNIK",
                                fontSize: 30,fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.02),
                  child:bigService(count:1,ratio:1,posts:homeController.service, height: MediaQuery.of(context).size.width*0.14,radius:25,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 25,op: 1),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          bigDescription(context,homeController.selectedServices.value),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          App.footer(context,homeController),
          App.copyrights(context,20, 10)
        ],
      ),
    );
  }
  bigService({required int count, required double ratio, required List<Post> posts,required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      height: height,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: ratio),
          scrollDirection: Axis.horizontal,
          itemCount: posts.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                homeController.btmNavBarIndex.value = 2;
                homeController.selectedServices.value = index;
                Future.delayed(Duration(milliseconds: 500)).then((value) {
                  homeController.scrollDown();
                });
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(
                  color: background,
                  boxShadow: [shadow ? App.boxShadow : App.noShadow],
                  borderRadius:
                  radius == null ? null : BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    topRight: Radius.circular(radius),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: img_radius == null
                                    ? null
                                    : BorderRadius.only(
                                    topLeft: Radius.circular(radius!),
                                    topRight: Radius.circular(radius)
                                ),
                                shape: circle
                                    ? BoxShape.circle
                                    : BoxShape.rectangle,
                                image: DecorationImage(
                                    image: NetworkImage(posts[index]
                                        .image!
                                        .replaceAll(
                                        "localhost", "10.0.2.2")),
                                    fit: BoxFit.cover)),
                            child: Align(
                              alignment: AlignmentDirectional.bottomStart,
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.25,
                                // color:  posts[index].color,
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 5,vertical:
                                  MediaQuery.of(context).size.width > 830 ? 3 : 1),
                                  child: Text(
                                    posts[index].title!,
                                    style: const TextStyle(
                                        fontFamily: "POPPINS",
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,fontSize: 10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            );
          }),
    );
  }
  bigDescription(BuildContext context,int index){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.width * 0.45,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration:BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(homeController.service[index].image!),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Text(homeController.service[index].title.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: App.blue,
                              fontFamily: "FOUNDRYGRIDNIK",
                              fontSize: 25,
                            ),maxLines: 2,)
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Text(homeController.service[index].stringDescription.toString(),
                        style: TextStyle(
                            fontFamily: "POPPINS",
                            fontSize: 10,color: Colors.black.withOpacity(0.8)),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              homeController.btmNavBarIndex.value = 6;
                            },
                            child: Container(
                                width:  MediaQuery.of(context).size.width * 0.2,
                                decoration: BoxDecoration(
                                    color: App.primery,
                                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.1)
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(App_Localization.of(context).translate("book_an_assessment"),
                                      style: const TextStyle(
                                          fontFamily: "POPPINS",
                                          color: Colors.white ,fontSize: 10,fontWeight: FontWeight.bold
                                      ),),
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
