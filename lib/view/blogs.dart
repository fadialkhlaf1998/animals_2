import 'package:animals/app_localization.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:animals/model/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_widget/zoom_widget.dart';

class Blogs extends StatelessWidget {
  Blogs({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();
  final GlobalKey<ScaffoldState> myKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child:  MediaQuery.of(context).size.width> App.extra ? extraWidget(context) :
                    MediaQuery.of(context).size.width>App.xLarge ? xlargeWidget(context) :
                    MediaQuery.of(context).size.width>App.larg ? largeWidget(context)
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
    );
  }
  //************************ Large ************************
  extraWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.13),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(child: Text(App_Localization.of(context).translate("blog").toUpperCase(),
                style: const TextStyle(
                    fontFamily: "FOUNDRYGRIDNIK",
                    color: App.primery,fontSize:70,fontWeight: FontWeight.bold),maxLines: 1)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
            child:extraBlogs(count:2,ratio:6/4,posts:homeController.blogs,radius:null,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: null,op: 1),
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
  extraBlogs({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
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
                                  fontSize: 25
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              posts[index].subTitle!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "POPPINS",
                                  fontSize: 25
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
  xlargeWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.12),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(child: Text(App_Localization.of(context).translate("blog").toUpperCase(),
                style: const TextStyle(
                    fontFamily: "FOUNDRYGRIDNIK",
                    color: App.primery,fontSize:60,fontWeight: FontWeight.bold),maxLines: 1)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
            child:xlargeBlogs(count:2,ratio:6/4,posts:homeController.blogs,radius:null,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: null,op: 1),
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
  xlargeBlogs({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
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
                                  fontSize: 20
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              posts[index].subTitle!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "POPPINS",
                                  fontSize: 20
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
            child: Center(child: Text(App_Localization.of(context).translate("blog").toUpperCase(),
                style: const TextStyle(
                    fontFamily: "FOUNDRYGRIDNIK",
                    color: App.primery,fontSize:50,fontWeight: FontWeight.bold),maxLines: 1)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
            child:largeBlogs(count:2,ratio:6/4,posts:homeController.blogs,radius:null,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: null,op: 1),
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
  largeBlogs({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
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
                                  fontSize: 16
                              ),
                            ),
                            Text(
                              posts[index].subTitle!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "POPPINS",
                                  fontSize: 16
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
          SizedBox(height: MediaQuery.of(context).size.width*0.13),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(child: Text(App_Localization.of(context).translate("blog").toUpperCase(),
                style: const TextStyle(
                    fontFamily: "FOUNDRYGRIDNIK",
                    color: App.primery,fontSize:35,fontWeight: FontWeight.bold),maxLines: 1)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
            child:bigBlogs(count:2,ratio: 1.4,posts:homeController.blogs,radius:null,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: null,op: 1),
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
  bigBlogs({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
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
                                  fontSize: 12
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              posts[index].subTitle!,
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
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

  //************************ Medium ************************
  medWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.15),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.15,
            child: Center(child: Text(App_Localization.of(context).translate("blog").toUpperCase(),style: const TextStyle(
                fontFamily: "FOUNDRYGRIDNIK",
                color: App.primery,fontSize:20,fontWeight: FontWeight.bold),maxLines: 1)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
            child:medBlogs(count:2,ratio: 1.3,posts:homeController.blogs,radius:null,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: null,op: 1),
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
  medBlogs({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
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
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posts[index].title!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  fontFamily: "POPPINS",
                                overflow: TextOverflow.ellipsis
                              ),
                            ),
                            Text(
                              posts[index].subTitle!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10,
                                  fontFamily: "POPPINS",
                                  overflow: TextOverflow.ellipsis
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
