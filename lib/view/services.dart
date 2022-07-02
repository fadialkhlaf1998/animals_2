import 'package:animals/helper/app.dart';
import 'package:animals/model/post.dart';
import 'package:animals/view/homeHeader.dart';
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
                Positioned(child: HomeHeader()),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  servicesList({required int count, required double ratio, required List<Post> posts,required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op, required double mainAxisSpacing,required  double crossAxisSpacing, required double fontSize, required double hPadding, required double vPadding}) {
    return SizedBox(
      height: height,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: mainAxisSpacing,
              crossAxisSpacing: crossAxisSpacing,
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
              child: OnHover(builder: (hover) {
                return Container(
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
                                  colorFilter: hover ? ColorFilter.mode(App.serviceHover.withOpacity(0.2), BlendMode.darken) :
                                  null,
                                  image: NetworkImage(posts[index]
                                      .image!
                                      .replaceAll(
                                      "localhost", "10.0.2.2")),
                                  fit: BoxFit.cover)),
                          child: Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: vPadding),
                                child: AnimatedDefaultTextStyle(
                                  child:Text(
                                      posts[index].title!),
                                  duration: Duration(microseconds: 1000),
                                  style: TextStyle(
                                      fontFamily: "POPPINS",
                                      color: Colors.white,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                      fontSize: hover ? fontSize + 2 : fontSize
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            );
          }),
    );
  }
  mobileservicesList({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op, required double mainAxisSpacing,required  double crossAxisSpacing, required double fontSize, required double hPadding, required double vPadding}) {
    return SizedBox(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: mainAxisSpacing,
              crossAxisSpacing: crossAxisSpacing,
              childAspectRatio: ratio),
          scrollDirection: Axis.vertical,
          itemCount: posts.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                homeController.btmNavBarIndex.value = 2;
                homeController.selectedServices.value = index;
                Future.delayed(Duration(milliseconds: 500)).then((value) {
                  homeController.scrollDown2();
                });
              },
              child: OnHover(builder: (hover) {
                return Container(
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
                                  colorFilter: hover ? ColorFilter.mode(Color(0xff000000).withOpacity(0.2), BlendMode.darken) :
                                  null,
                                  image: NetworkImage(posts[index]
                                      .image!
                                      .replaceAll(
                                      "localhost", "10.0.2.2")),
                                  fit: BoxFit.cover)),
                          child: Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: vPadding),
                                child: AnimatedDefaultTextStyle(
                                  child:Text(
                                      posts[index].title!),
                                  duration: Duration(microseconds: 1000),
                                  style: TextStyle(
                                      fontFamily: "POPPINS",
                                      color: Colors.white,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                      fontSize: hover ? fontSize + 2 : fontSize
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            );
          }),
    );
  }
  bookAnAssessmentButton(BuildContext context,double width,double height,String translate,double fontSize) {
    return GestureDetector(
      onTap: (){
        homeController.btmNavBarIndex.value = 6;
      },
      child: OnHover(builder:(hover){
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: hover ? App.bookAnAssessmentHover : App.primery,
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.1),
              border: Border.all(color: hover ? Color(0xffFF6200) : Colors.transparent)
          ),
          child: Center(
            child: Text(App_Localization.of(context).translate(translate),style:TextStyle(
                color: hover ? App.primery : Colors.white,
                fontSize: fontSize,
                fontFamily: "POPPINS",
                letterSpacing: 2,
                fontWeight: FontWeight.bold),),
          ),
        );
      }),
    );
  }
  description(BuildContext context,int index,double hBigContainer,double bigFontSize,double smallFontSize,double wBookBtn,double hBookBtn){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: hBigContainer,
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
                            fontSize: bigFontSize,
                          ),maxLines: 2,)
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Text(homeController.service[index].stringDescription.toString(),
                        style: TextStyle(
                            fontFamily: "POPPINS",
                            fontSize: smallFontSize,
                            letterSpacing: 1,
                            color: Colors.black.withOpacity(0.8)),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        children: [
                          bookAnAssessmentButton(context, wBookBtn, hBookBtn, "book_an_assessment", smallFontSize)
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


  //************************ Extra ************************
  extraWidget(BuildContext context){
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
                  child: servicesList(count:1,ratio:1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.13,
                      radius:60,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 60,op: 1,
                      mainAxisSpacing: 20,crossAxisSpacing: 20,fontSize: 23,hPadding: 40,vPadding: 15),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          description(context, homeController.selectedServices.value, MediaQuery.of(context).size.width * 0.4,
              70, 23, MediaQuery.of(context).size.width * 0.14, 70),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          App.footer(context,homeController),
          App.copyrights(context, 50, 23),
        ],
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
                  child: servicesList(count:1,ratio:1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.13,
                      radius:60,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 60,op: 1,
                      mainAxisSpacing: 20,crossAxisSpacing: 20,fontSize: 21,hPadding: 40,vPadding: 15),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          description(context, homeController.selectedServices.value, MediaQuery.of(context).size.width * 0.4,
              65, 21,MediaQuery.of(context).size.width * 0.15, 65),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          App.footer(context,homeController),
          App.copyrights(context, 45, 21),
        ],
      ),
    );
  }

  //************************ xLarge ************************
  xlargeWidget(BuildContext context){
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
                  child: servicesList(count:1,ratio:1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.13,
                      radius:60,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 60,op: 1,
                      mainAxisSpacing: 20,crossAxisSpacing: 20,fontSize: 19,hPadding: 30,vPadding: 10),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          description(context, homeController.selectedServices.value, MediaQuery.of(context).size.width * 0.4,
              60, 19, MediaQuery.of(context).size.width * 0.16, 60),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          App.footer(context,homeController),
          App.copyrights(context, 40, 19),
        ],
      ),
    );
  }

  //************************ xLarge2 ************************
  xlarge2Widget(BuildContext context){
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
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.07),
                  child: servicesList(count:1,ratio:1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.13,
                      radius:60,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 60,op: 1,
                      mainAxisSpacing: 20,crossAxisSpacing: 20,fontSize: 17,hPadding: 15,vPadding: 10),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          description(context, homeController.selectedServices.value, MediaQuery.of(context).size.width * 0.4,
              55, 17, MediaQuery.of(context).size.width * 0.17, 55),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          App.footer(context,homeController),
          App.copyrights(context, 35, 17),
        ],
      ),
    );
  }

  //************************ Large ************************
  largeWidget(BuildContext context){
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
                  child: servicesList(count:1,ratio:1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.13,
                      radius:50,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 50,op: 1,
                      mainAxisSpacing: 20,crossAxisSpacing: 20,fontSize: 15,hPadding: 10,vPadding: 8),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          description(context, homeController.selectedServices.value, MediaQuery.of(context).size.width * 0.4,
              45, 15, MediaQuery.of(context).size.width * 0.18, 50),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          App.footer(context,homeController),
          App.copyrights(context,30, 15)
        ],
      ),
    );
  }

  //************************ Large2 ************************
  large2Widget(BuildContext context){
    return SingleChildScrollView(
      controller: homeController.scrollController,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.16),
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
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                  child: servicesList(count:1,ratio:0.95,posts:homeController.service,height:MediaQuery.of(context).size.width*0.135,
                      radius:35,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 35,op: 1,
                      mainAxisSpacing: 5,crossAxisSpacing: 5,fontSize: 12,hPadding: 10,
                      vPadding: MediaQuery.of(context).size.width > 1150 ? 8 : 5
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          description(context, homeController.selectedServices.value, MediaQuery.of(context).size.width * 0.4,
              40, 12, MediaQuery.of(context).size.width > 1200 ?
              MediaQuery.of(context).size.width * 0.16 : MediaQuery.of(context).size.width * 0.19, 40),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          App.footer(context,homeController),
          App.copyrights(context,25, 12)
        ],
      ),
    );
  }

  //************************ Big ************************
  bigWidget(BuildContext context){
    return SingleChildScrollView(
      controller: homeController.scrollController,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.16),
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
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.14),
                  child: mobileservicesList(count:3,ratio: 1,posts:homeController.service,
                      radius: 25,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 25,op: 1,
                      mainAxisSpacing: 20,crossAxisSpacing: 25,fontSize: 10,hPadding: 20,
                      vPadding: MediaQuery.of(context).size.width > 850 ? 12 : 9
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          description(context, homeController.selectedServices.value, MediaQuery.of(context).size.width * 0.5,
              25, 10, MediaQuery.of(context).size.width > 850 ? MediaQuery.of(context).size.width * 0.19 :
              MediaQuery.of(context).size.width * 0.23, 35),
          SizedBox(height: MediaQuery.of(context).size.width * 0.04),
          App.footer(context,homeController),
          App.copyrights(context,20, 10)
        ],
      ),
    );
  }
}
