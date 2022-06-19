import 'package:animals/helper/app.dart';
import 'package:animals/model/post.dart';
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
                    MediaQuery.of(context).size.width>App.xLarge ? xlargeWidget(context):
                    MediaQuery.of(context).size.width>App.larg ? largeWidget(context)
                        : MediaQuery.of(context).size.width> App.big ? bigWidget(context)
                        : medWidget(context)
                ),
                Positioned(child: App.header(context, homeController,myKey)),
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
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.2,
                  child: Center(child: Text(App_Localization.of(context).translate("services").toUpperCase(),
                      style: TextStyle(
                          color: App.primery,
                          fontFamily: "FOUNDRYGRIDNIK",
                          fontSize:70,
                          fontWeight: FontWeight.bold),maxLines: 1)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                  child: extraService(count:1,ratio: 1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.13,radius:50,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 50,op: 1),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          extraDescription(context,homeController.selectedServices.value),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
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
  extraService({required int count, required double ratio, required double height,required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      height: height,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: ratio),
          itemCount: posts.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                homeController.selectedServices.value = index;
                homeController.scrollDown();
              },
              child: OnHover(builder:(inHovered) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
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
                                // color:  posts[index].color,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    posts[index].title!,
                                    style: TextStyle(
                                        fontFamily: "POPPINS",
                                        color: homeController.selectedServices.value == index ? App.primery :
                                        inHovered ? App.primery : Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25
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
                            fontSize: 60,
                          ),maxLines: 2,)
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Text(homeController.service[index].stringDescription.toString(),
                        style: TextStyle(
                            fontFamily: "POPPINS",
                            fontSize: 25,
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
                                      fontSize: 25,
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
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.2,
                  child: Center(child: Text(App_Localization.of(context).translate("services").toUpperCase(),
                      style: TextStyle(
                          color: App.primery,
                          fontFamily: "FOUNDRYGRIDNIK",
                          fontSize:60,
                          fontWeight: FontWeight.bold),maxLines: 1)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                  child: xlargeService(count:1,ratio: 1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.14,radius:50,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 50,op: 1),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          xlargDescription(context,homeController.selectedServices.value),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
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
  xlargeService({required int count, required double ratio, required double height,required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      height: height,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: ratio),
          itemCount: posts.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                homeController.selectedServices.value = index;
                homeController.scrollDown();
              },
              child: OnHover(builder:(inHovered) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
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
                                // color:  posts[index].color,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    posts[index].title!,
                                    style: TextStyle(
                                        fontFamily: "POPPINS",
                                        color: homeController.selectedServices.value == index ? App.primery :
                                        inHovered ? App.primery : Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
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
                            fontSize: 50,
                          ),maxLines: 2,)
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Text(homeController.service[index].stringDescription.toString(),
                        style: TextStyle(
                            fontFamily: "POPPINS",
                            fontSize: 20,
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
                                      fontSize: 20,
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
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.2,
                  child: Center(child: Text(App_Localization.of(context).translate("services").toUpperCase(),
                      style: TextStyle(
                          color: App.primery,
                          fontFamily: "FOUNDRYGRIDNIK",
                          fontSize:50,
                          fontWeight: FontWeight.bold),maxLines: 1)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                  child:largeService(count:1,ratio:1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.13,radius:40,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 40,op: 1),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          largDescription(context,homeController.selectedServices.value),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
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
  largeService({required int count, required double ratio, required double height,required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      height: height,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: ratio),
          itemCount: posts.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                homeController.selectedServices.value = index;
                homeController.scrollDown();
              },
              child: OnHover(builder:(inHovered) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
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
                                // color:  posts[index].color,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                  child: Text(
                                    posts[index].title!,
                                    style: TextStyle(
                                        fontFamily: "POPPINS",
                                        color: homeController.selectedServices.value == index ? App.primery :
                                        inHovered ? App.primery : Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
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
          }),
    );
  }
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
                          fontSize: 40,
                        ),maxLines: 2,)
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Text(homeController.service[index].stringDescription.toString(),
                        style: TextStyle(
                          fontFamily: "POPPINS",
                        fontSize: 16,
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
                                  padding: const EdgeInsets.all(10),
                                  child: Text(App_Localization.of(context).translate("book_an_assessment"),style:TextStyle(
                                      color: Colors.white ,
                                      fontFamily: "POPPINS",
                                      fontSize: 16,
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
          SizedBox(height: MediaQuery.of(context).size.width*0.13),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.2,
                  child: Center(child: Text(App_Localization.of(context).translate("services").toUpperCase(),
                      style: const TextStyle(color: App.primery,
                          fontSize:35,
                          fontFamily: "FOUNDRYGRIDNIK",
                          fontWeight: FontWeight.bold),maxLines: 1)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                  child:bigService(count:1,ratio:1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.14,radius:30,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 40,op: 1),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          bigDescription(context,homeController.selectedServices.value),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
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
  bigService({required int count, required double ratio,required double height, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      height: height,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: ratio),
          itemCount: posts.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                homeController.selectedServices.value = index;
                homeController.scrollDown();
              },
              child: OnHover(builder:(inHovered) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
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
                                // color:  posts[index].color,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5,
                                  vertical: MediaQuery.of(context).size.width > 1300 ? 10 : 5),
                                  child: Text(
                                    posts[index].title!,
                                    style: TextStyle(
                                        fontFamily: "POPPINS",
                                        color: homeController.selectedServices.value == index ? App.primery :
                                        inHovered ? App.primery : Colors.white,
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
            );
          }),
    );
  }
  bigDescription(BuildContext context,int index){
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Text(homeController.service[index].title.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: App.blue,
                              fontFamily: "FOUNDRYGRIDNIK",
                              fontSize: 30,
                            ),maxLines: 2,)
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Text(homeController.service[index].stringDescription.toString(),
                        style: TextStyle(
                            fontFamily: "POPPINS",
                            fontSize: 12,color: Colors.black.withOpacity(0.8)),
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
                                width: MediaQuery.of(context).size.width * 0.16,
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
                                          color: Colors.white ,fontSize: 12,fontWeight: FontWeight.bold
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

  //************************ Medium ************************
  medWidget(BuildContext context){
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
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Center(child: Text(App_Localization.of(context).translate("services").toUpperCase(),
                      style: const TextStyle(
                          color: App.primery,
                          fontFamily: "FOUNDRYGRIDNIK",
                          fontSize:25,
                          fontWeight: FontWeight.bold),maxLines: 1)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                  child:medService(count:1,ratio:1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.13,radius:25,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 25,op: 1),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          medDescription(context,homeController.selectedServices.value),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
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
  medService({required int count, required double ratio,required double height, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      height: height,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: ratio),
          itemCount: posts.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                homeController.selectedServices.value = index;
                homeController.scrollDown();
              },
              child: OnHover(builder:(inHovered) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
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
                                // color:  posts[index].color,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5,
                                      vertical: MediaQuery.of(context).size.width > 800 ? 4 : 2),
                                  child: Text(
                                    posts[index].title!,
                                    style: TextStyle(
                                        fontFamily: "POPPINS",
                                        color: homeController.selectedServices.value == index ? App.primery :
                                        inHovered ? App.primery : Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 8),
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
          }),
    );
  }
  medDescription(BuildContext context,int index){
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
                              fontSize: 20,
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
                                  padding: const EdgeInsets.all(6),
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
