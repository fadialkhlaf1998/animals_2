import 'package:animals/app_localization.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:animals/model/post.dart';
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
                  child: MediaQuery.of(context).size.width>App.larg ? largeWidget(context)
                      : MediaQuery.of(context).size.width>App.big ? bigWidget(context)
                      : medWidget(context)
                ),
                Positioned(child: App.header(context, homeController,myKey)),
                Positioned(
                    right: 0,
                    child: App.languageBarHome(context, homeController)
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width>App.larg ?
                  MediaQuery.of(context).size.width -  MediaQuery.of(context).size.width * 0.38
                      : MediaQuery.of(context).size.width>App.big ?
                  MediaQuery.of(context).size.width -  MediaQuery.of(context).size.width * 0.43
                      : MediaQuery.of(context).size.width -  MediaQuery.of(context).size.width * 0.41,
                    child: news(context)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //************************ Large ************************
  largeWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.25),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(child: Text(App_Localization.of(context).translate("events").toUpperCase(),style: const TextStyle(color: App.primery,fontSize:40,fontWeight: FontWeight.bold),maxLines: 1)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
            child:largeEvents(count:2,ratio:6/4,posts:homeController.events,radius:null,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: null,op: 1),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.15),
          App.footer(context,homeController),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("© 2022 by The Barkley Pet Camp",
                    style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
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
                //homeController.doFunction(op, posts[index].id, context);
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
                                  fontWeight: FontWeight.bold,
                                  fontSize: App.largeFontSize(
                                      MediaQuery.of(context).size.width
                                  )
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              posts[index].subTitle!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: App.largeFontSize(
                                      MediaQuery.of(context).size.width
                                  )
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
          SizedBox(height: MediaQuery.of(context).size.height*0.25),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(child: Text(App_Localization.of(context).translate("events").toUpperCase(),style: const TextStyle(color: App.primery,fontSize:30,fontWeight: FontWeight.bold),maxLines: 1)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
            child:bigEvents(count:2,ratio: 1.4,posts:homeController.events,radius:null,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: null,op: 1),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.15),
          App.footer(context,homeController),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("© 2022 by The Barkley Pet Camp",
                    style: TextStyle(fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
  bigEvents({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
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
                                  fontSize: App.largeFontSize(
                                      MediaQuery.of(context).size.width
                                  )
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              posts[index].subTitle!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: App.largeFontSize(
                                      MediaQuery.of(context).size.width
                                  )
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
          SizedBox(height: MediaQuery.of(context).size.height*0.2),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.15,
            child: Center(child: Text(App_Localization.of(context).translate("events").toUpperCase(),style: const TextStyle(color: App.primery,fontSize:25,fontWeight: FontWeight.bold),maxLines: 1)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
            child:medEvents(count:2,ratio: 1.3,posts:homeController.events,radius:null,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: null,op: 1),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.15),
          App.footer(context,homeController),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("© 2022 by The Barkley Pet Camp",
                    style: TextStyle(fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
  medEvents({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
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
                                  fontSize: App.largeFontSize(
                                      MediaQuery.of(context).size.width
                                  )
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              posts[index].subTitle!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: App.largeFontSize(
                                      MediaQuery.of(context).size.width
                                  )
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


  //************************ News ************************
  news(BuildContext context) {
    return MediaQuery.of(context).size.width>App.larg?largeNews(context) :
    MediaQuery.of(context).size.width>App.big ? bigNews(context) :
    medNews(context);
  }
  largeNews(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.25),
        AnimatedSize(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: Container(
              child: !(homeController.btmNavBarIndex.value == 5)
                  ? Center()
                  :  Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        color: App.orange,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(App_Localization.of(context).translate("events"),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: App.largeFontSize(MediaQuery.of(context).size.width)
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //todo go to blogs page
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          color: App.primery,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(App_Localization.of(context).translate("blogs"),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: App.largeFontSize(MediaQuery.of(context).size.width)
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
              )
          ),
        )
      ],
    );
  }
  bigNews(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.25),
        AnimatedSize(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: Container(
              child: !(homeController.btmNavBarIndex.value == 5)
                  ? Center()
                  :  Container(
                  width: MediaQuery.of(context).size.width * 0.18,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.18,
                        color: App.orange,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(App_Localization.of(context).translate("events"),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //todo go to blogs page
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.18,
                          color: App.primery,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(App_Localization.of(context).translate("blogs"),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
              )
          ),
        )
      ],
    );
  }
  medNews(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.2),
        AnimatedSize(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: Container(
              child: !(homeController.btmNavBarIndex.value == 5)
                  ? Center()
                  :  Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        color: App.orange,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(App_Localization.of(context).translate("events"),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //todo go to blogs page
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: App.primery,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(App_Localization.of(context).translate("blogs"),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
              )
          ),
        )
      ],
    );
  }
}
