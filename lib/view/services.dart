import 'package:animals/helper/app.dart';
import 'package:animals/model/post.dart';
import 'package:animals/view/book_assessment.dart';
import 'package:animals/view/onHoverTransform.dart';
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
                    child:MediaQuery.of(context).size.width>App.larg ? largeWidget(context)
                        : MediaQuery.of(context).size.width>App.big ? bigWidget(context)
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.3,
                        height: MediaQuery.of(context).size.height*0.2,
                        child: Center(child: Text(App_Localization.of(context).translate("services").toUpperCase(),
                            style: TextStyle(
                                color: App.primery,
                                fontFamily: "FOUNDRYGRIDNIK",
                                fontSize:40,
                                fontWeight: FontWeight.bold),maxLines: 1)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                  child:largeService(count:1,ratio:1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.2,radius:50,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 50,op: 1),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          largDescription(context,homeController.selectedServices.value),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
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
                        fontSize: App.largeFontSize(MediaQuery.of(context).size.width)
                    )),
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
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
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
              child: OnHoverTransform(builder:(inHovered) {
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
                                        color: homeController.selectedServices.value == index ? App.primery :
                                        inHovered ? App.primery : Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: App.largeFontSize(MediaQuery.of(context).size.width)
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
      height:  MediaQuery.of(context).size.width * 0.3,
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
                          fontSize: 35,
                        ),maxLines: 2,)
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Text(homeController.service[index].stringDescription.toString(),
                        style: TextStyle(
                          fontFamily: "POPPINS",
                        fontSize: App.largeFontSize(MediaQuery.of(context).size.width),
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
                              homeController.btmNavBarIndex.value = 7;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              decoration: BoxDecoration(
                                  color: App.primery,
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.1)
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(App_Localization.of(context).translate("book_now"),style:TextStyle(
                                      color: Colors.white,
                                      fontSize: App.largeFontSize(MediaQuery.of(context).size.width),
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
          SizedBox(height: MediaQuery.of(context).size.width*0.12),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.3,
                        height: MediaQuery.of(context).size.height*0.2,
                        child: Center(child: Text(App_Localization.of(context).translate("services").toUpperCase(),
                            style: const TextStyle(color: App.primery,
                                fontSize:35,
                                fontFamily: "FOUNDRYGRIDNIK",
                                fontWeight: FontWeight.bold),maxLines: 1)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                  child:bigService(count:1,ratio:1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.2,radius:50,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 50,op: 1),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.08),
          bigDescription(context,homeController.selectedServices.value),
          SizedBox(height: MediaQuery.of(context).size.width * 0.08),
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
              child: OnHoverTransform(builder:(inHovered) {
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
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    posts[index].title!,
                                    style: TextStyle(
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
      height:  MediaQuery.of(context).size.width * 0.3,
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
                              homeController.btmNavBarIndex.value = 7;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              decoration: BoxDecoration(
                                  color: App.primery,
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.1)
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(App_Localization.of(context).translate("book_now"),style:TextStyle(
                                      color: Colors.white,
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

  //************************ Medium ************************
  medWidget(BuildContext context){
    return SingleChildScrollView(
      controller: homeController.scrollController,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.14),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.3,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Center(child: Text(App_Localization.of(context).translate("services").toUpperCase(),
                            style: const TextStyle(
                                color: App.primery,
                                fontFamily: "FOUNDRYGRIDNIK",
                                fontSize:25,
                                fontWeight: FontWeight.bold),maxLines: 1)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                  child:medService(count:1,ratio:1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.2,radius:40,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 40,op: 1),
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
              child: OnHoverTransform(builder:(inHovered) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      // border: Border.all(color: homeController.selectedServices.value == index ?
                      // App.primery : Colors.grey,width: 1),
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
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    posts[index].title!,
                                    style: TextStyle(
                                        color: homeController.selectedServices.value == index ? App.primery :
                                        inHovered ? App.primery : Colors.white,
                                        fontWeight: FontWeight.bold,fontSize: 10),
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
      height:  MediaQuery.of(context).size.width * 0.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Expanded(
              child: Container(
                // height:  MediaQuery.of(context).size.width * 0.4,
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
                              homeController.btmNavBarIndex.value = 7;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.12,
                              decoration: BoxDecoration(
                                  color: App.primery,
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.1)
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(App_Localization.of(context).translate("book_now"),style:TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
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
}
