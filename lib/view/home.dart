import 'package:animals/view/about.dart';
import 'package:animals/view/blogs.dart';
import 'package:animals/view/contact.dart';
import 'package:animals/view/events.dart';
import 'package:animals/view/gallery.dart';
import 'package:animals/view/homeHeader.dart';
import 'package:animals/view/on_hover.dart';
import 'package:animals/view/rate.dart';
import 'package:animals/view/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              homeController.btmNavBarIndex.value == 5 ? homeController.selectedNews.value == 0? Events() : Blogs() :
              Contact();
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
                    MediaQuery.of(context).size.width>App.extra2 ? extra2Home(context) :
                    MediaQuery.of(context).size.width > App.xLarge ? xLargHome(context) :
                    MediaQuery.of(context).size.width > App.xLarge2 ? xLarg2Home(context) :
                    MediaQuery.of(context).size.width>App.larg?largHome(context) :
                    MediaQuery.of(context).size.width>App.larg2?larg2Home(context)
                        : bigHome(context)
                ),
              ),
            ),
           // GestureDetector(
           //   onTap: (){
           //     homeController.popUp.value = false;
           //   },
           //   child: homeController.popUp.value ? Container(
           //       width: MediaQuery.of(context).size.width,
           //       height: MediaQuery.of(context).size.height,
           //       color: Colors.black.withOpacity(0.5),
           //       child: Column(
           //         mainAxisAlignment: MainAxisAlignment.center,
           //         children: [
           //           SizedBox(height: MediaQuery.of(context).size.width * 0.13),
           //           popUp(context, homeController),
           //         ],
           //       )
           //   ) : Text(''),
           // )
          ],
        )
      ),
    );
  }
  slider(BuildContext context,double wBigText,double fontSizeBigText,double bookfontSize,double wBook,double hBook, pointPadding, double pointWidth,double pointHeight){
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.45,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: CarouselSlider(
            items: homeController.banner.map((e){
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.45,
                  child: CachedNetworkImage(
                    imageUrl: e.image!,
                    imageBuilder: (context, imageProvider) => Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width*0.15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: wBigText,
                              child: Text(homeController.banner[homeController.selectedSlider.value].title!,
                                style: TextStyle(
                                    fontFamily: "POPPINS",
                                    color: Colors.white,
                                    height: 1.2,
                                    letterSpacing: 2,
                                    fontSize: fontSizeBigText,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                            bookAnAssessmentButton(context, wBook, hBook, "book_an_assessment", bookfontSize)
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
                homeController.selectedSlider.value=index;
              },
            ),
          ),
        ),
        Positioned(
          bottom: pointPadding,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:homeController.banner.map((e) {
                return  Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    width: pointWidth,
                    height: pointHeight,
                    decoration: BoxDecoration(
                      color: homeController.selectedSlider.value == homeController.banner.indexOf(e)
                          ? Colors.white
                          : Colors.grey.withOpacity(0.6),
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
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
  about(BuildContext context,double height1, double height2,double headingFontSize,bodyFontSize){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: height1,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: height2,
              color: App.primery,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Align(alignment: Alignment.centerLeft,
                        child: Text(homeController.aboutHomePage!.subTitle!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: headingFontSize,
                              fontFamily: "FOUNDRYGRIDNIK"
                          ), textAlign: TextAlign.left,maxLines: 2,)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width*0.02),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(homeController.aboutHomePage!.jsonData![0].data,
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: bodyFontSize,
                          fontFamily: "POPPINS",
                          color: Colors.white.withOpacity(0.8)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width*0.02),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(homeController.aboutHomePage!.jsonData![1].data,
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize: bodyFontSize,
                            fontFamily: "POPPINS",
                            color: Colors.white.withOpacity(0.8)),
                        textAlign: TextAlign.left
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: height2,
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
  brands({required int count, required double ratio, required List<Post> posts, required double height,required double padding,required double boderWidth}) {
    return Container(
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
                //todo brand page
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.withOpacity(0.9),width: boderWidth)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: Image.network(posts[index]
                        .image!
                    ),
                  )
              ),
            );
          }),
    );
  }
  reviews(BuildContext context,double whIcon, double iconSize,double wBigContainer,double hBigContainer,double hCarouselSlider, double hQuotation1,double hQuotation2,double wQuotation,double wSizebox,double hSizeBox,double wText,double fontSize,double hText2,double wImg) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            carouselController.previousPage(duration: Duration(milliseconds: 700));
          },
          child: Container(
            height: whIcon,
            width: whIcon,
            child: Icon(Icons.arrow_back_ios_outlined,size: iconSize,color: App.primery,),
          ),
        ),
        Container(
          width: wBigContainer,
          height: hBigContainer,
          child: CarouselSlider.builder(
            carouselController: carouselController,
            options: CarouselOptions(
                height: hCarouselSlider,
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
                    height: hQuotation1,
                    child: Center(
                      child: Container(
                        height: hQuotation2,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/image/Quotation.svg",width: wQuotation)
                              ],
                            ),
                            SizedBox(width: wSizebox,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: wText,
                                  child: Align(alignment: Alignment.centerLeft,child:
                                  Text(homeController.reviews[index].title!,
                                      style: TextStyle(
                                        fontFamily: "POPPINS",
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,color: App.primery,
                                        fontSize: fontSize,
                                      ), textAlign: TextAlign.left,maxLines: 1),
                                  ),
                                ),
                                SizedBox(height: hSizeBox),
                                Container(
                                  width: wText,
                                  height: hText2,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Text(homeController.reviews[index].stringDescription!,
                                      style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: fontSize,
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
                    width: wImg,
                    height: hQuotation1,
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
            height: whIcon,
            width: whIcon,
            child: Icon(Icons.arrow_forward_ios_outlined,size: iconSize,color: App.primery,),
          ),
        )
      ],
    );
  }
  bigText(BuildContext context,String translate,double fontSize,) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
          child: Container(
            width: MediaQuery.of(context).size.width*0.5,
            child: Center(child: Text(App_Localization.of(context).translate(translate).toUpperCase(),
                style: TextStyle(
                    color: App.primery,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    fontFamily: "FOUNDRYGRIDNIK"
                ))),
          ),
        ),
      ),
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
  textgreenBlock(BuildContext context,String translate,double fontSize) {
    return Text(App_Localization.of(context).translate(translate),
        style: TextStyle(color: Colors.white,
            fontSize: fontSize,
            fontFamily: "FOUNDRYGRIDNIK",
            fontWeight: FontWeight.bold
        )
    );
  }
  popUp(BuildContext context,HomeController homeController,double wBigContainer,double hBigContainer,double hSmallContainer,double padding,String translate1,String translate2, String translate3,String translate4,String translate5,String translate6,double fontSize,double hTextField,double wSubmit,double hSubmit,double wImg,double hImg) {
    return Container(
      width: wBigContainer,
      height: hBigContainer,
      color: App.primery,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: padding),
              child: Container(
                width: hSmallContainer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(App_Localization.of(context).translate(translate1).toUpperCase() + "!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSize,
                          letterSpacing: 2,
                          fontFamily: "POPPINS",
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(App_Localization.of(context).translate(translate2),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: fontSize,
                              letterSpacing: 2,
                              fontFamily: "POPPINS",
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                    ),
                    SizedBox(height: 5),
                    Container(
                        height: hTextField,
                        color: Colors.white,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(fontSize: fontSize,
                              letterSpacing: 2,
                              fontFamily: "POPPINS",
                              color: Colors.grey),
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate(translate3),
                            hintStyle: TextStyle(color: Colors.grey,
                              fontSize: fontSize,
                              letterSpacing: 2,
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
                        height: hTextField,
                        color: Colors.white,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(
                              fontSize: fontSize,
                              letterSpacing: 2,
                              fontFamily: "POPPINS",
                              color: Colors.grey),
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate(translate4),
                            hintStyle: TextStyle(color: Colors.grey,fontSize: fontSize, letterSpacing: 2,
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
                        height: hTextField,
                        color: Colors.white,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          style: TextStyle(fontSize: fontSize,
                              fontFamily: "POPPINS",
                              letterSpacing: 2,
                              color: Colors.grey),
                          keyboardType: TextInputType.number,
                          decoration:  InputDecoration(
                            hintText: App_Localization.of(context).translate(translate5),
                            hintStyle: TextStyle(color: Colors.grey,
                                fontFamily: "POPPINS",
                                fontSize: fontSize,
                              letterSpacing: 2,
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
                        width: wSubmit,
                        height: hSubmit,
                        decoration: BoxDecoration(
                          color: App.purple,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Text(App_Localization.of(context).translate(translate6).toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "POPPINS",
                                fontSize:fontSize,
                              letterSpacing: 2
                            ),),
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: wImg,
              height: hImg,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/popUp.png"),
                      fit: BoxFit.cover
                  )
              ),
            ),
          )
        ],
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
              SizedBox(height: MediaQuery.of(context).size.width*0.14),
              slider(context, MediaQuery.of(context).size.width * 0.35, 75, 23, MediaQuery.of(context).size.width * 0.14, 70, 70, 20, 20),
              bigText(context, "services", 70),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.08),
                child: servicesList(count:1,ratio:1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.13,
                  radius:60,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 60,op: 1,
                  mainAxisSpacing: 20,crossAxisSpacing: 20,fontSize: 23,hPadding: 40,vPadding: 15),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              about(context,MediaQuery.of(context).size.width*0.3,MediaQuery.of(context).size.width*0.25,60,23),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    bigText(context, "partner_brands", 70),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                    Container(
                      child: Center(
                        child:brands(count:1,ratio:1,posts:homeController.brand,height:MediaQuery.of(context).size.width*0.09,
                            padding: 15,boderWidth: 2),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.1,
                color: App.green,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textgreenBlock(context, "love_your_pets", 50),
                      SizedBox(height: 30),
                      bookAnAssessmentButton(context, MediaQuery.of(context).size.width * 0.14, 70,"book_an_assessment",23)
                    ],
                  ),
                ),
              ),
              bigText(context, "reviews", 70),
              reviews(context,200,100,MediaQuery.of(context).size.width - 400,MediaQuery.of(context).size.width * 0.23,
                      MediaQuery.of(context).size.width * 0.2, MediaQuery.of(context).size.width * 0.18,
                      MediaQuery.of(context).size.width * 0.15,100,30,30,MediaQuery.of(context).size.width * 0.4,23,
                  MediaQuery.of(context).size.width * 0.1,MediaQuery.of(context).size.width * 0.3
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.02),
              App.footer(context,homeController),
              App.copyrights(context, 50, 23),
            ],
          ),
        ),
        Positioned(child: HomeHeader()),
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
                  ///stop here
                  popUp(context, homeController, MediaQuery.of(context).size.width * 0.5, MediaQuery.of(context).size.width * 0.25,
                      MediaQuery.of(context).size.width * 0.27,50,"hello","leave_your_details","name","email","phone","submit",
                      23, 70,MediaQuery.of(context).size.width * 0.13,70,MediaQuery.of(context).size.width * 0.16, MediaQuery.of(context).size.width * 0.25)
                ],
              )
          ) : Text(''),
        ),
        homeController.loading.value
            ? Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white.withOpacity(0.5),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    color: App.primery.withOpacity(0.5),
                    strokeWidth: 10,
                  ),
                ),
              ),
            ))
            : const Center()
      ],
    );
  }

  //************************ Extra2 ************************
  extra2Home(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          controller: App.scrollController,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width*0.13),
              slider(context, MediaQuery.of(context).size.width * 0.35, 70, 21, MediaQuery.of(context).size.width * 0.15, 65, 65, 18, 18),
              bigText(context, "services", 65),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.08),
                child: servicesList(count:1,ratio:1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.13,
                    radius:60,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 60,op: 1,
                    mainAxisSpacing: 20,crossAxisSpacing: 20,fontSize: 21,hPadding: 40,vPadding: 15),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              about(context,MediaQuery.of(context).size.width*0.3,MediaQuery.of(context).size.width*0.25,55,21),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    bigText(context, "partner_brands", 65),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                    Container(
                      child: Center(
                        child:brands(count:1,ratio:1,posts:homeController.brand,height:MediaQuery.of(context).size.width*0.09,
                            padding: 15,boderWidth: 2),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.1,
                color: App.green,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textgreenBlock(context, "love_your_pets", 45),
                      SizedBox(height: 30),
                      bookAnAssessmentButton(context, MediaQuery.of(context).size.width * 0.15, 65,"book_an_assessment",21)
                    ],
                  ),
                ),
              ),
              bigText(context, "reviews", 65),
              reviews(context,190,90,MediaQuery.of(context).size.width - 380,MediaQuery.of(context).size.width * 0.23,
                  MediaQuery.of(context).size.width * 0.2, MediaQuery.of(context).size.width * 0.18,
                  MediaQuery.of(context).size.width * 0.15,100,30,30,MediaQuery.of(context).size.width * 0.4,21,
                  MediaQuery.of(context).size.width * 0.1,MediaQuery.of(context).size.width * 0.3
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.02),
              App.footer(context,homeController),
              App.copyrights(context,45, 21)
            ],
          ),
        ),
        Positioned(child: HomeHeader()),
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
                  ///stop here
                  popUp(context, homeController, MediaQuery.of(context).size.width * 0.52, MediaQuery.of(context).size.width * 0.25,
                      MediaQuery.of(context).size.width * 0.28,45,"hello","leave_your_details","name","email","phone","submit",
                      21, 65,MediaQuery.of(context).size.width * 0.14,65,MediaQuery.of(context).size.width * 0.16, MediaQuery.of(context).size.width * 0.25)
                ],
              )
          ) : Text(''),
        ),
        homeController.loading.value
            ? Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white.withOpacity(0.5),
              child: Center(
                child: Container(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    color: App.primery.withOpacity(0.5),
                    strokeWidth: 8,
                  ),
                ),
              ),
            ))
            : const Center()
      ],
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
              SizedBox(height: MediaQuery.of(context).size.width*0.13),
              slider(context, MediaQuery.of(context).size.width * 0.35, 60, 19, MediaQuery.of(context).size.width * 0.16, 60, 60, 16, 16),
              bigText(context, "services", 60),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.08),
                child: servicesList(count:1,ratio:1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.13,
                    radius:60,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 60,op: 1,
                    mainAxisSpacing: 20,crossAxisSpacing: 20,fontSize: 19,hPadding: 30,vPadding: 10),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              about(context,MediaQuery.of(context).size.width*0.3,MediaQuery.of(context).size.width*0.27,50,19),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    bigText(context, "partner_brands", 60),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                    Container(
                      child: Center(
                        child:brands(count:1,ratio:1,posts:homeController.brand,height:MediaQuery.of(context).size.width*0.09,
                            padding: 13,boderWidth: 1.8),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.1,
                color: App.green,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textgreenBlock(context, "love_your_pets", 40),
                      SizedBox(height: 30),
                      bookAnAssessmentButton(context, MediaQuery.of(context).size.width * 0.16, 60,"book_an_assessment",19)
                    ],
                  ),
                ),
              ),
              bigText(context, "reviews", 60),
              reviews(context,150,80,MediaQuery.of(context).size.width - 300,MediaQuery.of(context).size.width * 0.23,
                  MediaQuery.of(context).size.width * 0.2, MediaQuery.of(context).size.width * 0.2,
                  MediaQuery.of(context).size.width * 0.15,90,30,30,MediaQuery.of(context).size.width * 0.4,19,
                  MediaQuery.of(context).size.width * 0.1,MediaQuery.of(context).size.width * 0.3
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.02),
              App.footer(context,homeController),
              App.copyrights(context,40, 19)
            ],
          ),
        ),
        Positioned(child: HomeHeader()),
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
                  popUp(context, homeController, MediaQuery.of(context).size.width * 0.54, MediaQuery.of(context).size.width * 0.26,
                      MediaQuery.of(context).size.width * 0.295,40,"hello","leave_your_details","name","email","phone","submit",
                      19, 60,MediaQuery.of(context).size.width * 0.15,60,MediaQuery.of(context).size.width * 0.16, MediaQuery.of(context).size.width * 0.26)
                ],
              )
          ) : Text(''),
        ),
        homeController.loading.value
            ? Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white.withOpacity(0.5),
              child: Center(
                child: Container(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    color: App.primery.withOpacity(0.5),
                    strokeWidth: 7,
                  ),
                ),
              ),
            ))
            : const Center()
      ],
    );
  }

  //************************ xLarge ************************
  xLarg2Home(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          controller: App.scrollController,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width*0.14),
              slider(context, MediaQuery.of(context).size.width * 0.35, 50, 17, MediaQuery.of(context).size.width * 0.17, 55, 55, 14, 14),
              bigText(context, "services", 55),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.07),
                child: servicesList(count:1,ratio:1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.13,
                    radius:60,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 60,op: 1,
                    mainAxisSpacing: 20,crossAxisSpacing: 20,fontSize: 17,hPadding: 15,vPadding: 10),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              about(context,MediaQuery.of(context).size.width*0.3,MediaQuery.of(context).size.width*0.27,45,17),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    bigText(context, "partner_brands", 55),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                    Container(
                      child: Center(
                        child:brands(count:1,ratio:1,posts:homeController.brand,height:MediaQuery.of(context).size.width*0.09,
                            padding: 13,boderWidth: 1.2),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.1,
                color: App.green,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textgreenBlock(context, "love_your_pets", 35),
                      SizedBox(height: 30),
                      bookAnAssessmentButton(context, MediaQuery.of(context).size.width * 0.17, 55,"book_an_assessment",17)
                    ],
                  ),
                ),
              ),
              textgreenBlock(context, "reviews", 35),
              reviews(context,150,70,MediaQuery.of(context).size.width - 300,MediaQuery.of(context).size.width * 0.23,
                  MediaQuery.of(context).size.width * 0.2, MediaQuery.of(context).size.width * 0.18,
                  MediaQuery.of(context).size.width * 0.15,80,30,30,MediaQuery.of(context).size.width * 0.4,17,
                  MediaQuery.of(context).size.width * 0.1,MediaQuery.of(context).size.width * 0.3
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.02),
              App.footer(context,homeController),
              App.copyrights(context,35, 17)
            ],
          ),
        ),
        Positioned(child: HomeHeader()),
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
                  popUp(context, homeController, MediaQuery.of(context).size.width * 0.56, MediaQuery.of(context).size.width * 0.28,
                      MediaQuery.of(context).size.width * 0.32,35,"hello","leave_your_details","name","email","phone","submit",
                      17, 55,MediaQuery.of(context).size.width * 0.16,55,MediaQuery.of(context).size.width * 0.17, MediaQuery.of(context).size.width * 0.28)
                ],
              )
          ) : Text(''),
        ),
        homeController.loading.value
            ? Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white.withOpacity(0.5),
              child: Center(
                child: Container(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                    color: App.primery.withOpacity(0.5),
                    strokeWidth: 6,
                  ),
                ),
              ),
            ))
            : const Center()
      ],
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
              SizedBox(height: MediaQuery.of(context).size.width*0.14),
              slider(context, MediaQuery.of(context).size.width * 0.35, 35, 15, MediaQuery.of(context).size.width * 0.18, 50, 50, 12, 12),
              bigText(context, "services", 45),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                child: servicesList(count:1,ratio:1,posts:homeController.service,height:MediaQuery.of(context).size.width*0.13,
                    radius:50,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 50,op: 1,
                    mainAxisSpacing: 20,crossAxisSpacing: 20,fontSize: 15,hPadding: 10,vPadding: 8),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              about(context, MediaQuery.of(context).size.width > 1400 ?
              MediaQuery.of(context).size.width*0.25 : MediaQuery.of(context).size.width*0.3,
                  MediaQuery.of(context).size.width > 1400 ?
                  MediaQuery.of(context).size.width*0.25 : MediaQuery.of(context).size.width*0.3
                  ,35,15),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    bigText(context, "partner_brands", 45),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                    Container(
                      child: Center(
                        child:brands(count:1,ratio:1,posts:homeController.brand,height:MediaQuery.of(context).size.width*0.09,
                            padding: 11,boderWidth: 1),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.11,
                color: App.green,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textgreenBlock(context, "love_your_pets", 25),
                      SizedBox(height: 30),
                      bookAnAssessmentButton(context, MediaQuery.of(context).size.width * 0.18, 50,"book_an_assessment",15)
                    ],
                  ),
                ),
              ),
              bigText(context, "reviews", 45),
              reviews(context,100,50,MediaQuery.of(context).size.width - 200,MediaQuery.of(context).size.width * 0.22,
                  MediaQuery.of(context).size.width * 0.17, MediaQuery.of(context).size.width * 0.17,
                  MediaQuery.of(context).size.width * 0.12,60,25,25,MediaQuery.of(context).size.width * 0.4,15,
                  MediaQuery.of(context).size.width * 0.08,MediaQuery.of(context).size.width * 0.3
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.02),
              App.footer(context,homeController),
              App.copyrights(context,30, 15)
            ],
          ),
        ),
        Positioned(child: HomeHeader()),
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
                  popUp(context, homeController, MediaQuery.of(context).size.width * 0.54, MediaQuery.of(context).size.width * 0.28,
                      MediaQuery.of(context).size.width * 0.3,18,"hello","leave_your_details","name","email","phone","submit",
                      15, 45,MediaQuery.of(context).size.width * 0.17,45,MediaQuery.of(context).size.width * 0.17, MediaQuery.of(context).size.width * 0.28)
                ],
              )
          ) : Text(''),
        ),
        homeController.loading.value
            ? Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white.withOpacity(0.5),
              child: Center(
                child: Container(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: App.primery.withOpacity(0.5),
                    strokeWidth: 5,
                  ),
                ),
              ),
            ))
            : const Center()
      ],
    );
  }

  //************************ Large2 ************************
  larg2Home(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          controller: App.scrollController,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width*0.16),
              slider(context, MediaQuery.of(context).size.width * 0.36, 30, 12,
                  MediaQuery.of(context).size.width > 1200 ? MediaQuery.of(context).size.width * 0.16 : MediaQuery.of(context).size.width * 0.19
                  , 40, 40, 10, 10),
              bigText(context, "services", 35),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                child: servicesList(count:1,ratio:0.95,posts:homeController.service,height:MediaQuery.of(context).size.width*0.135,
                    radius:35,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 35,op: 1,
                    mainAxisSpacing: 5,crossAxisSpacing: 5,fontSize: 12,hPadding: 10,
                    vPadding: MediaQuery.of(context).size.width > 1150 ? 8 : 5
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              about(context, MediaQuery.of(context).size.width > 1200 ?
                  MediaQuery.of(context).size.width*0.28 : MediaQuery.of(context).size.width*0.32,
                  MediaQuery.of(context).size.width > 1150 ?
                  MediaQuery.of(context).size.width*0.28 : MediaQuery.of(context).size.width*0.32
                  ,30,12),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.width*0.01),
                    bigText(context, "partner_brands", 35),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                    Container(
                      child: Center(
                        child:brands(count:1,ratio:1,posts:homeController.brand,height:MediaQuery.of(context).size.width*0.09,
                            padding: 8,boderWidth: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.12,
                color: App.green,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textgreenBlock(context, "love_your_pets", 20),
                      SizedBox(height: 25),
                      bookAnAssessmentButton(context, MediaQuery.of(context).size.width > 1200 ? MediaQuery.of(context).size.width * 0.16 : MediaQuery.of(context).size.width * 0.19
                          , 40,"book_an_assessment",12)
                    ],
                  ),
                ),
              ),
              bigText(context, "reviews", 35),
              reviews(context,100,50,MediaQuery.of(context).size.width - 200,MediaQuery.of(context).size.width * 0.2,
                  MediaQuery.of(context).size.width * 0.17, MediaQuery.of(context).size.width * 0.17,
                  MediaQuery.of(context).size.width * 0.12,50,20,20,
                  MediaQuery.of(context).size.width > 1200 ? MediaQuery.of(context).size.width * 0.4 :MediaQuery.of(context).size.width * 0.35
                  ,12, MediaQuery.of(context).size.width * 0.07,MediaQuery.of(context).size.width * 0.3
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.02),
              App.footer(context,homeController),
              App.copyrights(context,25, 12)
            ],
          ),
        ),
        Positioned(child: HomeHeader()),
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
                  MediaQuery.of(context).size.width > 1150 ?
                  popUp(context, homeController, MediaQuery.of(context).size.width * 0.56 , MediaQuery.of(context).size.width * 0.28,
                      MediaQuery.of(context).size.width * 0.31,20,"hello","leave_your_details","name","email","phone","submit",
                      12, 40,MediaQuery.of(context).size.width * 0.15, 40
                      ,MediaQuery.of(context).size.width * 0.17,MediaQuery.of(context).size.width * 0.28) :
                  popUp(context, homeController,MediaQuery.of(context).size.width * 0.6,MediaQuery.of(context).size.width * 0.33,
                      MediaQuery.of(context).size.width * 0.31,20,"hello","leave_your_details","name","email","phone","submit",
                      12, 40,MediaQuery.of(context).size.width * 0.18, 40
                      ,MediaQuery.of(context).size.width * 0.2,MediaQuery.of(context).size.width * 0.33)
                ],
              )
          ) : Text(''),
        ),
        homeController.loading.value
            ? Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white.withOpacity(0.5),
              child: Center(
                child: Container(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    color: App.primery.withOpacity(0.5),
                    strokeWidth: 4,
                  ),
                ),
              ),
            ))
            : const Center()
      ],
    );
  }

  //************************ big ************************
  bigHome(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          controller: App.scrollController,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width*0.16),
              slider(context, MediaQuery.of(context).size.width * 0.39, 25, 10,
                  MediaQuery.of(context).size.width > 850 ? MediaQuery.of(context).size.width * 0.19 : MediaQuery.of(context).size.width * 0.23,
                  35, 30, 8, 8),
              bigText(context, "services", 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.14),
                child: mobileservicesList(count:3,ratio: 1,posts:homeController.service,
                    radius: 25,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 25,op: 1,
                    mainAxisSpacing: 20,crossAxisSpacing: 25,fontSize: 10,hPadding: 20,
                    vPadding: MediaQuery.of(context).size.width > 850 ? 12 : 9
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03),
              about(context, MediaQuery.of(context).size.width > 800 ?
              MediaQuery.of(context).size.width*0.35 : MediaQuery.of(context).size.width*0.43,
                  MediaQuery.of(context).size.width > 800 ?
                  MediaQuery.of(context).size.width*0.35 : MediaQuery.of(context).size.width*0.43
                  ,25,10),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.width*0.02),
                    bigText(context, "partner_brands", 30),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                    Container(
                      child: Center(
                        child:brands(count:1,ratio:1,posts:homeController.brand,height:MediaQuery.of(context).size.width*0.09,
                            padding: 5,boderWidth: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03),
              Container(
                width: MediaQuery.of(context).size.width,
                color: App.green,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textgreenBlock(context, "love_your_pets", 15),
                      SizedBox(height: 20),
                      bookAnAssessmentButton(context,MediaQuery.of(context).size.width > 850 ? MediaQuery.of(context).size.width * 0.19 : MediaQuery.of(context).size.width * 0.23,
                          35,"book_an_assessment",10)
                    ],
                  ),
                ),
              ),
              bigText(context, "reviews", 30),
              reviews(context,70,40,MediaQuery.of(context).size.width - 140,MediaQuery.of(context).size.width * 0.25,
                  MediaQuery.of(context).size.width * 0.2, MediaQuery.of(context).size.width * 0.2,
                  MediaQuery.of(context).size.width * 0.15,30,10,10,
                  MediaQuery.of(context).size.width * 0.35
                  ,10, MediaQuery.of(context).size.width * 0.09,MediaQuery.of(context).size.width * 0.3
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              App.footer(context,homeController),
              App.copyrights(context,20, 10)
            ],
          ),
        ),
        Positioned(child: HomeHeader()),
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
                  MediaQuery.of(context).size.width > 800 ?
                  popUp(context, homeController, MediaQuery.of(context).size.width * 0.67 , MediaQuery.of(context).size.width * 0.35,
                      MediaQuery.of(context).size.width * 0.35,18,"hello","leave_your_details","name","email","phone","submit",
                      10, 35,MediaQuery.of(context).size.width * 0.18, 35
                      ,MediaQuery.of(context).size.width * 0.22,MediaQuery.of(context).size.width * 0.35) :
                  popUp(context, homeController,MediaQuery.of(context).size.width * 0.72,MediaQuery.of(context).size.width * 0.43,
                      MediaQuery.of(context).size.width * 0.36,20,"hello","leave_your_details","name","email","phone","submit",
                      10,35,MediaQuery.of(context).size.width * 0.22, 35
                      ,MediaQuery.of(context).size.width * 0.26,MediaQuery.of(context).size.width * 0.43)
                ],
              )
          ) : Text(''),
        ),
        homeController.loading.value
            ? Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white.withOpacity(0.5),
              child: Center(
                child: Container(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: App.primery.withOpacity(0.5),
                    strokeWidth: 3,
                  ),
                ),
              ),
            ))
            :const Center()
      ],
    );
  }

}
