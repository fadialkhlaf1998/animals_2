import 'package:animals/view/about.dart';
import 'package:animals/view/blogs.dart';
import 'package:animals/view/book_assessment.dart';
import 'package:animals/view/contact.dart';
import 'package:animals/view/events.dart';
import 'package:animals/view/gallery.dart';
import 'package:animals/view/header.dart';
import 'package:animals/view/rate.dart';
import 'package:animals/view/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animals/app_localization.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:animals/model/post.dart';
import 'package:zoom_widget/zoom_widget.dart';
import 'package:lottie/lottie.dart';

class Home extends StatelessWidget {

  HomeController homeController = Get.put(HomeController());
  final GlobalKey<ScaffoldState> myKey = GlobalKey();
  CarouselController carouselController = CarouselController();
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return
        !homeController.ready.value?loading(context): homeController.btmNavBarIndex.value == 0 ?
        home(context) : homeController.btmNavBarIndex.value == 1 ? About()
            : homeController.btmNavBarIndex.value == 2 ? Services()
            : homeController.btmNavBarIndex.value == 3? Rate() :
              homeController.btmNavBarIndex.value == 4 ? Gallery() :
              homeController.btmNavBarIndex.value == 5 ?homeController.selectedNews.value == 0? Events():Blogs() :
              homeController.btmNavBarIndex.value == 6 ? Contact() :
              BookAssessment();
    });
  }

  loading(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width>MediaQuery.of(context).size.height?MediaQuery.of(context).size.height: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width>MediaQuery.of(context).size.height?MediaQuery.of(context).size.height: MediaQuery.of(context).size.width,
          child: Lottie.asset("assets/image/BoneOrange.json",fit: BoxFit.fill),
        ),
      ),
    );
  }
  home(BuildContext context) {
    return Scaffold(
      key: myKey,
      endDrawer: App.myDrawer(context, homeController,myKey),
      body:  RefreshIndicator(
        onRefresh: ()async{
          Get.offAllNamed("/");
        },
        child: Stack(
          children: [
            Zoom(
              maxZoomWidth: MediaQuery.of(context).size.width,
              maxZoomHeight: MediaQuery.of(context).size.height,
              child: SafeArea(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image/Background.png")
                        )
                    ),
                    child: MediaQuery.of(context).size.width>App.extra ? extraHome(context) :
                    MediaQuery.of(context).size.width > App.xLarge ? xLargHome(context) :
                    MediaQuery.of(context).size.width>App.larg?largHome(context)
                        :MediaQuery.of(context).size.width>App.big?bgHome(context)
                        : mdHome(context)
                ),
              ),
            ),
            Positioned(
                right: 0,
                child: App.languageBarHome(context, homeController)
            ),
           GestureDetector(
             onTap: (){
               homeController.popUp.value = false;
             },
             child: homeController.popUp.value ? Container(
                 width: MediaQuery.of(context).size.width,
                 height: MediaQuery.of(context).size.height,
                 color: Colors.black.withOpacity(0.5),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     SizedBox(height: MediaQuery.of(context).size.width * 0.13),
                     popUp(context, homeController),
                   ],
                 )
             ) : Text(''),
           )
            //

          ],
        )
      ),
    );
  }


  //************************ Extra ************************
  extraHome(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          controller: App.scrollController,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width*0.13),
              _slider(context),
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
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.15),
                child:extraService(count:3,ratio:1,posts:homeController.service,radius:60,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 60,op: 1),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              extraAbout(context),
              SizedBox(height: MediaQuery.of(context).size.width*0.02),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                          width: MediaQuery.of(context).size.width*0.7,
                          child: Center(child: Text(App_Localization.of(context).translate("partner_brands"),
                            style: const TextStyle(color: App.primery,
                                fontSize: 70,
                                fontFamily: "FOUNDRYGRIDNIK",
                                fontWeight: FontWeight.bold),)),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Center(
                        child:extraBrands(count:1,ratio:4/6,posts:homeController.brand,height:MediaQuery.of(context).size.width*0.12,radius:0,circle:false,background: Colors.transparent,shadow: false,img_radius: null,op: 1),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.02),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.1,
                color: App.green,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(App_Localization.of(context).translate("love_your_pets"),
                          style: TextStyle(color: Colors.white,
                              fontSize: 50,
                              fontFamily: "FOUNDRYGRIDNIK",
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 30,),
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
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                    width: MediaQuery.of(context).size.width*0.7,
                    child: Center(child: Text(App_Localization.of(context).translate("reviews").toUpperCase(),
                      style: TextStyle(color: App.primery,
                          fontSize: 70,
                          fontFamily: "FOUNDRYGRIDNIK",
                          fontWeight: FontWeight.bold
                      ),)),
                  ),
                ),
              ),
              extraReview(context),
              SizedBox(height: MediaQuery.of(context).size.width*0.02),
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
        ),
        // Positioned(child: App.header(context,homeController,myKey),),
        Positioned(child: Header()),
        homeController.loading.value
            ? Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: App.primery.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ))
            : const Center()
      ],
    );
  }
  ///////////////////////Hover




  extraService({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 50,
              crossAxisSpacing: 50,
              childAspectRatio: ratio),
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
                            // color:  posts[index].color,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 35),
                              child: Text(
                                posts[index].title!,
                                style: TextStyle(
                                    fontFamily: "POPPINS",
                                    color: Colors.white,
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
  }
  extraAbout(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.width*0.3,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height:  MediaQuery.of(context).size.width*0.25,
              color: App.primery,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Align(alignment: Alignment.centerLeft,
                        child: Text(homeController.aboutHomePage!.subTitle!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 60,
                              fontFamily: "FOUNDRYGRIDNIK"
                          ), textAlign: TextAlign.left,maxLines: 2,)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Text(homeController.aboutHomePage!.stringDescription!,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "POPPINS",
                          color: Colors.white.withOpacity(0.8)),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height:  MediaQuery.of(context).size.width*0.25,
              decoration:BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(homeController.aboutHomePage!.image!),
                      fit: BoxFit.fill
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
  extraReview(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            carouselController.previousPage(duration: Duration(milliseconds: 700));
          },
          child: Container(
            height: 200,
            width: 200,
            child: Icon(Icons.arrow_back_ios_outlined,size: 100,color: App.primery,),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 400,
          height: MediaQuery.of(context).size.width * 0.25,
          child: CarouselSlider.builder(
            carouselController: carouselController,
            options: CarouselOptions(
                height: MediaQuery.of(context).size.width * 0.2,
                autoPlay: false,
                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy:
                CenterPageEnlargeStrategy.height,
                autoPlayInterval: Duration(seconds: 2),
                onPageChanged: (index, reason) {
                  homeController.set_index(index);
                }),
            itemCount: homeController.reviews.length ,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.15,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5,),
                                    Image.asset("assets/image/quote.png",
                                      width: 100,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: Align(alignment: Alignment.centerLeft,child:
                                      Text(homeController.reviews[index].title!,
                                          style: TextStyle(
                                            fontFamily: "POPPINS",
                                            fontWeight: FontWeight.bold,color: App.primery,
                                            fontSize: 25,
                                          ), textAlign: TextAlign.left,maxLines: 1),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 120),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: MediaQuery.of(context).size.width * 0.1,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Text(homeController.reviews[index].stringDescription!,
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontFamily: "POPPINS",
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 3),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width*0.2,
                    decoration:BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(homeController.reviews[index].image!),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            carouselController.nextPage(duration: Duration(milliseconds: 700));
          },
          child: Container(
            height: 200,
            width: 200,
            child: Icon(Icons.arrow_forward_ios_outlined,size: 100,color: App.primery,),
          ),
        )
      ],
    );
  }
  extraBrands({required int count, required double ratio, required List<Post> posts, required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      height: height,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: ratio),
          scrollDirection: Axis.horizontal,
          itemCount: posts.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(height/5),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      //todo brand page
                    },
                    child: Container(
                      decoration: BoxDecoration(
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(posts[index]
                                    .image!
                                    .replaceAll(
                                    "localhost", "10.0.2.2")),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ),

                ],
              ),
            );
          }),
    );
  }

  //************************ xLarge ************************
  xLargHome(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          controller: App.scrollController,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width*0.12),
              _slider(context),
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
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.15),
                child:xLargeService(count:3,ratio:1,posts:homeController.service,radius:60,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 60,op: 1),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              xLargAbout(context),
              SizedBox(height: MediaQuery.of(context).size.width*0.02),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                          width: MediaQuery.of(context).size.width*0.7,
                          child: Center(child: Text(App_Localization.of(context).translate("partner_brands"),
                            style: const TextStyle(color: App.primery,
                                fontSize: 60,
                                fontFamily: "FOUNDRYGRIDNIK",
                                fontWeight: FontWeight.bold),)),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Center(
                        child:xLargBrands(count:1,ratio:4/6,posts:homeController.brand,height:MediaQuery.of(context).size.width*0.1,radius:0,circle:false,background: Colors.transparent,shadow: false,img_radius: null,op: 1),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.02),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.1,
                color: App.green,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(App_Localization.of(context).translate("love_your_pets"),
                          style: TextStyle(color: Colors.white,
                              fontSize: 40,
                              fontFamily: "FOUNDRYGRIDNIK",
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 30,),
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
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                    width: MediaQuery.of(context).size.width*0.7,
                    child: Center(child: Text(App_Localization.of(context).translate("reviews").toUpperCase(),
                      style: TextStyle(color: App.primery,
                          fontSize: 60,
                          fontFamily: "FOUNDRYGRIDNIK",
                          fontWeight: FontWeight.bold
                      ),)),
                  ),
                ),
              ),
              xLargReview(context),
              SizedBox(height: MediaQuery.of(context).size.width*0.02),
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
        ),
        // Positioned(child: App.header(context,homeController,myKey),),
        Positioned(child: Header()),
        homeController.loading.value
            ? Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: App.primery.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ))
            : const Center()
      ],
    );
  }
  xLargeService({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 50,
              crossAxisSpacing: 50,
              childAspectRatio: ratio),
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
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 30),
                              child: Text(
                                posts[index].title!,
                                style: TextStyle(
                                    fontFamily: "POPPINS",
                                    color: Colors.white,
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
  }
  xLargAbout(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.width*0.25,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height:  MediaQuery.of(context).size.width*0.3,
              color: App.primery,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Align(alignment: Alignment.centerLeft,
                        child: Text(homeController.aboutHomePage!.subTitle!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 50,
                              fontFamily: "FOUNDRYGRIDNIK"
                          ), textAlign: TextAlign.left,maxLines: 2,)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Text(homeController.aboutHomePage!.stringDescription!,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "POPPINS",
                          color: Colors.white.withOpacity(0.8)),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height:  MediaQuery.of(context).size.width*0.25,
              decoration:BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(homeController.aboutHomePage!.image!),
                      fit: BoxFit.fill
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
  xLargReview(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            carouselController.previousPage(duration: Duration(milliseconds: 700));
          },
          child: Container(
            height: 150,
            width: 150,
            child: Icon(Icons.arrow_back_ios_outlined,size: 90,color: App.primery,),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 300,
          height: MediaQuery.of(context).size.width * 0.25,
          child: CarouselSlider.builder(
            carouselController: carouselController,
            options: CarouselOptions(
                height: MediaQuery.of(context).size.width * 0.2,
                autoPlay: false,
                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy:
                CenterPageEnlargeStrategy.height,
                autoPlayInterval: Duration(seconds: 2),
                onPageChanged: (index, reason) {
                  homeController.set_index(index);
                }),
            itemCount: homeController.reviews.length ,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.15,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5,),
                                    Image.asset("assets/image/quote.png",
                                      width: 100,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: Align(alignment: Alignment.centerLeft,child:
                                      Text(homeController.reviews[index].title!,
                                          style: TextStyle(
                                            fontFamily: "POPPINS",
                                            fontWeight: FontWeight.bold,color: App.primery,
                                            fontSize: 20,
                                          ), textAlign: TextAlign.left,maxLines: 1),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 120),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: MediaQuery.of(context).size.width * 0.1,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Text(homeController.reviews[index].stringDescription!,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontFamily: "POPPINS",
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width*0.2,
                    decoration:BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(homeController.reviews[index].image!),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            carouselController.nextPage(duration: Duration(milliseconds: 700));
          },
          child: Container(
            height: 150,
            width: 150,
            child: Icon(Icons.arrow_forward_ios_outlined,size: 90,color: App.primery,),
          ),
        )
      ],
    );
  }
  xLargBrands({required int count, required double ratio, required List<Post> posts, required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      height: height,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: ratio),
          scrollDirection: Axis.horizontal,
          itemCount: posts.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(height/5),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      //todo brand page
                    },
                    child: Container(
                      decoration: BoxDecoration(
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(posts[index]
                                    .image!
                                    .replaceAll(
                                    "localhost", "10.0.2.2")),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ),

                ],
              ),
            );
          }),
    );
  }

  //************************ Large ************************
  largHome(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          controller: App.scrollController,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width*0.12),
              _slider(context),
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
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              fontFamily: "FOUNDRYGRIDNIK"
                          ))),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.15),
                child:largService(count:3,ratio: 1,posts:homeController.service,radius:50,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 50,op: 1),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              largAbout(context),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                          width: MediaQuery.of(context).size.width*0.7,
                          child: Center(child: Text(App_Localization.of(context).translate("partner_brands"),
                            style: const TextStyle(color: App.primery,
                                fontSize: 50,
                                fontFamily: "FOUNDRYGRIDNIK",
                                fontWeight: FontWeight.bold),)),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child:largBrands(count:1,ratio:4/5,posts:homeController.brand,height:MediaQuery.of(context).size.width*0.14,radius:0,circle:false,background: Colors.transparent,shadow: false,img_radius: null,op: 1),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.02),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.1,
                color: App.green,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(App_Localization.of(context).translate("love_your_pets"),
                          style: TextStyle(color: Colors.white,
                              fontSize: 30,
                              fontFamily: "FOUNDRYGRIDNIK",
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 30,),
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
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                    width: MediaQuery.of(context).size.width*0.7,
                    child: Center(child: Text(App_Localization.of(context).translate("reviews").toUpperCase(),
                      style: TextStyle(color: App.primery,
                          fontSize: 50,
                          fontFamily: "FOUNDRYGRIDNIK",
                          fontWeight: FontWeight.bold
                      ),)),
                  ),
                ),
              ),
              largReview(context),
              SizedBox(height: MediaQuery.of(context).size.width*0.02),
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
        ),
        // Positioned(child: App.header(context,homeController,myKey),),
        Positioned(child: Header()),
        homeController.loading.value
            ? Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: App.primery.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ))
            : const Center()
      ],
    );
  }
  largService({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: ratio),
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
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 25),
                              child: Text(
                                posts[index].title!,
                                style: TextStyle(
                                    fontFamily: "POPPINS",
                                    color: Colors.white,
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
    );}
  largAbout(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width*0.25,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height:  MediaQuery.of(context).size.width*0.3,
              color: App.primery,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Align(alignment: Alignment.centerLeft,
                        child: Text(homeController.aboutHomePage!.subTitle!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40,
                            fontFamily: "FOUNDRYGRIDNIK"
                          ), textAlign: TextAlign.left,maxLines: 2,)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Text(homeController.aboutHomePage!.stringDescription!,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "POPPINS",
                          color: Colors.white.withOpacity(0.8)),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height:  MediaQuery.of(context).size.width*0.25,
              decoration:BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(homeController.aboutHomePage!.image!),
                      fit: BoxFit.fill
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
  largReview(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            carouselController.previousPage(duration: Duration(milliseconds: 700));
          },
          child: Container(
            height: 100,
            width: 100,
            child: Icon(Icons.arrow_back_ios_outlined,size: 80,color: App.primery,),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 200,
          height: MediaQuery.of(context).size.width * 0.22,
          child: CarouselSlider.builder(
            carouselController: carouselController,
            options: CarouselOptions(
                height: MediaQuery.of(context).size.width * 0.17,
                autoPlay: false,
                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy:
                CenterPageEnlargeStrategy.height,
                autoPlayInterval: Duration(seconds: 2),
                onPageChanged: (index, reason) {
                  homeController.set_index(index);
                }),
            itemCount: homeController.reviews.length ,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.17,
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.12,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5,),
                                    Image.asset("assets/image/quote.png",
                                      width: 70,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: Align(alignment: Alignment.centerLeft,child:
                                      Text(homeController.reviews[index].title!,
                                          style: TextStyle(
                                            fontFamily: "POPPINS",
                                            fontWeight: FontWeight.bold,color: App.primery,
                                            fontSize: 16,
                                          ), textAlign: TextAlign.left,maxLines: 1),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 90),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: MediaQuery.of(context).size.width * 0.05,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Text(homeController.reviews[index].stringDescription!,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: "POPPINS",
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width*0.17,
                    decoration:BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(homeController.reviews[index].image!),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            carouselController.nextPage(duration: Duration(milliseconds: 700));
          },
          child: Container(
            height: 100,
            width: 100,
            child: Icon(Icons.arrow_forward_ios_outlined,size: 80,color: App.primery,),
          ),
        )
      ],
    );
  }
  largBrands({required int count, required double ratio, required List<Post> posts, required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
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
            return Padding(
              padding: EdgeInsets.all(height/5),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      //homeController.doFunction(op, posts[index].id, context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      decoration: BoxDecoration(
                        color: background,
                        boxShadow: [shadow ? App.boxShadow : App.noShadow],
                        borderRadius:
                        radius == null ? null : BorderRadius.circular(radius),
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
                                          : BorderRadius.circular(img_radius),
                                      shape: circle
                                          ? BoxShape.circle
                                          : BoxShape.rectangle,
                                      image: DecorationImage(
                                          image: NetworkImage(posts[index]
                                              .image!
                                              .replaceAll(
                                              "localhost", "10.0.2.2")),
                                          fit: BoxFit.fill)),
                                ),
                              )),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            );
          }),
    );
  }

  //************************ big ************************
  bgHome(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          controller: App.scrollController,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width * 0.13),
              _slider(context),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      child: Center(child: Text(App_Localization.of(context).translate("services").toUpperCase(),
                          style: const TextStyle(
                              color: App.primery,fontSize: 35,
                              fontFamily: "FOUNDRYGRIDNIK",
                              fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.15),
                child:bgService(count:3,ratio:1,posts:homeController.service,radius:50,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 50,op: 1),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              bgAbout(context),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                          width: MediaQuery.of(context).size.width*0.7,
                          child: Center(child: Text(App_Localization.of(context).translate("partner_brands"),
                            style: const TextStyle(
                                color: App.primery,fontSize: 35,
                                fontWeight: FontWeight.bold,
                              fontFamily: "FOUNDRYGRIDNIK"
                            ),
                          )),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      child: Center(
                        child:bgBrands(count:1,ratio:4/6,posts:homeController.brand,height:MediaQuery.of(context).size.width*0.1,radius:0,circle:false,background: Colors.transparent,shadow: false,img_radius: null,op: 1),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.02),
              Container(
                width: MediaQuery.of(context).size.width,
                color: App.green,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(App_Localization.of(context).translate("love_your_pets"),
                          style: TextStyle(color: Colors.white,fontSize: 20,
                              fontFamily: "FOUNDRYGRIDNIK",
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 20,),
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
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                    width: MediaQuery.of(context).size.width*0.7,
                    child: Center(child: Text(App_Localization.of(context).translate("reviews").toUpperCase(),
                      style: const TextStyle(
                          fontFamily: "FOUNDRYGRIDNIK",
                          color: App.primery,fontSize: 35,fontWeight: FontWeight.bold),)),
                  ),
                ),
              ),
              BigReview(context),
              SizedBox(height: MediaQuery.of(context).size.width*0.02),
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
        ),
        // Positioned(child: App.header(context,homeController,myKey),),
        Positioned(child: Header()),
        homeController.loading.value
            ? Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: App.primery.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ))
            : const Center()
      ],
    );
  }
  bgService({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
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
                  homeController.scrollDown();
                });
              },
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 2),
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
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: img_radius == null
                                        ? null
                                        : BorderRadius.only(
                                        topLeft: Radius.circular(radius!),
                                        topRight: Radius.circular(radius)),
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
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 20,vertical:
                                      MediaQuery.of(context).size.width > 1250 ? 20 : 15
                                      ),
                                      child: Text(
                                        posts[index].title!,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "POPPINS",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
  bgAbout(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.width*0.3,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height:  MediaQuery.of(context).size.width*0.3,
              color: App.primery,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Align(alignment: Alignment.centerLeft,child: Text(homeController.aboutHomePage!.subTitle!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: "FOUNDRYGRIDNIK",
                          color: Colors.white),
                      textAlign: TextAlign.left,maxLines: 2,)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Text(homeController.aboutHomePage!.stringDescription!,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "POPPINS",
                          color: Colors.white.withOpacity(0.8)),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height:  MediaQuery.of(context).size.width * 0.3,
              decoration:BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(homeController.aboutHomePage!.image!),
                      fit: BoxFit.fill
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
  BigReview(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            carouselController.previousPage(duration: Duration(milliseconds: 700));
          },
          child: Container(
            height: 90,
            width: 90,
            child: Icon(Icons.arrow_back_ios_outlined,size: 50,color: App.primery,),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 180,
          height: MediaQuery.of(context).size.width * 0.3,
          child: CarouselSlider.builder(
            carouselController: carouselController,
            options: CarouselOptions(
                height: MediaQuery.of(context).size.width * 0.2,
                autoPlay: false,
                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy:
                CenterPageEnlargeStrategy.height,
                autoPlayInterval: Duration(seconds: 2),
                onPageChanged: (index, reason) {
                  homeController.set_index(index);
                }),
            itemCount: homeController.reviews.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.15,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/image/quote.png",
                                      width: 50,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.35,
                                      child: Align(alignment: Alignment.centerLeft,child: Text(homeController.reviews[index].title!,
                                          style: TextStyle(
                                            fontFamily: "POPPINS",
                                            fontWeight: FontWeight.bold,color: App.primery,
                                            fontSize:12,
                                          ), textAlign: TextAlign.left,maxLines: 1),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 70),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  height: MediaQuery.of(context).size.width * 0.07,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Text(homeController.reviews[index].stringDescription!,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: "POPPINS",
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width*0.2,
                    decoration:BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(homeController.reviews[index].image!),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            carouselController.nextPage(duration: Duration(milliseconds: 700));
          },
          child: Container(
            height: 90,
            width: 90,
            child: Icon(Icons.arrow_forward_ios_outlined,size: 50,color: App.primery,),
          ),
        )

      ],
    );
  }
  bgBrands({required int count, required double ratio, required List<Post> posts, required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
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
            return Padding(
              padding: EdgeInsets.all(height/5),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      //homeController.doFunction(op, posts[index].id, context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      decoration: BoxDecoration(
                        color: background,
                        boxShadow: [shadow ? App.boxShadow : App.noShadow],
                        borderRadius:
                        radius == null ? null : BorderRadius.circular(radius),
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
                                          : BorderRadius.circular(img_radius),
                                      shape: circle
                                          ? BoxShape.circle
                                          : BoxShape.rectangle,
                                      image: DecorationImage(
                                          image: NetworkImage(posts[index]
                                              .image!
                                              .replaceAll(
                                              "localhost", "10.0.2.2")),
                                          fit: BoxFit.fill)),
                                ),
                              )),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            );
          }),
    );
  }

  //************************ Medium ************************
  mdHome(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          controller: App.scrollController,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width*0.15),
              _slider(context),
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
                              fontSize: 20,fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.13),
                child:mdService(count:3,ratio:1,posts:homeController.service,radius:50,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 50,op: 1),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03),
              mdAbout(context),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                          width: MediaQuery.of(context).size.width*0.7,
                          child: Center(child: Text(App_Localization.of(context).translate("partner_brands"),
                            style: const TextStyle(
                                fontFamily: "FOUNDRYGRIDNIK",
                                color: App.primery,fontSize: 20,
                                fontWeight: FontWeight.bold),)),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all( MediaQuery.of(context).size.width*0.03),
                          child:mdBrands(count:1,ratio:1,posts:homeController.brand,height:MediaQuery.of(context).size.width*0.155,radius:0,circle:false,background: Colors.transparent,shadow: false,img_radius: null,op: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.02),
              Container(
                width: MediaQuery.of(context).size.width,
                color: App.green,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(App_Localization.of(context).translate("love_your_pets"),
                          style: TextStyle(color: Colors.white,fontSize: 15,
                              fontFamily: "FOUNDRYGRIDNIK",
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 20,),
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
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                    width: MediaQuery.of(context).size.width*0.7,
                    child: Center(child: Text(App_Localization.of(context).translate("reviews").toUpperCase(),
                      style: const TextStyle(
                          fontFamily: "FOUNDRYGRIDNIK",
                          color: App.primery,fontSize: 20,fontWeight: FontWeight.bold),)),
                  ),
                ),
              ),
              mdReview(context),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
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
        ),
        // Positioned(child: App.header(context,homeController,myKey),),
        Positioned(child: Header()),
        homeController.loading.value
            ? Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: App.primery.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ))
            :const Center()
      ],
    );
  }
  mdService({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return SizedBox(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
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
                                  padding:  EdgeInsets.symmetric(horizontal: 20,vertical:
                                  MediaQuery.of(context).size.width > 850 ? 10 : 8
                                  ),
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
  mdAbout(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.width*0.34,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height:  MediaQuery.of(context).size.width*0.34,
              color: App.primery,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Align(alignment: Alignment.centerLeft,child: Text(homeController.aboutHomePage!.subTitle!,
                      style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,
                          fontFamily: "FOUNDRYGRIDNIK",
                          color: Colors.white), textAlign: TextAlign.left,maxLines: 2,)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.03,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Text(homeController.aboutHomePage!.stringDescription!,
                      style: TextStyle(
                          fontFamily: "POPPINS",
                          fontSize: 10,color: Colors.white.withOpacity(0.8)),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height:  MediaQuery.of(context).size.width*0.34,
              decoration:BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(homeController.aboutHomePage!.image!),
                      fit: BoxFit.fill
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
  mdReview(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            carouselController.previousPage(duration: Duration(milliseconds: 700));
          },
          child: Container(
            height: 70,
            width: 70,
            child: Icon(Icons.arrow_back_ios_outlined,size: 40,color: App.primery,),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 140,
          height: MediaQuery.of(context).size.width * 0.25,
          child: CarouselSlider.builder(
            carouselController: carouselController,
            options: CarouselOptions(
                height: MediaQuery.of(context).size.width * 0.2,
                autoPlay: false,
                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy:
                CenterPageEnlargeStrategy.height,
                autoPlayInterval: Duration(seconds: 2),
                onPageChanged: (index, reason) {
                  homeController.set_index(index);
                }),
            itemCount: homeController.reviews.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.15,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/image/quote.png",
                                      width: 30,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 15),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: Align(alignment: Alignment.centerLeft,child: Text(homeController.reviews[index].title!,
                                          style: TextStyle(
                                            fontFamily: "POPPINS",
                                            fontWeight: FontWeight.bold,color: App.primery,
                                            fontSize: 10,
                                          ), textAlign: TextAlign.left,maxLines: 1),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 50),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: MediaQuery.of(context).size.width * 0.07,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Text(homeController.reviews[index].stringDescription!,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontFamily: "POPPINS",
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width*0.2,
                    decoration:BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(homeController.reviews[index].image!),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            carouselController.nextPage(duration: Duration(milliseconds: 700));
          },
          child: Container(
            height: 70,
            width: 70,
            child: Icon(Icons.arrow_forward_ios_outlined,size: 40,color: App.primery,),
          ),
        )

      ],
    );
  }
  mdBrands({required int count, required double ratio, required List<Post> posts, required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
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
            return Padding(
              padding: EdgeInsets.all(height/5),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      //homeController.doFunction(op, posts[index].id, context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      decoration: BoxDecoration(
                        color: background,
                        boxShadow: [shadow ? App.boxShadow : App.noShadow],
                        borderRadius:
                        radius == null ? null : BorderRadius.circular(radius),
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
                                          : BorderRadius.circular(img_radius),
                                      shape: circle
                                          ? BoxShape.circle
                                          : BoxShape.rectangle,
                                      image: DecorationImage(
                                          image: NetworkImage(posts[index]
                                              .image!
                                              .replaceAll(
                                              "localhost", "10.0.2.2")),
                                          fit: BoxFit.fill)),
                                ),
                              )),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            );
          }),
    );
  }

  //************************ Slider ************************
  _slider(BuildContext context){
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.4,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: CarouselSlider(
            items: homeController.banner.map((e){
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.4,
                  child: CachedNetworkImage(
                    imageUrl: e.image!,
                    imageBuilder: (context, imageProvider) => Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                           horizontal: MediaQuery.of(context).size.width*0.15,
                           vertical:  MediaQuery.of(context).size.width*0.1
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width>App.extra ? MediaQuery.of(context).size.width * 0.35 :
                              MediaQuery.of(context).size.width>App.xLarge ? MediaQuery.of(context).size.width * 0.35 :
                              MediaQuery.of(context).size.width>App.larg ? MediaQuery.of(context).size.width * 0.35  :
                              MediaQuery.of(context).size.width>App.big? MediaQuery.of(context).size.width * 0.38 :
                              MediaQuery.of(context).size.width * 0.4,
                              child: Text(homeController.banner[homeController.selder_selected.value].title!,
                                style: TextStyle(
                                    fontFamily: "POPPINS",
                                    color: Colors.white,
                                    height: 1.2,
                                    fontSize: MediaQuery.of(context).size.width > App.extra ? 80 :
                                    MediaQuery.of(context).size.width>App.xLarge ? 65 :
                                    MediaQuery.of(context).size.width>App.larg ? 50 :
                                    MediaQuery.of(context).size.width>App.big? 35 : 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                            GestureDetector(
                              onTap: (){
                                homeController.btmNavBarIndex.value = 6;
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width>App.extra ? MediaQuery.of(context).size.width * 0.14 :
                                MediaQuery.of(context).size.width>App.xLarge ? MediaQuery.of(context).size.width * 0.14 :
                                MediaQuery.of(context).size.width>App.larg ? MediaQuery.of(context).size.width * 0.14  :
                                MediaQuery.of(context).size.width>App.big? MediaQuery.of(context).size.width * 0.16 :
                                MediaQuery.of(context).size.width * 0.2,
                                decoration: BoxDecoration(
                                    color: App.primery,
                                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.1)
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(MediaQuery.of(context).size.width>App.extra ? 15 :
                                    MediaQuery.of(context).size.width>App.xLarge ? 13 :
                                    MediaQuery.of(context).size.width>App.larg ? 10  :
                                    MediaQuery.of(context).size.width>App.big? 8 :
                                    6),
                                    child: Text(App_Localization.of(context).translate("book_an_assessment"),style:TextStyle(
                                        color: Colors.white ,
                                        fontSize: MediaQuery.of(context).size.width > App.extra ? 25 :
                                        MediaQuery.of(context).size.width>App.xLarge ? 20 :
                                        MediaQuery.of(context).size.width>App.larg ? 16 :
                                        MediaQuery.of(context).size.width>App.big? 12 : 10,
                                        fontFamily: "POPPINS",
                                        fontWeight: FontWeight.bold),),
                                  ),
                                ) ,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
              );
            }).toList(),
            options: CarouselOptions(
              autoPlay: homeController.banner.length>1?true:false,
              enlargeCenterPage: true,
              viewportFraction: 1,
              aspectRatio: 2.0,
              initialPage: 0,
              onPageChanged: (index, reason) {
                homeController.selder_selected.value=index;
              },
            ),
          ),
        ),
      ],
    );
  }

  //************************ PopUp ************************
  popUp(BuildContext context,HomeController homeController){
    return MediaQuery.of(context).size.width>App.extra?extrapopUp(context,homeController) :
    MediaQuery.of(context).size.width>App.xLarge?xlargepopUp(context,homeController) :
    MediaQuery.of(context).size.width>App.larg?largepopUp(context,homeController)
        :MediaQuery.of(context).size.width>App.big?bigpopUp(context,homeController)
        : midpopUp(context,homeController);
  }
  extrapopUp(BuildContext context,HomeController homeController){
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.25,
      color: App.primery,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.28,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(App_Localization.of(context).translate("hello").toUpperCase() + "!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: "POPPINS",
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(App_Localization.of(context).translate("leave_your_details"),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 25,
                              fontFamily: "POPPINS",
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 5),
                    Container(
                        height: 70,
                        color: Colors.white,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(fontSize: 25,
                              fontFamily: "POPPINS",
                              color: Colors.grey),
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("name"),
                            hintStyle: TextStyle(color: Colors.grey,
                              fontSize: 25,
                              fontFamily: "POPPINS",
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 10),
                    Container(
                        height: 70,
                        color: Colors.white,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "POPPINS",
                              color: Colors.grey),
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("email"),
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 25,
                              fontFamily: "POPPINS",),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 10),
                    Container(
                        height: 70,
                        color: Colors.white,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(fontSize: 25,
                              fontFamily: "POPPINS",
                              color: Colors.grey),
                          keyboardType: TextInputType.number,
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("phone"),
                            hintStyle: TextStyle(color: Colors.grey,
                                fontFamily: "POPPINS",
                                fontSize: 25
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        //todo submit
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.13,
                        height: 70,
                        decoration: BoxDecoration(
                          color: App.purple,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Text(App_Localization.of(context).translate("submit").toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "POPPINS",
                                fontSize:25
                            ),),
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/popUp.png"),
                fit: BoxFit.cover
              )
            ),
          )
        ],
      ),
    );
  }
  xlargepopUp(BuildContext context,HomeController homeController){
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.25,
      color: App.primery,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.28,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(App_Localization.of(context).translate("hello").toUpperCase() + "!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "POPPINS",
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(App_Localization.of(context).translate("leave_your_details"),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 20,
                              fontFamily: "POPPINS",
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 10),
                    Container(
                        height: 60,
                        color: Colors.white,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(fontSize: 20,
                              fontFamily: "POPPINS",
                              color: Colors.grey),
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("name"),
                            hintStyle: TextStyle(color: Colors.grey,
                              fontSize: 20,
                              fontFamily: "POPPINS",
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 15),
                    Container(
                        height: 60,
                        color: Colors.white,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "POPPINS",
                              color: Colors.grey),
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("email"),
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 20,
                              fontFamily: "POPPINS",),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 15),
                    Container(
                        height: 60,
                        color: Colors.white,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(fontSize: 20,
                              fontFamily: "POPPINS",
                              color: Colors.grey),
                          keyboardType: TextInputType.number,
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("phone"),
                            hintStyle: TextStyle(color: Colors.grey,
                                fontFamily: "POPPINS",
                                fontSize: 20
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 25),
                    GestureDetector(
                      onTap: () {
                        //todo submit
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.12,
                        height: 60,
                        decoration: BoxDecoration(
                          color: App.purple,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Text(App_Localization.of(context).translate("submit").toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "POPPINS",
                                fontSize:20
                            ),),
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/popUp.png"),
                    fit: BoxFit.cover
                )
            ),
          )
        ],
      ),
    );
  }
  largepopUp(BuildContext context,HomeController homeController){
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.25,
      color: App.primery,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 35),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.28,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(App_Localization.of(context).translate("hello").toUpperCase() + "!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: "POPPINS",
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(App_Localization.of(context).translate("leave_your_details"),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 15,
                              fontFamily: "POPPINS",
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 10),
                    Container(
                        height: 40,
                        color: Colors.white,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(fontSize: 16,
                              fontFamily: "POPPINS",
                              color: Colors.grey),
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("name"),
                            hintStyle: TextStyle(color: Colors.grey,
                              fontSize: 16,
                              fontFamily: "POPPINS",
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 15),
                    Container(
                        height: 40,
                        color: Colors.white,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "POPPINS",
                              color: Colors.grey),
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("email"),
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 16,
                              fontFamily: "POPPINS",),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 15),
                    Container(
                        height: 40,
                        color: Colors.white,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(fontSize: 16,
                              fontFamily: "POPPINS",
                              color: Colors.grey),
                          keyboardType: TextInputType.number,
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("phone"),
                            hintStyle: TextStyle(color: Colors.grey,
                                fontFamily: "POPPINS",
                                fontSize: 16
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 25),
                    GestureDetector(
                      onTap: () {
                        //todo submit
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.12,
                        height: 40,
                        decoration: BoxDecoration(
                          color: App.purple,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Text(App_Localization.of(context).translate("submit").toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "POPPINS",
                                fontSize:16
                            ),),
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/popUp.png"),
                    fit: BoxFit.cover
                )
            ),
          )
        ],
      ),
    );
  }
  bigpopUp(BuildContext context,HomeController homeController){
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.25,
      color: App.primery,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.33,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(App_Localization.of(context).translate("hello").toUpperCase() + "!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: "POPPINS",
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(App_Localization.of(context).translate("leave_your_details"),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 12,
                              fontFamily: "POPPINS",
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 5),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 35,
                        color: Colors.white,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(fontSize: 12,
                              fontFamily: "POPPINS",
                              color: Colors.grey),
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("name"),
                            hintStyle: TextStyle(color: Colors.grey,
                              fontSize: 12,
                              fontFamily: "POPPINS",
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 10),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 35,
                        color: Colors.white,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "POPPINS",
                              color: Colors.grey),
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("email"),
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 12,
                              fontFamily: "POPPINS",),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 10),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 35,
                        color: Colors.white,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(fontSize: 12,
                              fontFamily: "POPPINS",
                              color: Colors.grey),
                          keyboardType: TextInputType.number,
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("phone"),
                            hintStyle: TextStyle(color: Colors.grey,
                                fontFamily: "POPPINS",
                                fontSize: 12
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        //todo submit
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.12,
                        height: 35,
                        decoration: BoxDecoration(
                          color: App.purple,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Text(App_Localization.of(context).translate("submit").toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "POPPINS",
                                fontSize:12
                            ),),
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.16,
            height: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/popUp.png"),
                    fit: BoxFit.cover
                )
            ),
          )
        ],
      ),
    );
  }
  midpopUp(BuildContext context,HomeController homeController){
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.width * 0.35,
      color: App.primery,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.33,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(App_Localization.of(context).translate("hello").toUpperCase() + "!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: "POPPINS",
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Center(
                          child: Text(App_Localization.of(context).translate("leave_your_details"),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 10,
                              fontFamily: "POPPINS",
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 5),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: 30,
                        color: Colors.white,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(fontSize: 10,
                              fontFamily: "POPPINS",
                              color: Colors.grey),
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("name"),
                            hintStyle: TextStyle(color: Colors.grey,
                              fontSize: 10,
                              fontFamily: "POPPINS",
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 10),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: 30,
                        color: Colors.white,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: "POPPINS",
                              color: Colors.grey),
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("email"),
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 10,
                              fontFamily: "POPPINS",),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 10),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: 30,
                        color: Colors.white,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(fontSize: 10,
                              fontFamily: "POPPINS",
                              color: Colors.grey),
                          keyboardType: TextInputType.number,
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate("phone"),
                            hintStyle: TextStyle(color: Colors.grey,
                                fontFamily: "POPPINS",
                                fontSize: 10
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        //todo submit
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.14,
                        height: 30,
                        decoration: BoxDecoration(
                          color: App.purple,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Text(App_Localization.of(context).translate("submit").toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "POPPINS",
                                fontSize:10
                            ),),
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/popUp.png"),
                    fit: BoxFit.cover
                )
            ),
          )
        ],
      ),
    );
  }

}
