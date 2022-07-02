import 'package:animals/app_localization.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:animals/model/post.dart';
import 'package:animals/view/HomeHeader.dart';
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
                    MediaQuery.of(context).size.width>App.larg2 ? large2Widget(context)
                        : bigWidget(context)
                ),
                Positioned(child: HomeHeader()),

              ],
            ),
          ),
        ),
      ),
    );
  }

  blogs({required int count, required double ratio, required List<Post> posts,required double mainAxisSpacing, required double crossAxisSpacing ,required double textPadding,required double fontSize}) {
    return SizedBox(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: mainAxisSpacing,
              crossAxisSpacing: crossAxisSpacing,
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
                        padding: EdgeInsets.all(textPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posts[index].title!,
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  fontFamily: "POPPINS",
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSize,
                                  overflow: TextOverflow.ellipsis
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              posts[index].subTitle!,
                              style: TextStyle(
                                  letterSpacing: 2,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "POPPINS",
                                  fontSize: fontSize
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


  //************************ Extra ************************
  extraWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.14),
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
              child: blogs(count: 2, ratio: 6/4, posts: homeController.blogs, mainAxisSpacing: 30,
                  crossAxisSpacing: 30, textPadding: 20, fontSize: 23)
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 50, 23),
        ],
      ),
    );
  }

  //************************ Extra2 ************************
  extra2Widget(BuildContext context){
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
                    color: App.primery,fontSize:65,fontWeight: FontWeight.bold),maxLines: 1)),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
              child: blogs(count: 2, ratio: 6/4, posts: homeController.blogs, mainAxisSpacing: 30,
                  crossAxisSpacing: 30, textPadding: 20, fontSize: 21)
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 45, 21),
        ],
      ),
    );
  }

  //************************ xLarge ************************
  xlargeWidget(BuildContext context){
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
                    color: App.primery,fontSize:60,fontWeight: FontWeight.bold),maxLines: 1)),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
              child: blogs(count: 2, ratio: 6/4, posts: homeController.blogs, mainAxisSpacing: 30,
                  crossAxisSpacing: 30, textPadding: 20, fontSize: 19)
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 40, 19),
        ],
      ),
    );
  }

  //************************ xLarge2 ************************
  xlarge2Widget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.14),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(child: Text(App_Localization.of(context).translate("blog").toUpperCase(),
                style: const TextStyle(
                    fontFamily: "FOUNDRYGRIDNIK",
                    color: App.primery,fontSize:55,fontWeight: FontWeight.bold),maxLines: 1)),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
              child: blogs(count: 2, ratio: 6/4, posts: homeController.blogs, mainAxisSpacing: 30,
                  crossAxisSpacing: 30, textPadding: 18, fontSize: 17)
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 35, 17),
        ],
      ),
    );
  }

  //************************ Large ************************
  largeWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.14),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Center(child: Text(App_Localization.of(context).translate("blog").toUpperCase(),
                style: const TextStyle(
                    fontFamily: "FOUNDRYGRIDNIK",
                    color: App.primery,fontSize:45,fontWeight: FontWeight.bold),maxLines: 1)),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
              child: blogs(count: 2, ratio: 6/4, posts: homeController.blogs, mainAxisSpacing: 30,
                  crossAxisSpacing: 30, textPadding: 12, fontSize: 15)
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 30, 15),
        ],
      ),
    );
  }

  //************************ Large2 ************************
  large2Widget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.16),
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
              child: blogs(count: 2, ratio: 1.4, posts: homeController.blogs, mainAxisSpacing: 30,
                  crossAxisSpacing: 30, textPadding: 10, fontSize: 12)
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 25, 12),
        ],
      ),
    );
  }

  //************************ Medium ************************
  bigWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.16),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.15,
            child: Center(child: Text(App_Localization.of(context).translate("blog").toUpperCase(),style: const TextStyle(
                fontFamily: "FOUNDRYGRIDNIK",
                color: App.primery,fontSize:30,fontWeight: FontWeight.bold),maxLines: 1)),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
              child: blogs(count: 2, ratio: 1.4, posts: homeController.blogs, mainAxisSpacing: 20,
                  crossAxisSpacing: 20, textPadding: 6, fontSize: 10)
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 20, 10),
        ],
      ),
    );
  }


}
