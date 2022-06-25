import 'package:animals/app_localization.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:animals/model/post.dart';
import 'package:animals/view/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_widget/zoom_widget.dart';

class Events extends StatelessWidget {
  Events({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();
  final GlobalKey<ScaffoldState> myKey = GlobalKey();

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
                  child: MediaQuery.of(context).size.width> App.extra ? extraWidget(context) :
                  MediaQuery.of(context).size.width> App.extra2 ? extra2Widget(context) :
                  MediaQuery.of(context).size.width>App.xLarge ? xlargeWidget(context) :
                  MediaQuery.of(context).size.width>App.xLarge2 ? xlarge2Widget(context) :
                  MediaQuery.of(context).size.width>App.larg ? largeWidget(context) :
                  MediaQuery.of(context).size.width>App.larg2 ? large2Widget(context) :
                  bigWidget(context)
                ),
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

  //************************ Extra ************************
  extraWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.13),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(child: Text(App_Localization.of(context).translate("events").toUpperCase(),
                style: const TextStyle(
                    fontFamily: "FOUNDRYGRIDNIK",
                    color: App.primery,fontSize:70,fontWeight: FontWeight.bold),maxLines: 1)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
            child:extraEvents(count:2,ratio:6/4,posts:homeController.events,radius:null,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: null,op: 1),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 50, 23),
        ],
      ),
    );
  }
  extraEvents({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op,}) {
    return SizedBox(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              childAspectRatio: ratio),
          itemCount: posts.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                //todo
              },
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(posts[index]
                                .image!
                                .replaceAll(
                                "localhost", "10.0.2.2")),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      color: App.purple,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posts[index].title!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "POPPINS",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                overflow: TextOverflow.ellipsis
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              posts[index].subTitle!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "POPPINS",
                                  fontSize: 23
                              ),
                            ),
                          ],
                        ),
                      )
                  )
                ],
              ),
            );
          }),
    );}

  //************************ Extra2 ************************
  extra2Widget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.13),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(child: Text(App_Localization.of(context).translate("events").toUpperCase(),
                style: const TextStyle(
                    fontFamily: "FOUNDRYGRIDNIK",
                    color: App.primery,fontSize:65,fontWeight: FontWeight.bold),maxLines: 1)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
            child:extra2Events(count:2,ratio:6/4,posts:homeController.events,radius:null,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: null,op: 1),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 45, 21),
        ],
      ),
    );
  }
  extra2Events({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op,}) {
    return SizedBox(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              childAspectRatio: ratio),
          itemCount: posts.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                //todo
              },
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(posts[index]
                                .image!
                                .replaceAll(
                                "localhost", "10.0.2.2")),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      color: App.purple,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posts[index].title!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "POPPINS",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                  overflow: TextOverflow.ellipsis
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              posts[index].subTitle!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "POPPINS",
                                  fontSize: 21
                              ),
                            ),
                          ],
                        ),
                      )
                  )
                ],
              ),
            );
          }),
    );}

  //************************ xLarge ************************
  xlargeWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.12),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(child: Text(App_Localization.of(context).translate("events").toUpperCase(),
                style: const TextStyle(
                    fontFamily: "FOUNDRYGRIDNIK",
                    color: App.primery,fontSize:60,fontWeight: FontWeight.bold),maxLines: 1)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
            child:xlargeEvents(count:2,ratio:6/4,posts:homeController.events,radius:null,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: null,op: 1),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 40, 19),
        ],
      ),
    );
  }
  xlargeEvents({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              childAspectRatio: ratio),
          itemCount: posts.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
              },
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(posts[index]
                                .image!
                                .replaceAll(
                                "localhost", "10.0.2.2")),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      color: App.purple,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posts[index].title!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "POPPINS",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  overflow: TextOverflow.ellipsis
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              posts[index].subTitle!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "POPPINS",
                                  fontSize: 19
                              ),
                            ),
                          ],
                        ),
                      )
                  )
                ],
              ),
            );
          }),
    );}

  //************************ xLarge2 ************************
  xlarge2Widget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.12),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(child: Text(App_Localization.of(context).translate("events").toUpperCase(),
                style: const TextStyle(
                    fontFamily: "FOUNDRYGRIDNIK",
                    color: App.primery,fontSize:55,fontWeight: FontWeight.bold),maxLines: 1)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
            child:xlarge2Events(count:2,ratio:6/4,posts:homeController.events,radius:null,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: null,op: 1),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 35, 17),
        ],
      ),
    );
  }
  xlarge2Events({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              childAspectRatio: ratio),
          itemCount: posts.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
              },
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(posts[index]
                                .image!
                                .replaceAll(
                                "localhost", "10.0.2.2")),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      color: App.purple,
                      child: Padding(
                        padding: EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posts[index].title!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "POPPINS",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  overflow: TextOverflow.ellipsis
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              posts[index].subTitle!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "POPPINS",
                                  fontSize: 17
                              ),
                            ),
                          ],
                        ),
                      )
                  )
                ],
              ),
            );
          }),
    );}

  //************************ Large ************************
  largeWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.12),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(child: Text(App_Localization.of(context).translate("events").toUpperCase(),
                style: const TextStyle(
                  fontFamily: "FOUNDRYGRIDNIK",
                    color: App.primery,fontSize:45,fontWeight: FontWeight.bold),maxLines: 1)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
            child:largeEvents(count:2,ratio:6/4,posts:homeController.events,radius:null,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: null,op: 1),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 30, 15),
        ],
      ),
    );
  }
  largeEvents({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              childAspectRatio: ratio),
          itemCount: posts.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
              },
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(posts[index]
                                .image!
                                .replaceAll(
                                "localhost", "10.0.2.2")),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      color: App.purple,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posts[index].title!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "POPPINS",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  overflow: TextOverflow.ellipsis
                              ),
                            ),
                            Text(
                              posts[index].subTitle!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "POPPINS",
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      )
                  )
                ],
              ),
            );
          }),
    );}

  //************************ Large2 ************************
  large2Widget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.13),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(child: Text(App_Localization.of(context).translate("events").toUpperCase(),
                style: const TextStyle(
                    fontFamily: "FOUNDRYGRIDNIK",
                    color: App.primery,fontSize:35,fontWeight: FontWeight.bold),maxLines: 1)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
            child:large2Events(count:2,ratio:6/4,posts:homeController.events,radius:null,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: null,op: 1),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 25, 12),
        ],
      ),
    );
  }
  large2Events({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              childAspectRatio: ratio),
          itemCount: posts.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
              },
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(posts[index]
                                .image!
                                .replaceAll(
                                "localhost", "10.0.2.2")),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      color: App.purple,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posts[index].title!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "POPPINS",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis
                              ),
                            ),
                            Text(
                              posts[index].subTitle!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "POPPINS",
                                  fontSize: 12
                              ),
                            ),
                          ],
                        ),
                      )
                  )
                ],
              ),
            );
          }),
    );}

  //************************ Big ************************
  bigWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.15),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(child: Text(App_Localization.of(context).translate("events").toUpperCase(),
                style: const TextStyle(
                  fontFamily: "FOUNDRYGRIDNIK",
                    color: App.primery,fontSize:30,fontWeight: FontWeight.bold),maxLines: 1)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
            child:bigEvents(count:2,ratio: 1.4,posts:homeController.events,radius:null,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: null,op: 1),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 20, 10),
        ],
      ),
    );
  }
  bigEvents({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: ratio),
          itemCount: posts.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                //todo
              },
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(posts[index]
                                .image!
                                .replaceAll(
                                "localhost", "10.0.2.2")),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      color: App.purple,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posts[index].title!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "POPPINS",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  overflow: TextOverflow.ellipsis
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              posts[index].subTitle!,
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10
                              ),
                            ),
                          ],
                        ),
                      )
                  )
                ],
              ),
            );
          }),
    );}
}
