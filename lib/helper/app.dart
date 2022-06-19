import 'package:animals/app_localization.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/controller/shop_controller.dart';
import 'package:animals/helper/store.dart';
import 'package:animals/model/post.dart';
import 'package:animals/view/OnHoverHeader.dart';
import 'package:animals/view/on_hover.dart';
import 'package:animals/view/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

class App {

  static const Color primery = Color(0xffff6200);
  static const Color orange = Color(0xffff9628);
  static const Color secondry = Color(0xffffffff);
  static const Color grey = Color(0xfff5f5f5);
  static const Color green = Color(0xff00a550);
  static const Color lightOrang =  Color(0xffFFB380);
  static Color auto = Colors.black.withOpacity(0.75);
  static Color purple = Color(0xff662482);
  static Color blue = Color(0xff1174bb);

  static const double extra =  2500;
  static const double xLarge = 2000;
  static const double larg = 1500;
  static const double big = 1000;
  static const double mid = 700;


  static ScrollController scrollController = ScrollController();

  ////////////////// Services Colors  //////////////////
  static Color hexToColor(String? code) {
    try{
      if(code == null){
        return Colors.blue;
      }else{
        return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
      }
    }catch(e){
      return Colors.blue;
    }
  }

  ////////////////// FontSize //////////////////
  static largeFontSize(double width){
    if(width > 2500){
      return 25;
    }
    if(width > 2000){
      return 20;
    }
    if(width > 1500) {
      return 16;
    }
    else{
      return 13;
    }
  }

  static bookNow(){
    urlLauncher.launch("tel://+971547035736");
  }
  static search_suggestion(BuildContext context,List<String> sugesttions){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width*0.6,
          height: MediaQuery.of(context).size.height*0.5,
          color: Colors.red,
        ),
      ),
    );
  }
  static myDrawer(BuildContext context,HomeController homeController,GlobalKey<ScaffoldState> globalKey){
    return Drawer(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height*0.7,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.close,color: Colors.black,))
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.06,),
                //   Container(
                //   width: MediaQuery.of(context).size.width*0.7*0.2,
                //   height: MediaQuery.of(context).size.width*0.7*0.2,
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       image: DecorationImage(
                //           image: AssetImage("assets/image/logo.png"),
                //           fit: BoxFit.fill
                //       )
                //   ),
                // ),
                //   SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                titleHeader(context,0,"home",homeController,17),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                titleHeader(context,1,"about",homeController,17),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                titleHeader(context,2,"gallery",homeController,17),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                titleHeader(context,3,"contact",homeController,17),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                titleHeader(context,4,"cart",homeController,17),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ////////////////////////////////// Home //////////////////////////////////////

  ////////////////// Header //////////////////

  static header(BuildContext context,HomeController homeController,GlobalKey<ScaffoldState> globalKey) {
    return MediaQuery.of(context).size.width>App.extra?extraHeader(context,homeController) :
    MediaQuery.of(context).size.width>App.xLarge?xlargeHeader(context,homeController) :
    MediaQuery.of(context).size.width>App.larg?largeHeader(context,homeController)
        :MediaQuery.of(context).size.width>App.big?bigHeader(context,homeController)
        :mediumHeader(context,homeController);
  }
  static extraHeader(BuildContext context,HomeController homeController){
    return Container(
        height: MediaQuery.of(context).size.width * 0.13,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 55,
              color: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(App_Localization.of(context).translate("free_pet_pick_up"),
                          style: TextStyle(
                              color: secondry,
                              fontSize: 25,
                              fontFamily: "FOUNDRYGRIDNIK"
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        if(homeController.openCountry.value == false) {
                          homeController.openCountry.value = true;
                        } else {
                          homeController.openCountry.value = false;
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset("assets/image/Icon_AED.png",
                            width: 50, height: 50,),
                          homeController.openCountry.value == false ?
                          Icon(Icons.arrow_drop_down,color: Colors.white,size: 40,) :
                          Icon(Icons.arrow_drop_up,color: Colors.white,size: 40)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    if( homeController.btmNavBarIndex.value == 0 ){
                      scrollController.animateTo(
                          scrollController.position.minScrollExtent,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    }else{
                      homeController.btmNavBarIndex.value = 0 ;
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.13,
                        height:  MediaQuery.of(context).size.width * 0.13 - 55,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/image/logo.png"),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.13 - 55,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.4,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.circular(40)
                                          ),
                                          child: TextField(
                                            onSubmitted: (query){
                                              homeController.search(context, query);
                                            },
                                            style: TextStyle(
                                              fontSize: 25,
                                                fontFamily: "POPPINS"
                                            ),
                                            controller: homeController.searchController,
                                            decoration: InputDecoration(
                                              enabledBorder:const OutlineInputBorder(
                                                // width: 0.0 produces a thin "hairline" border
                                                borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                                              ),
                                              focusedBorder: const OutlineInputBorder(
                                                // width: 0.0 produces a thin "hairline" border
                                                borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                                              ),
                                              hintText: App_Localization.of(context).translate("search"),
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontSize: 25,
                                                  fontFamily: "POPPINS"
                                              ),
                                            ),
                                            textAlignVertical: TextAlignVertical.bottom,
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: GestureDetector(
                                              onTap: (){
                                                homeController.search(context, homeController.searchController.text);
                                              },
                                              child: OnHover(
                                                builder: (isHover){
                                                  return Container(
                                                    width: 90,
                                                    height: 70,
                                                    decoration: BoxDecoration(
                                                        color: isHover?App.lightOrang:App.primery,
                                                        borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(40),
                                                            bottomRight: Radius.circular(40))
                                                    ),
                                                    child: Icon(Icons.search,color: Colors.white,size: 50,),
                                                  );
                                                },
                                              )
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                      Container(
                        width: MediaQuery.of(context).size.width*0.35,
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.35,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  titleHeader(context,0,"home",homeController,25),
                                  titleHeader(context,1,"about",homeController,25),
                                  titleHeader(context,2,"services",homeController,25),
                                  titleHeader(context,3,"rates",homeController,25),
                                  titleHeader(context,4,"gallery",homeController,25),
                                  titleHeader(context,5,"news",homeController,25),
                                  titleHeader(context,6,"contact_us",homeController,25),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                    ],
                  ),
                ),
                SizedBox(width: 35,),
                Container(
                  height: MediaQuery.of(context).size.width*0.13 - 55,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(() => Shop());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          color: purple,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.025,
                                height: MediaQuery.of(context).size.width * 0.025,
                                child: Image.asset("assets/image/Icon_GoToShop.png",
                                ),
                              ),
                              SizedBox(height: 20),
                              Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.1 / 2,
                                    child: Text(App_Localization.of(context).translate("go_to_shop").toUpperCase(),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontFamily: "POPPINS",
                                          color: Colors.white ,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          height: 1.2
                                      ),),
                                  )
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          // homeController.btmNavBarIndex.value = 7;
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            color: primery,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.025,
                                    height: MediaQuery.of(context).size.width * 0.025,
                                    child: Image.asset("assets/image/Icon_Boarding.png",
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Center(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.1/2,
                                        child: Text(App_Localization.of(context).translate("book_a_boarding").toUpperCase(),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontFamily: "POPPINS",
                                              color: Colors.white ,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              height: 1.2
                                          ),),
                                      )
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
  static xlargeHeader(BuildContext context,HomeController homeController){
    return Container(
        height: MediaQuery.of(context).size.width * 0.12,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              color: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(App_Localization.of(context).translate("free_pet_pick_up"),
                          style: TextStyle(
                              color: secondry,
                              fontSize: 20,
                              fontFamily: "FOUNDRYGRIDNIK"
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        if(homeController.openCountry.value == false) {
                          homeController.openCountry.value = true;
                        } else {
                          homeController.openCountry.value = false;
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset("assets/image/Icon_AED.png",
                            width: 35, height: 35,),
                          homeController.openCountry.value == false ?
                          Icon(Icons.arrow_drop_down,color: Colors.white,size: 30,) :
                          Icon(Icons.arrow_drop_up,color: Colors.white,size: 30)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    if( homeController.btmNavBarIndex.value == 0 ){
                      scrollController.animateTo(
                          scrollController.position.minScrollExtent,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    }else{
                      homeController.btmNavBarIndex.value = 0 ;
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.12,
                        height:  MediaQuery.of(context).size.width * 0.12 - 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/image/logo.png"),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.12 - 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.4,
                                          height: 60,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.circular(40)
                                          ),
                                          child: TextField(
                                            onSubmitted: (query){
                                              homeController.search(context, query);
                                            },
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: "POPPINS"
                                            ),
                                            controller: homeController.searchController,
                                            decoration: InputDecoration(
                                              enabledBorder:const OutlineInputBorder(
                                                // width: 0.0 produces a thin "hairline" border
                                                borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                                              ),
                                              focusedBorder: const OutlineInputBorder(
                                                // width: 0.0 produces a thin "hairline" border
                                                borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                                              ),
                                              hintText: App_Localization.of(context).translate("search"),
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontSize: 20,
                                                  fontFamily: "POPPINS"
                                              ),
                                            ),
                                            textAlignVertical: TextAlignVertical.bottom,
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: GestureDetector(
                                              onTap: (){
                                                homeController.search(context, homeController.searchController.text);
                                              },
                                              child: OnHover(
                                                builder: (isHover){
                                                  return Container(
                                                    width: 80,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                        color: isHover?App.lightOrang:App.primery,
                                                        borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(40),
                                                            bottomRight: Radius.circular(40))
                                                    ),
                                                    child: Icon(Icons.search,color: Colors.white,size: 40,),
                                                  );
                                                },
                                              )
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.35,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  titleHeader(context,0,"home",homeController,20),
                                  titleHeader(context,1,"about",homeController,20),
                                  titleHeader(context,2,"services",homeController,20),
                                  titleHeader(context,3,"rates",homeController,20),
                                  titleHeader(context,4,"gallery",homeController,20),
                                  titleHeader(context,5,"news",homeController,20),
                                  titleHeader(context,6,"contact_us",homeController,20),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                    ],
                  ),
                ),
                SizedBox(width: 35,),
                Container(
                  height: MediaQuery.of(context).size.width*0.12 - 40,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(() => Shop());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          color: purple,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.025,
                                height: MediaQuery.of(context).size.width * 0.025,
                                child: Image.asset("assets/image/Icon_GoToShop.png",
                                ),
                              ),
                              SizedBox(height: 20),
                              Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.1 / 2,
                                    child: Text(App_Localization.of(context).translate("go_to_shop").toUpperCase(),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontFamily: "POPPINS",
                                          color: Colors.white ,
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                          height: 1.2
                                      ),),
                                  )
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          // homeController.btmNavBarIndex.value = 7;
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            color: primery,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.025,
                                    height: MediaQuery.of(context).size.width * 0.025,
                                    child: Image.asset("assets/image/Icon_Boarding.png",
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Center(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.1/2,
                                        child: Text(App_Localization.of(context).translate("book_a_boarding").toUpperCase(),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontFamily: "POPPINS",
                                              color: Colors.white ,
                                              fontSize: 21,
                                              fontWeight: FontWeight.bold,
                                              height: 1.2
                                          ),),
                                      )
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
  static largeHeader(BuildContext context,HomeController homeController){
    return Container(
      height: MediaQuery.of(context).size.width * 0.12,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 35,
            color: Colors.grey[900],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(App_Localization.of(context).translate("free_pet_pick_up"),
                        style: TextStyle(
                          color: secondry,
                          fontSize: 16,
                            fontFamily: "FOUNDRYGRIDNIK"
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      if(homeController.openCountry.value == false) {
                        homeController.openCountry.value = true;
                      } else {
                        homeController.openCountry.value = false;
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset("assets/image/Icon_AED.png",
                          width: 30, height: 30,),
                        homeController.openCountry.value == false ?
                        Icon(Icons.arrow_drop_down,color: Colors.white,size: 25,) :
                        Icon(Icons.arrow_drop_up,color: Colors.white,size: 25,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  if( homeController.btmNavBarIndex.value == 0 ){
                    scrollController.animateTo(
                        scrollController.position.minScrollExtent,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  }else{
                    homeController.btmNavBarIndex.value = 0 ;
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.12,
                      height:  MediaQuery.of(context).size.width * 0.12 - 35,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage("assets/image/logo.png"),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.12 - 35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: TextField(
                                          onSubmitted: (query){
                                            homeController.search(context, query);
                                          },
                                          style: TextStyle(
                                            fontSize: 16,
                                              fontFamily: "POPPINS"
                                          ),
                                          controller: homeController.searchController,
                                          decoration: InputDecoration(
                                            enabledBorder:const OutlineInputBorder(
                                              // width: 0.0 produces a thin "hairline" border
                                              borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                                            ),
                                            focusedBorder: const OutlineInputBorder(
                                              // width: 0.0 produces a thin "hairline" border
                                              borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                                            ),
                                            hintText: App_Localization.of(context).translate("search"),
                                            hintStyle: TextStyle(
                                                color: Colors.grey[500],
                                                fontSize: 16,
                                                fontFamily: "POPPINS"
                                            ),
                                          ),
                                          textAlignVertical: TextAlignVertical.bottom,
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        child: GestureDetector(
                                            onTap: (){
                                              homeController.search(context, homeController.searchController.text);
                                            },
                                            child: OnHover(
                                              builder: (isHover){
                                                return Container(
                                                  height: 40,
                                                  width: 45,
                                                  decoration: BoxDecoration(
                                                      color: isHover?App.lightOrang:App.primery,
                                                      borderRadius: BorderRadius.only(
                                                          topRight: Radius.circular(20),
                                                          bottomRight: Radius.circular(20))
                                                  ),
                                                  child: Icon(Icons.search,color: Colors.white,),
                                                );
                                              },
                                            )
                                        ),

                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                titleHeader(context,0,"home",homeController,largeFontSize(MediaQuery.of(context).size.width)),
                                titleHeader(context,1,"about",homeController,largeFontSize(MediaQuery.of(context).size.width)),
                                titleHeader(context,2,"services",homeController,largeFontSize(MediaQuery.of(context).size.width)),
                                titleHeader(context,3,"rates",homeController,largeFontSize(MediaQuery.of(context).size.width)),
                                titleHeader(context,4,"gallery",homeController,largeFontSize(MediaQuery.of(context).size.width)),
                                titleHeader(context,5,"news",homeController,largeFontSize(MediaQuery.of(context).size.width)),
                                titleHeader(context,6,"contact_us",homeController,largeFontSize(MediaQuery.of(context).size.width)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                  ],
                ),
              ),
              SizedBox(width: 35,),
              Container(
                height: MediaQuery.of(context).size.width*0.12 - 35,
                width: MediaQuery.of(context).size.width * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(() => Shop());
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          color: purple,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.025,
                                height: MediaQuery.of(context).size.width * 0.025,
                                child: Image.asset("assets/image/Icon_GoToShop.png",
                                ),
                              ),
                              SizedBox(height: 15),
                              Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.1 / 2,
                                    child: Text(App_Localization.of(context).translate("go_to_shop").toUpperCase(),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.white ,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          height: 1.2,
                                          fontFamily: "POPPINS"
                                      ),),
                                  )
                              )
                            ],
                          ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        // homeController.btmNavBarIndex.value = 7;
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          color: primery,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.025,
                                  height: MediaQuery.of(context).size.width * 0.025,
                                  child: Image.asset("assets/image/Icon_Boarding.png",
                                  ),
                                ),
                                SizedBox(height: 15),
                                Center(
                                  child: Container(
                                      width: MediaQuery.of(context).size.width * 0.1/2,
                                      child: Text(App_Localization.of(context).translate("book_a_boarding").toUpperCase(),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: Colors.white ,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            height: 1.2,
                                            fontFamily: "POPPINS"
                                        ),),
                                  )
                                ),
                              ],
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
  static bigHeader(BuildContext context,HomeController homeController){
    return Container(
        height: MediaQuery.of(context).size.width * 0.13,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 30,
              color: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(App_Localization.of(context).translate("free_pet_pick_up"),
                          style: TextStyle(color: secondry,
                              fontSize: 12,
                              fontFamily: "FOUNDRYGRIDNIK"
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        if(homeController.openCountry.value == false) {
                          homeController.openCountry.value = true;
                        } else {
                          homeController.openCountry.value = false;
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset("assets/image/Icon_AED.png",
                            width: 25, height: 25),
                          homeController.openCountry.value == false ?
                          Icon(Icons.arrow_drop_down,color: Colors.white,size: 20,) :
                          Icon(Icons.arrow_drop_up,color: Colors.white,size: 20)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    if( homeController.btmNavBarIndex.value == 0 ){
                      scrollController.animateTo(
                          scrollController.position.minScrollExtent,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    }else{
                      homeController.btmNavBarIndex.value = 0 ;
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.13,
                        height:  MediaQuery.of(context).size.width * 0.13 - 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/image/logo.png"),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.13 - 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: 35,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.45,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: TextField(
                                            onSubmitted: (query){
                                              homeController.search(context, query);
                                            },
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "POPPINS"
                                            ),
                                            controller: homeController.searchController,
                                            decoration: InputDecoration(
                                              enabledBorder:const OutlineInputBorder(
                                                // width: 0.0 produces a thin "hairline" border
                                                borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                                              ),
                                              focusedBorder: const OutlineInputBorder(
                                                // width: 0.0 produces a thin "hairline" border
                                                borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                                              ),
                                              hintText: App_Localization.of(context).translate("search"),
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontSize: 12,
                                                  fontFamily: "POPPINS"
                                              ),
                                            ),
                                            textAlignVertical: TextAlignVertical.bottom,
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: GestureDetector(
                                              onTap: (){
                                                homeController.search(context, homeController.searchController.text);
                                              },
                                              child: OnHover(
                                                builder: (isHover){
                                                  return Container(
                                                    height: 35,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                        color: isHover?App.lightOrang:App.primery,
                                                        borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(20),
                                                            bottomRight: Radius.circular(20))
                                                    ),
                                                    child: Icon(Icons.search,color: Colors.white,),
                                                  );
                                                },
                                              )
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  titleHeader(context,0,"home",homeController,12),
                                  titleHeader(context,1,"about",homeController,12),
                                  titleHeader(context,2,"services",homeController,12),
                                  titleHeader(context,3,"rates",homeController,12),
                                  titleHeader(context,4,"gallery",homeController,12),
                                  titleHeader(context,5,"news",homeController,12),
                                  titleHeader(context,6,"contact_us",homeController,12),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.width * 0.13 - 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(() => Shop());
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            color: purple,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.025,
                                    height: MediaQuery.of(context).size.width * 0.025,
                                    child: Image.asset("assets/image/Icon_GoToShop.png",
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                  Center(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.1 / 2,
                                        child: Text(App_Localization.of(context).translate("go_to_shop").toUpperCase(),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: TextStyle(
                                              color: Colors.white ,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              height: 1.2,
                                              fontFamily: "POPPINS"
                                          ),),
                                      )
                                  )
                                ],
                              ),
                            )
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          // homeController.btmNavBarIndex.value = 7;
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            color: primery,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.025,
                                    height: MediaQuery.of(context).size.width * 0.025,
                                    child: Image.asset("assets/image/Icon_Boarding.png",
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                  Center(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.12/2,
                                        child: Text(App_Localization.of(context).translate("book_a_boarding").toUpperCase(),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              height: 1.2,
                                              fontFamily: "POPPINS"
                                          ),),
                                      )
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
  static mediumHeader(BuildContext context,HomeController homeController){
    return Container(
        height: MediaQuery.of(context).size.width * 0.15,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 25,
              color: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(App_Localization.of(context).translate("free_pet_pick_up"),
                          style: TextStyle(color: secondry,
                              fontSize: 10,
                              fontFamily: "FOUNDRYGRIDNIK"
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        if(homeController.openCountry.value == false) {
                          homeController.openCountry.value = true;
                        } else {
                          homeController.openCountry.value = false;
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset("assets/image/Icon_AED.png",
                              width: 20, height: 20),
                          homeController.openCountry.value == false ?
                          Icon(Icons.arrow_drop_down,color: Colors.white,size: 15,) :
                          Icon(Icons.arrow_drop_up,color: Colors.white,size: 15)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    if( homeController.btmNavBarIndex.value == 0 ){
                      scrollController.animateTo(
                          scrollController.position.minScrollExtent,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    }else{
                      homeController.btmNavBarIndex.value = 0 ;
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height:  MediaQuery.of(context).size.width * 0.15 - 25,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/image/logo.png"),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.15 - 25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: 30,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.43,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: TextField(
                                            onSubmitted: (query){
                                              homeController.search(context, query);
                                            },
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: "POPPINS"
                                            ),
                                            controller: homeController.searchController,
                                            decoration: InputDecoration(
                                              enabledBorder:const OutlineInputBorder(
                                                // width: 0.0 produces a thin "hairline" border
                                                borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                                              ),
                                              focusedBorder: const OutlineInputBorder(
                                                // width: 0.0 produces a thin "hairline" border
                                                borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                                              ),
                                              hintText: App_Localization.of(context).translate("search"),
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontSize: 10,
                                                  fontFamily: "POPPINS"
                                              ),
                                            ),
                                            textAlignVertical: TextAlignVertical.bottom,
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: GestureDetector(
                                              onTap: (){
                                                homeController.search(context, homeController.searchController.text);
                                              },
                                              child: OnHover(
                                                builder: (isHover){
                                                  return Container(
                                                    height: 30,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                        color: isHover?App.lightOrang:App.primery,
                                                        borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(20),
                                                            bottomRight: Radius.circular(20))
                                                    ),
                                                    child: Icon(Icons.search,color: Colors.white,size: 20,),
                                                  );
                                                },
                                              )
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  titleHeader(context,0,"home",homeController,9),
                                  titleHeader(context,1,"about",homeController,9),
                                  titleHeader(context,2,"services",homeController,9),
                                  titleHeader(context,3,"rates",homeController,9),
                                  titleHeader(context,4,"gallery",homeController,9),
                                  titleHeader(context,5,"news",homeController,9),
                                  titleHeader(context,6,"contact_us",homeController,9),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.22,
                  height: MediaQuery.of(context).size.width * 0.15 - 25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(() => Shop());
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.22/2,
                            color: purple,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.025,
                                    height: MediaQuery.of(context).size.width * 0.025,
                                    child: Image.asset("assets/image/Icon_GoToShop.png",
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Center(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.1 / 2,
                                        child: Text(App_Localization.of(context).translate("go_to_shop").toUpperCase(),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: TextStyle(
                                              color: Colors.white ,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              height: 1.2,
                                              fontFamily: "POPPINS"
                                          ),),
                                      )
                                  )
                                ],
                              ),
                            )
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          // homeController.btmNavBarIndex.value = 7;
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.22/2,
                            color: primery,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.025,
                                    height: MediaQuery.of(context).size.width * 0.025,
                                    child: Image.asset("assets/image/Icon_Boarding.png",
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Center(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        child: Text(App_Localization.of(context).translate("book_a_boarding").toUpperCase(),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              height: 1.2,
                                              fontFamily: "POPPINS"
                                          ),),
                                      )
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
  static titleHeader(BuildContext context,int index,String title,HomeController homeController,double font){
    return GestureDetector(
      onTap: (){
        Get.back();
        Get.back();
        Get.back();
        Get.back();
        homeController.btmNavBarIndex.value = index;
        // if(homeController.btmNavBarIndex.value == 5){
        //   homeController.openNews.value = -1;
        // }else{
        //   homeController.openNews.value = 5;
        // }
      },
      child: OnHover(builder: (isHovered){
        return Container(
          child: Center(child: Text(
              App_Localization.of(context).translate(title).toUpperCase(),
              style: TextStyle(
                  color: index == homeController.btmNavBarIndex.value||isHovered ?App.primery: Colors.black,
                  fontSize: font,
                  fontFamily: "POPPINS",
                  fontWeight: FontWeight.w500),maxLines: 1),
          ),
        );
      }),
    );
  }

  ////////////////// Footer //////////////////
  static footer(BuildContext context,HomeController homeController){
    return  MediaQuery.of(context).size.width>App.extra ? extraFooter(context,homeController) :
    MediaQuery.of(context).size.width>App.xLarge?xlargFooter(context,homeController) :
      MediaQuery.of(context).size.width>App.larg?largFooter(context,homeController)
        :MediaQuery.of(context).size.width>App.big?bigFooter(context,homeController)
        : midFooter(context,homeController);
  }
  static extraFooter(BuildContext context,HomeController homeController){
    return Obx(() => SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width > 2700 ? MediaQuery.of(context).size.width * 0.21 :
      MediaQuery.of(context).size.width * 0.22,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.width*0.3,
              decoration:BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/map.PNG"),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: green,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width*0.03,
                    vertical: MediaQuery.of(context).size.width*0.03
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(App_Localization.of(context).translate("footer1"),
                                style: TextStyle(
                                    fontFamily: "POPPINS",
                                    fontSize: 25,
                                    color: Colors.white,fontWeight: FontWeight.bold)),
                            SizedBox(height: MediaQuery.of(context).size.width*0.03,child: Center(),),
                            Text("Warehouse S01, Ras Al Khor 2",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 23,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("Dubai, United Arab Emirates",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 23,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("04 333 5843",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 23,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("+971 54 204 6700",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 23,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                          ],
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.05),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(App_Localization.of(context).translate("footer4"),
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 25,
                                  color: Colors.white,fontWeight: FontWeight.bold),maxLines: 1,),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            Container(
                                width: MediaQuery.of(context).size.width*0.2,
                                height: 70,
                                color: Colors.white.withOpacity(0.9),
                                child: TextField(
                                  style: TextStyle(
                                    fontFamily: "POPPINS",
                                    fontSize: 25,
                                  ),
                                  textAlignVertical: TextAlignVertical.bottom,
                                  decoration:  InputDecoration(
                                    hintText: App_Localization.of(context).translate("footer4_content_email"),
                                    hintStyle: TextStyle(color: Colors.grey,
                                        fontFamily: "POPPINS",
                                      fontSize: 25),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                                    ),
                                    enabledBorder:const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            GestureDetector(
                              onTap: () {
                                if (homeController.subscribe.value == false){
                                  homeController.subscribe.value = true;
                                }
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                                  width: MediaQuery.of(context).size.width*0.15,
                                  decoration: BoxDecoration(
                                      color: primery,
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Text(App_Localization.of(context).translate("footer4_content_subscribe").toUpperCase(),
                                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                                            fontFamily: "POPPINS",
                                            fontSize: 25,
                                          ),),
                                      )
                                  )
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            homeController.subscribe.isTrue ?
                            Text(App_Localization.of(context).translate("footer4_content_thank"),style:
                            TextStyle(
                                fontFamily: "POPPINS",
                                fontSize: 20,
                                color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.normal)) : Center(),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            Text(App_Localization.of(context).translate("become_our_friends") + "!",style:
                            TextStyle(
                                fontFamily: "POPPINS",
                                fontSize: 23,
                                color: Colors.white,fontWeight: FontWeight.w500)),
                            SizedBox(height: 10,child: Center(),),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    //todo
                                  },
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/facebook.svg",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    //todo
                                  },
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/instagram.svg",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    //todo
                                  },
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/twitter.svg",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    //todo
                                  },
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/linkedin.svg",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
  static xlargFooter(BuildContext context,HomeController homeController){
    return Obx(() => SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width > 2300 ? MediaQuery.of(context).size.width * 0.21 :
      MediaQuery.of(context).size.width * 0.22,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.width*0.3,
              decoration:BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/map.PNG"),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: green,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width*0.03,
                    vertical: MediaQuery.of(context).size.width*0.03
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(App_Localization.of(context).translate("footer1"),
                                style: TextStyle(
                                    fontFamily: "POPPINS",
                                    fontSize: 20,
                                    color: Colors.white,fontWeight: FontWeight.bold)),
                            SizedBox(height: MediaQuery.of(context).size.width*0.03,child: Center(),),
                            Text("Warehouse S01, Ras Al Khor 2",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 18,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("Dubai, United Arab Emirates",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 18,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("04 333 5843",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 18,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("+971 54 204 6700",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 18,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                          ],
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.05),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(App_Localization.of(context).translate("footer4"),
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 20,
                                  color: Colors.white,fontWeight: FontWeight.bold),maxLines: 1,),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            Container(
                                width: MediaQuery.of(context).size.width*0.2,
                                height: 50,
                                color: Colors.white.withOpacity(0.9),
                                child: TextField(
                                  style: TextStyle(
                                    fontFamily: "POPPINS",
                                    fontSize: 20,
                                  ),
                                  textAlignVertical: TextAlignVertical.bottom,
                                  decoration:  InputDecoration(
                                    hintText: App_Localization.of(context).translate("footer4_content_email"),
                                    hintStyle: TextStyle(color: Colors.grey,
                                        fontFamily: "POPPINS",
                                        fontSize: 20),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                                    ),
                                    enabledBorder:const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            GestureDetector(
                              onTap: () {
                                if (homeController.subscribe.value == false){
                                  homeController.subscribe.value = true;
                                }
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                                  width: MediaQuery.of(context).size.width*0.15,
                                  decoration: BoxDecoration(
                                      color: primery,
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Text(App_Localization.of(context).translate("footer4_content_subscribe").toUpperCase(),
                                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                                            fontFamily: "POPPINS",
                                            fontSize: 20,
                                          ),),
                                      )
                                  )
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            homeController.subscribe.isTrue ?
                            Text(App_Localization.of(context).translate("footer4_content_thank"),style:
                            TextStyle(
                                fontFamily: "POPPINS",
                                fontSize: 15,
                                color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.normal)) : Center(),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            Text(App_Localization.of(context).translate("become_our_friends") + "!",style:
                            TextStyle(
                                fontFamily: "POPPINS",
                                fontSize: 18,
                                color: Colors.white,fontWeight: FontWeight.w500)),
                            SizedBox(height: 10,child: Center(),),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    //todo
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/facebook.svg",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    //todo
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/instagram.svg",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    //todo
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/twitter.svg",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    //todo
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/linkedin.svg",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
  static largFooter(BuildContext context,HomeController homeController){
    return Obx(() => SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width > 1600 ? MediaQuery.of(context).size.width * 0.21 :
      MediaQuery.of(context).size.width * 0.23,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height:  MediaQuery.of(context).size.width*0.3,
              decoration:BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/map.PNG"),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: green,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width*0.03,
                    vertical: MediaQuery.of(context).size.width*0.03
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(App_Localization.of(context).translate("footer1"),
                                style: TextStyle(
                                    fontFamily: "POPPINS",
                                    fontSize: 16,
                                    color: Colors.white,fontWeight: FontWeight.bold)),
                            SizedBox(height: MediaQuery.of(context).size.width*0.05/2,child: Center(),),
                            Text("Warehouse S01, Ras Al Khor 2",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("Dubai, United Arab Emirates",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("04 333 5843",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("+971 54 204 6700",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                          ],
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.05),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(App_Localization.of(context).translate("footer4"),
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 16,
                                  color: Colors.white,fontWeight: FontWeight.bold),maxLines: 1,),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            Container(
                                width: MediaQuery.of(context).size.width*0.2,
                                height: 40,
                                color: Colors.white.withOpacity(0.9),
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "POPPINS",
                                  ),
                                  textAlignVertical: TextAlignVertical.bottom,
                                  decoration:  InputDecoration(
                                    hintText: App_Localization.of(context).translate("footer4_content_email"),
                                    hintStyle: TextStyle(color: Colors.grey,
                                        fontFamily: "POPPINS",
                                      fontSize: 16),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                                    ),
                                    enabledBorder:const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            GestureDetector(
                              onTap: () {
                                if (homeController.subscribe.value == false){
                                  homeController.subscribe.value = true;
                                }
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                                  width: MediaQuery.of(context).size.width*0.15,
                                  decoration: BoxDecoration(
                                      color: primery,
                                      borderRadius: BorderRadius.circular(50/2)
                                  ),
                                  child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(App_Localization.of(context).translate("footer4_content_subscribe").toUpperCase(),
                                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                                            fontFamily: "POPPINS",
                                            fontSize: 16,
                                          ),),
                                      )
                                  )
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            homeController.subscribe.isTrue ?
                            Text(App_Localization.of(context).translate("footer4_content_thank"),style:
                            TextStyle(
                                fontFamily: "POPPINS",
                                fontSize: 13,
                                color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.normal)) : Center(),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            Text(App_Localization.of(context).translate("become_our_friends") + "!",style:
                            TextStyle(
                                fontFamily: "POPPINS",
                                fontSize: 14,
                                color: Colors.white,fontWeight: FontWeight.normal)),
                            SizedBox(height: 10,child: Center(),),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    //todo
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/facebook.svg",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    //todo
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/instagram.svg",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    //todo
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/twitter.svg",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    //todo
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/linkedin.svg",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
  static bigFooter(BuildContext context,HomeController homeController){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.width > 1200 ? MediaQuery.of(context).size.width * 0.2 :
      MediaQuery.of(context).size.width * 0.25,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height:  MediaQuery.of(context).size.width*0.3,
              decoration:BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/map.PNG"),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: green,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width*0.03,
                    vertical: MediaQuery.of(context).size.width*0.03
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(App_Localization.of(context).translate("footer1"),
                                style: TextStyle(
                                    fontFamily: "POPPINS",
                                    fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold)),
                            SizedBox(height: MediaQuery.of(context).size.width*0.05/2,child: Center(),),
                            Text("Warehouse S01, Ras Al Khor 2",
                              style: TextStyle(fontSize: 10, fontFamily: "POPPINS",color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("Dubai, United Arab Emirates",
                              style: TextStyle(fontSize: 10, fontFamily: "POPPINS",color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("04 333 5843",
                              style: TextStyle(fontSize: 10, fontFamily: "POPPINS",color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("+971 54 204 6700",
                              style: TextStyle(fontSize: 10, fontFamily: "POPPINS",color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                          ],
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.04),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(App_Localization.of(context).translate("footer4"),style: TextStyle(fontSize: 14, fontFamily: "POPPINS",color: Colors.white,fontWeight: FontWeight.bold),maxLines: 1,),
                            SizedBox(height: 12,child: Center(),),
                            Container(
                                width: MediaQuery.of(context).size.width*0.23,
                                height: 30,
                                color: Colors.white.withOpacity(0.9),
                                child: TextField(
                                  textAlignVertical: TextAlignVertical.bottom,
                                  style: TextStyle(
                                      fontFamily: "POPPINS",
                                      fontSize: 12),
                                  decoration:  InputDecoration(
                                    hintText: App_Localization.of(context).translate("footer4_content_email"),
                                    hintStyle: TextStyle(color: Colors.grey,fontSize: 12, fontFamily: "POPPINS",),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                                    ),
                                    enabledBorder:const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: 10,child: Center(),),
                            GestureDetector(
                              onTap: () {
                                if (homeController.subscribe.value == false){
                                  homeController.subscribe.value = true;
                                }
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                                  width: MediaQuery.of(context).size.width*0.15,
                                  decoration: BoxDecoration(
                                      color: primery,
                                      borderRadius: BorderRadius.circular(50/2)
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: Text(App_Localization.of(context).translate("footer4_content_subscribe"),
                                        style: TextStyle(
                                            fontFamily: "POPPINS",
                                            fontWeight: FontWeight.bold,color: Colors.white,fontSize: 12),),
                                    )
                                  )
                              ),
                            ),
                            SizedBox(height: 10,child: Center(),),
                            homeController.subscribe.isTrue ?
                            Text(App_Localization.of(context).translate("footer4_content_thank"),style:
                            TextStyle(fontSize: 8,fontFamily: "POPPINS",color: Colors.white.withOpacity(0.5),fontWeight: FontWeight.normal)) : Center(),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            Text(App_Localization.of(context).translate("become_our_friends")+"!",style:
                            TextStyle(fontSize: 10,fontFamily: "POPPINS",color: Colors.white,fontWeight: FontWeight.normal)),
                            SizedBox(height: 5,child: Center(),),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    //todo
                                  },
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/facebook.svg",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () {
                                    //todo
                                  },
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/instagram.svg",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () {
                                    //todo
                                  },
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/twitter.svg",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () {
                                    //todo
                                  },
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/linkedin.svg",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  static midFooter(BuildContext context,HomeController homeController){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width > 850 ? MediaQuery.of(context).size.width * 0.25:
      MediaQuery.of(context).size.width * 0.29,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.width*0.3,
              decoration:BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/map.PNG"),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: green,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width*0.03,
                    vertical: MediaQuery.of(context).size.width*0.03
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(App_Localization.of(context).translate("footer1"),
                              style: TextStyle(fontFamily: "POPPINS",fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold)),
                          SizedBox(height: MediaQuery.of(context).size.width*0.05/2,child: Center(),),
                          Text("Warehouse S01, Ras Al Khor 2",
                            style: TextStyle(fontFamily: "POPPINS",fontSize: 8,color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                          SizedBox(height: 10,child: Center(),),
                          Text("Dubai, United Arab Emirates",
                            style: TextStyle(fontFamily: "POPPINS",fontSize: 8,color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                          SizedBox(height: 10,child: Center(),),
                          Text("04 333 5843",
                            style: TextStyle(fontFamily: "POPPINS",fontSize: 8,color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                          SizedBox(height: 10,child: Center(),),
                          Text("+971 54 204 6700",
                            style: TextStyle(fontFamily: "POPPINS",fontSize: 8,color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                        ],
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.04),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(App_Localization.of(context).translate("footer4"),style: TextStyle(fontFamily: "POPPINS",fontSize: 11,color: Colors.white,fontWeight: FontWeight.bold)),
                          SizedBox(height: 10,child: Center(),),
                          Container(
                              width: MediaQuery.of(context).size.width*0.2,
                              height: 28,
                              color: Colors.white.withOpacity(0.9),
                              child: TextField(
                                textAlignVertical: TextAlignVertical.bottom,
                                style: TextStyle(
                                    fontFamily: "POPPINS",
                                    fontSize: 10),
                                decoration:  InputDecoration(
                                  hintText: App_Localization.of(context).translate("footer4_content_email"),
                                  hintStyle: TextStyle(
                                      fontFamily: "POPPINS",
                                      color: Colors.grey,fontSize: 10),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                                  ),
                                  enabledBorder:const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                                  ),
                                ),
                              )
                          ),
                          SizedBox(height: 10,child: Center(),),
                          GestureDetector(
                            onTap: () {
                              if (homeController.subscribe.value == false){
                                homeController.subscribe.value = true;
                              }
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                                width: MediaQuery.of(context).size.width*0.15,
                                decoration: BoxDecoration(
                                    color: primery,
                                    borderRadius: BorderRadius.circular(50/2)
                                ),
                                child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(App_Localization.of(context).translate("footer4_content_subscribe"),
                                    style: TextStyle(fontFamily: "POPPINS",
                                        fontWeight: FontWeight.bold,color: Colors.white,fontSize: 10),),
                                ),
                                )
                            ),
                          ),
                          SizedBox(height: 10,child: Center(),),
                          homeController.subscribe.isTrue ?
                          Text(App_Localization.of(context).translate("footer4_content_thank"),style:
                          TextStyle(fontFamily: "POPPINS",fontSize: 8,color: Colors.white.withOpacity(0.5),fontWeight: FontWeight.normal)): Center(),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                          Text(App_Localization.of(context).translate("become_our_friends") + "!",style:
                          TextStyle(fontFamily: "POPPINS",fontSize: 8,color: Colors.white,fontWeight: FontWeight.normal)),
                          SizedBox(height: 5,child: Center(),),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //todo
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: SvgPicture.asset("assets/socialMedia/facebook.svg",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 3),
                              GestureDetector(
                                onTap: () {
                                  //todo
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: SvgPicture.asset("assets/socialMedia/instagram.svg",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 3),
                              GestureDetector(
                                onTap: () {
                                  //todo
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: SvgPicture.asset("assets/socialMedia/twitter.svg",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 3),
                              GestureDetector(
                                onTap: () {
                                  //todo
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: SvgPicture.asset("assets/socialMedia/linkedin.svg",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  ////////////////// BoxShadow //////////////////
  static BoxShadow boxShadow = BoxShadow(
      color: Colors.grey.withOpacity(0.9),
      spreadRadius: 0.1,
      blurRadius: 5,
      offset: Offset(3, 2));
  static BoxShadow noShadow = BoxShadow(
      color: Colors.grey.withOpacity(0),
      spreadRadius: 0.1,
      blurRadius: 5,
      offset: Offset(3, 2));

  ////////////////// LinearGradient //////////////////
  static LinearGradient linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [
      App.primery,
      App.primery.withOpacity(0.8),
    ],
  );

  ////////////////// bottomNavBar //////////////////
  static bottomNavBar(BuildContext context, HomeController homeController, int count) {
    return Stack(
      children: [
        BottomNavigationBar(
            currentIndex: homeController.btmNavBarIndex.value,
            onTap: (int index) {
              homeController.btmNavBarIndex.value = index;
            },
            backgroundColor: App.primery,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            type: BottomNavigationBarType.fixed,
            iconSize: 25,
            selectedItemColor: Colors.black.withOpacity(0.5),
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "",
              ),
            ]),
        Positioned(
            top: 2,
            right: Store.languageCode == "en"
                ? (MediaQuery.of(context).size.width / 4 +
                MediaQuery.of(context).size.width / 8) +
                5
                : null,
            left: Store.languageCode == "ar"
                ? (MediaQuery.of(context).size.width / 4 +
                MediaQuery.of(context).size.width / 8) +
                5
                : null,
            child: count == 0
                ? Center()
                : Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  color: Colors.red, shape: BoxShape.circle),
              child: Center(
                  child: Text(
                    count.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  )),
            )),
      ],
    );
  }

  ////////////////// showTopSnackBar //////////////////
  static sucss_msg(BuildContext context, String msg) {
    return showTopSnackBar(
      context,
      CustomSnackBar.success(
        message: msg,
        backgroundColor: primery,
      ),
    );
  }
  static error_msg(BuildContext context, String err) {
    return showTopSnackBar(
      context,
      CustomSnackBar.error(
        message: err,
      ),
    );
  }

  ////////////////// GridView //////////////////
  static Grid_horizantel({required int count, required double ratio, required List<Post> posts, required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow}) {
    return Container(
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
                //todo api
              },
              child: Column(
                children: [
                  Container(
                    height: height - 5,
                    decoration: BoxDecoration(
                        borderRadius: radius == null
                            ? null
                            : BorderRadius.circular(radius),
                        color: background,
                        boxShadow: [shadow ? boxShadow : noShadow]),
                    child: Column(
                      children: [
                        Expanded(
                            flex: 3,
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
                                          .replaceAll("localhost", "10.0.2.2")),
                                      fit: BoxFit.fill)),
                            )),
                        Expanded(
                            flex: 1,
                            child: Container(
                              child: Center(child: Text(posts[index].title!)),
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
  static Grid_vertical({required int count, required double ratio, required List<Post> posts, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow}) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: count,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: ratio),
        physics: NeverScrollableScrollPhysics(),
        itemCount: posts.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //todo api
            },
            child: Container(
              decoration: BoxDecoration(
                color: background,
                boxShadow: [shadow ? boxShadow : noShadow],
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
                              shape:
                              circle ? BoxShape.circle : BoxShape.rectangle,
                              image: DecorationImage(
                                  image: NetworkImage(posts[index]
                                      .image!
                                      .replaceAll("localhost", "10.0.2.2")),
                                  fit: BoxFit.fill)),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Center(child: Text(posts[index].title!)),
                      )),
                ],
              ),
            ),
          );
        });
  }

  ////////////////// Translate //////////////////
  static String translate(BuildContext context, String key) {
    return App_Localization.of(context).translate(key);
  }

  ////////////////// Rates //////////////////
  static ratesTable(String data,BuildContext context,double width,double tdSize,double thSize){
    return Html(data:data,
        style: {
          "table":Style(
            width: width,
          ),
          "td":Style(
              textAlign: TextAlign.left,
              padding: EdgeInsets.all(8),
              width: width/3,
              color: Colors.black,
              fontSize: FontSize(tdSize),
              fontFamily: "POPPINS",
              border: Border.all(width: 0.5,color: Colors.grey.withOpacity(0.5))
          ),
          "th":Style(
              textAlign: TextAlign.left,
              padding: EdgeInsets.all(8),
              fontWeight: FontWeight.bold,
              width: width/3,
              fontFamily: "POPPINS",
              color: Colors.black,
              fontSize: FontSize(thSize),
              border: Border.all(width: 0.5,color: Colors.grey.withOpacity(0.5))
          ),
          ".grey":Style(
            fontFamily: "POPPINS",
            backgroundColor: Colors.grey[200],
          )
        }
    );
  }


////////////////////////////////// Shop //////////////////////////////////////

  ////////////////// Header //////////////////
  static shopHeader(BuildContext context,ShopController shopController,HomeController homeController,GlobalKey<ScaffoldState> globalKey) {
    return MediaQuery.of(context).size.width>App.larg?shopLargeHeader(context,homeController,shopController)
        : MediaQuery.of(context).size.width>App.big ? shopBigHeader(context,homeController,shopController) :
        shopMediumHeader(context,homeController,shopController);
  }
  static shopLargeHeader(BuildContext context,HomeController homeController,ShopController shopController){
    return Container(
        height: MediaQuery.of(context).size.height*0.25,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 35,
              color: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Text(App_Localization.of(context).translate("same_day_delivery"),
                        style: TextStyle(color: secondry,fontSize: 12)),
                    GestureDetector(
                      onTap: () {
                        if(shopController.openCountry.value == false) {
                          shopController.openCountry.value = true;
                        } else {
                          shopController.openCountry.value = false;
                        }
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgPicture.asset("assets/image/united-arab-emirates.svg",
                              width: 30, height: 30,),
                            shopController.openCountry.value == false ?
                            Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,) :
                            Icon(Icons.keyboard_arrow_up_outlined,color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: MediaQuery.of(context).size.height*0.05),
                GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.25 - 35,
                      width: MediaQuery.of(context).size.width*0.1,
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.15,
                          height:  MediaQuery.of(context).size.height*0.25 - 35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage("assets/image/logo.png"),
                                  fit: BoxFit.fill
                              )
                          ),
                        ),
                      ),
                    )
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.55,
                  height: MediaQuery.of(context).size.height* 0.25 - 35,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height*0.03),
                              Container(
                                width: MediaQuery.of(context).size.width*0.55,
                                height: MediaQuery.of(context).size.height * 0.07,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.5,
                                          height: MediaQuery.of(context).size.height*0.07,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.07/2)
                                          ),
                                          child: TextField(
                                            onSubmitted: (query){
                                              homeController.search(context, query);
                                            },
                                            style: TextStyle(fontSize: 18),
                                            // controller: homeController.searchController,
                                            decoration: InputDecoration(
                                              enabledBorder:const OutlineInputBorder(
                                                // width: 0.0 produces a thin "hairline" border
                                                borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                                              ),
                                              focusedBorder: const OutlineInputBorder(
                                                // width: 0.0 produces a thin "hairline" border
                                                borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                                              ),
                                              hintText: App_Localization.of(context).translate("search"),
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 18
                                              ),
                                            ),
                                            textAlignVertical: TextAlignVertical.bottom,
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: GestureDetector(
                                              onTap: (){
                                                homeController.search(context, homeController.searchController.text);
                                              },
                                              child: OnHover(
                                                builder: (isHover){
                                                  return Container(
                                                    height: MediaQuery.of(context).size.height*0.07,
                                                    width: MediaQuery.of(context).size.height*0.07+10,
                                                    decoration: BoxDecoration(
                                                        color: isHover?App.lightOrang:App.primery,
                                                        borderRadius: BorderRadius.only(topRight: Radius.circular(MediaQuery.of(context).size.height*0.07/2),bottomRight: Radius.circular(MediaQuery.of(context).size.height*0.07/2))
                                                    ),
                                                    child: Icon(Icons.search,color: Colors.white,size: 35,),
                                                  );
                                                },
                                              )
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.55,
                        height: MediaQuery.of(context).size.height*0.05,
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.55,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  shopTitleHeader(context,0,"home",shopController,15),
                                  OnHover(builder: (isHovered){
                                    return GestureDetector(
                                      onTap: () {
                                        if(shopController.btmNavBarIndex.value == 1){
                                          shopController.openShopByPetIndex.value = -1;
                                        }else{
                                          shopController.openShopByPetIndex.value = 1;
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          shopTitleHeader(context,1,"shop_by_bet",shopController,15),
                                          Icon( shopController.btmNavBarIndex.value != 1 ?
                                          Icons.arrow_drop_down : Icons.arrow_drop_up,
                                            color: shopController.btmNavBarIndex.value == 1 || isHovered
                                                ? primery : Colors.black,
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                                  OnHover(builder: (isHovered){
                                    return GestureDetector(
                                      onTap: () {
                                        if(shopController.btmNavBarIndex.value == 2){
                                          shopController.openBrandIndex.value = -1;
                                        }else{
                                          shopController.openBrandIndex.value = 2;
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          shopTitleHeader(context,2,"shop_by_brands",shopController,15),
                                          Icon(shopController.btmNavBarIndex.value != 2 ?
                                          Icons.arrow_drop_down : Icons.arrow_drop_up,
                                            color: shopController.btmNavBarIndex.value == 2 || isHovered
                                                ? primery : Colors.black,
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                                  shopTitleHeader(context,3,"offers",shopController,15),
                                  shopTitleHeader(context,4,"our_stores",shopController,15),
                                  shopTitleHeader(context,5,"new_arrivals",shopController,15),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.25 - 35,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){
                          //todo login
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height*0.25 - 35,
                            color: purple,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.person,color: Colors.white,size: 35,),
                                  Center(
                                    child: Text(App_Localization.of(context).translate("login").toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white ,
                                          fontSize: 18,fontWeight: FontWeight.bold),),
                                  )
                                ],
                              ),
                            )
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          shopController.btmNavBarIndex.value = 6;
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height*0.25 - 35,
                            color: primery,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 35,),
                                  Center(
                                    child: Text(App_Localization.of(context).translate("cart").toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white ,
                                          fontSize: 18,fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
  static shopBigHeader(BuildContext context,HomeController homeController,ShopController shopController){
    return Container(
        height: MediaQuery.of(context).size.height*0.25,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 30,
              color: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Text(App_Localization.of(context).translate("same_day_delivery"),
                        style: TextStyle(color: secondry,fontSize: 10)),
                    GestureDetector(
                      onTap: () {
                        if(shopController.openCountry.value == false) {
                          shopController.openCountry.value = true;
                        } else {
                          shopController.openCountry.value = false;
                        }
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgPicture.asset("assets/image/united-arab-emirates.svg",
                              width: 20, height: 20),
                            shopController.openCountry.value == false ?
                            Icon(Icons.keyboard_arrow_down_outlined,size: 18,color: Colors.white,) :
                            Icon(Icons.keyboard_arrow_up_outlined,size: 18,color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: MediaQuery.of(context).size.height*0.03),
                GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.25 - 30,
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.1,
                          height:  MediaQuery.of(context).size.height*0.25 - 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage("assets/image/logo.png"),
                                  fit: BoxFit.fill
                              )
                          ),
                        ),
                      ),
                    )
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.6,
                  height: MediaQuery.of(context).size.height* 0.25 - 30,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height*0.03),
                              Container(
                                width: MediaQuery.of(context).size.width*0.6,
                                height: MediaQuery.of(context).size.height * 0.07,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.45,
                                          height: MediaQuery.of(context).size.height*0.06,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.07/2)
                                          ),
                                          child: TextField(
                                            onSubmitted: (query){
                                              homeController.search(context, query);
                                            },
                                            style: TextStyle(fontSize: 15),
                                            controller: homeController.searchController,
                                            decoration: InputDecoration(
                                              enabledBorder:const OutlineInputBorder(
                                                // width: 0.0 produces a thin "hairline" border
                                                borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                                              ),
                                              focusedBorder: const OutlineInputBorder(
                                                // width: 0.0 produces a thin "hairline" border
                                                borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                                              ),
                                              hintText: App_Localization.of(context).translate("search"),
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 15
                                              ),
                                            ),
                                            textAlignVertical: TextAlignVertical.bottom,
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: GestureDetector(
                                              onTap: (){
                                                homeController.search(context, homeController.searchController.text);
                                              },
                                              child: OnHover(
                                                builder: (isHover){
                                                  return Container(
                                                    height: MediaQuery.of(context).size.height*0.06,
                                                    width: MediaQuery.of(context).size.height*0.06+10,
                                                    decoration: BoxDecoration(
                                                        color: isHover?App.lightOrang:App.primery,
                                                        borderRadius: BorderRadius.only(topRight: Radius.circular(MediaQuery.of(context).size.height*0.07/2),bottomRight: Radius.circular(MediaQuery.of(context).size.height*0.07/2))
                                                    ),
                                                    child: Icon(Icons.search,color: Colors.white,size: 25),
                                                  );
                                                },
                                              )
                                          ),

                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.55,
                        height: MediaQuery.of(context).size.height*0.05,
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.55,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  shopTitleHeader(context,0,"home",shopController,12),
                                  OnHover(builder: (isHovered){
                                    return GestureDetector(
                                      onTap: () {
                                        if(shopController.btmNavBarIndex.value == 1){
                                          shopController.openShopByPetIndex.value = -1;
                                        }else{
                                          shopController.openShopByPetIndex.value = 1;
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          shopTitleHeader(context,1,"shop_by_bet",shopController,12),
                                          Icon(shopController.btmNavBarIndex.value != 1 ?
                                          Icons.arrow_drop_down : Icons.arrow_drop_up,
                                            size: 20,
                                            color: shopController.btmNavBarIndex.value == 1 || isHovered
                                                ? primery : Colors.black,
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                                  OnHover(builder: (isHovered){
                                    return GestureDetector(
                                      onTap: () {
                                        if(shopController.btmNavBarIndex.value == 2){
                                          shopController.openBrandIndex.value = -1;
                                        }else{
                                          shopController.openBrandIndex.value = 2;
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          shopTitleHeader(context,2,"shop_by_brands",shopController,12),
                                          Icon(shopController.btmNavBarIndex.value != 2 ?
                                          Icons.arrow_drop_down : Icons.arrow_drop_up,
                                            size: 20,
                                            color: shopController.btmNavBarIndex.value == 2 || isHovered
                                                ? primery : Colors.black,
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                                  shopTitleHeader(context,3,"offers",shopController,12),
                                  shopTitleHeader(context,4,"our_stores",shopController,12),
                                  shopTitleHeader(context,5,"new_arrivals",shopController,12),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.25 - 30,
                  width: MediaQuery.of(context).size.width * 0.23,
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){
                          //todo login
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.23/2,
                            height: MediaQuery.of(context).size.height*0.25 - 30,
                            color: purple,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.person,color: Colors.white,size: 30),
                                  Center(
                                    child: Text(App_Localization.of(context).translate("login"),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white ,
                                          fontSize: 16,fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          shopController.btmNavBarIndex.value = 6;
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.23/2,
                            height: MediaQuery.of(context).size.height*0.25 - 30,
                            color: primery,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 30),
                                  Center(
                                    child: Text(App_Localization.of(context).translate("cart"),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
  static shopMediumHeader(BuildContext context,HomeController homeController,ShopController shopController){
    return Container(
      height: MediaQuery.of(context).size.height*0.2,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 30,
            color: Colors.grey[900],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Text(App_Localization.of(context).translate("same_day_delivery"),
                      style: TextStyle(color: secondry,fontSize: 10)),
                  GestureDetector(
                    onTap: () {
                      if(shopController.openCountry.value == false) {
                        shopController.openCountry.value = true;
                      } else {
                        shopController.openCountry.value = false;
                      }
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset("assets/image/united-arab-emirates.svg",
                              width: 20, height: 20),
                          shopController.openCountry.value == false ?
                          Icon(Icons.keyboard_arrow_down_outlined,size: 18,color: Colors.white,) :
                          Icon(Icons.keyboard_arrow_up_outlined,size: 18,color: Colors.white,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: MediaQuery.of(context).size.height*0.03),
              GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.2 - 30,
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.12,
                        height:  MediaQuery.of(context).size.height*0.13,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/image/logo.png"),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                    ),
                  )
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.6,
                height: MediaQuery.of(context).size.height* 0.2 - 30,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height*0.02),
                            Container(
                              width: MediaQuery.of(context).size.width*0.6,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.45,
                                        height: MediaQuery.of(context).size.height*0.06,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.07/2)
                                        ),
                                        child: TextField(
                                          onSubmitted: (query){
                                            homeController.search(context, query);
                                          },
                                          style: TextStyle(fontSize: 14),
                                          controller: homeController.searchController,
                                          decoration: InputDecoration(
                                            enabledBorder:const OutlineInputBorder(
                                              // width: 0.0 produces a thin "hairline" border
                                              borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                                            ),
                                            focusedBorder: const OutlineInputBorder(
                                              // width: 0.0 produces a thin "hairline" border
                                              borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                                            ),
                                            hintText: App_Localization.of(context).translate("search"),
                                            hintStyle: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 14
                                            ),
                                          ),
                                          textAlignVertical: TextAlignVertical.bottom,
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        child: GestureDetector(
                                            onTap: (){
                                              homeController.search(context, homeController.searchController.text);
                                            },
                                            child: OnHover(
                                              builder: (isHover){
                                                return Container(
                                                  height: MediaQuery.of(context).size.height*0.06,
                                                  width: MediaQuery.of(context).size.height*0.06+10,
                                                  decoration: BoxDecoration(
                                                      color: isHover?App.lightOrang:App.primery,
                                                      borderRadius: BorderRadius.only(topRight: Radius.circular(MediaQuery.of(context).size.height*0.07/2),bottomRight: Radius.circular(MediaQuery.of(context).size.height*0.07/2))
                                                  ),
                                                  child: Icon(Icons.search,color: Colors.white,size: 20),
                                                );
                                              },
                                            )
                                        ),

                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.55,
                      height: MediaQuery.of(context).size.height*0.05,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.55,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                shopTitleHeader(context,0,"home",shopController,9),
                                OnHover(builder: (isHovered){
                                  return GestureDetector(
                                    onTap: () {
                                      if(shopController.btmNavBarIndex.value == 1){
                                        shopController.openShopByPetIndex.value = -1;
                                      }else{
                                        shopController.openShopByPetIndex.value = 1;
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        shopTitleHeader(context,1,"shop_by_bet",shopController,9),
                                        Icon(shopController.btmNavBarIndex.value != 1 ?
                                        Icons.arrow_drop_down : Icons.arrow_drop_up,
                                          size: 20,
                                          color: shopController.btmNavBarIndex.value == 1 || isHovered
                                              ? primery : Colors.black,
                                        )
                                      ],
                                    ),
                                  );
                                }),
                                OnHover(builder: (isHovered){
                                  return GestureDetector(
                                    onTap: () {
                                      if(shopController.btmNavBarIndex.value == 2){
                                        shopController.openBrandIndex.value = -1;
                                      }else{
                                        shopController.openBrandIndex.value = 2;
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        shopTitleHeader(context,2,"shop_by_brands",shopController,9),
                                        Icon(shopController.btmNavBarIndex.value != 2 ?
                                        Icons.arrow_drop_down : Icons.arrow_drop_up,
                                          size: 20,
                                          color: shopController.btmNavBarIndex.value == 2 || isHovered
                                              ? primery : Colors.black,
                                        )
                                      ],
                                    ),
                                  );
                                }),
                                shopTitleHeader(context,3,"offers",shopController,9),
                                shopTitleHeader(context,4,"our_stores",shopController,9),
                                shopTitleHeader(context,5,"new_arrivals",shopController,9),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.2 - 30,
                width: MediaQuery.of(context).size.width * 0.23,
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        //todo login
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.23/2,
                          height: MediaQuery.of(context).size.height*0.2 - 30,
                          color: purple,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.person,color: Colors.white,size: 25),
                                Center(
                                  child: Text(App_Localization.of(context).translate("login"),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,fontWeight: FontWeight.bold),),
                                ),
                              ],
                            ),
                          )
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        shopController.btmNavBarIndex.value = 6;
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.23/2,
                          height: MediaQuery.of(context).size.height * 0.2 - 30,
                          color: primery,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 25),
                                Center(
                                  child: Text(App_Localization.of(context).translate("cart"),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white ,
                                        fontSize: 14,fontWeight: FontWeight.bold),),
                                ),
                              ],
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  static shopTitleHeader(BuildContext context,int index,String title,ShopController shopController,double font){
    return GestureDetector(
      onTap: (){
        shopController.btmNavBarIndex.value = index;
        if(shopController.btmNavBarIndex.value == 1){
          shopController.openShopByPetIndex.value = -1;
        }else{
          shopController.openShopByPetIndex.value = 1;
        }
        if(shopController.btmNavBarIndex.value == 2){
          shopController.openBrandIndex.value = -1;
        }else{
          shopController.openBrandIndex.value = 2;
        }
      },
      child: OnHover(builder: (isHovered){
        return Container(
          child: Center(child: Text(
              App_Localization.of(context).translate(title).toUpperCase(),
              style: TextStyle(
                  color: index == shopController.btmNavBarIndex.value||isHovered ?App.primery:Color(0xff212121),fontSize: font,fontWeight: FontWeight.bold
              ),
              maxLines: 1),
          ),
        );
      }),
    );
  }

  ////////////////// LanguageBar //////////////////
  static languageBar(BuildContext context,ShopController shopController) {
    return MediaQuery.of(context).size.width>App.larg?largeLanguageBar(context,shopController)
        : MediaQuery.of(context).size.width>App.big ? bigLanguageBar(context,shopController) :
    medLanguageBar(context,shopController);
  }
  static largeLanguageBar(BuildContext context,ShopController shopController) {
    return shopController.openCountry.value ==true ?
    Column(
      children: [
        SizedBox(height: 35,),
        Container(
          width: MediaQuery.of(context).size.width * 0.21,
          height: 40,
          color: Colors.grey[400],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SvgPicture.asset("assets/image/united-arab-emirates.svg",
                    width: 20, height: 20),
                SizedBox(width: 6),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(width: 10,),
                Text("(UAE "+App_Localization.of(context).translate("dirham")+")",style: TextStyle(
                  fontSize: 13,
                ),)
              ],
            ),
          ),
        )
      ],
    ) : Center();
  }
  static bigLanguageBar(BuildContext context,ShopController shopController) {
    return shopController.openCountry.value ==true ?
    Column(
      children: [
        SizedBox(height: 30),
        Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: 40,
          color: Colors.grey[400],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SvgPicture.asset("assets/image/united-arab-emirates.svg",
                    width: 18, height: 18),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(width: 5),
                Text("(UAE "+App_Localization.of(context).translate("dirham")+")",style: TextStyle(
                  fontSize: 10,
                ),)
              ],
            ),
          ),
        )
      ],
    ) : Center();
  }
  static medLanguageBar(BuildContext context,ShopController shopController) {
    return shopController.openCountry.value ==true ?
    Column(
      children: [
        SizedBox(height: 30),
        Container(
          width: MediaQuery.of(context).size.width * 0.28,
          height: 35,
          color: Colors.grey[400],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SvgPicture.asset("assets/image/united-arab-emirates.svg",
                    width: 15, height: 15),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(width: 5),
                Text("(UAE "+App_Localization.of(context).translate("dirham")+")",style: TextStyle(
                  fontSize: 9,
                ),)
              ],
            ),
          ),
        )
      ],
    ) : Center();
  }

  ////////////////// LanguageBarHome //////////////////
  static languageBarHome(BuildContext context,HomeController homeController) {
    return MediaQuery.of(context).size.width>App.extra?extraLanguageBarHome(context,homeController) :
     MediaQuery.of(context).size.width>App.xLarge?xLargeLanguageBarHome(context,homeController) :
      MediaQuery.of(context).size.width>App.larg?largeLanguageBarHome(context,homeController)
        : MediaQuery.of(context).size.width>App.big ? bigLanguageBarHome(context,homeController) :
    medLanguageBarHome(context,homeController);
  }
  static extraLanguageBarHome(BuildContext context,HomeController homeController) {
    return homeController.openCountry.value == true ?
    Column(
      children: [
        SizedBox(height: 55),
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Image.asset("assets/image/Icon_AED.png",
                    width: 50, height: 50),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: "POPPINS"
                ),),
                SizedBox(width: 10,),
                Text("(UAE "+App_Localization.of(context).translate("dirham")+")",style: TextStyle(
                    fontSize: 23,
                    fontFamily: "POPPINS"
                ),)
              ],
            ),
          ),
        )
      ],
    ) : Center();
  }
  static xLargeLanguageBarHome(BuildContext context,HomeController homeController) {
    return homeController.openCountry.value ==true ?
    Column(
      children: [
        SizedBox(height: 40),
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset("assets/image/Icon_AED.png",
                    width: 40, height: 50),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "POPPINS"
                ),),
                SizedBox(width: 5),
                Text("(UAE "+App_Localization.of(context).translate("dirham")+")",style: TextStyle(
                    fontSize: 18,
                    fontFamily: "POPPINS"
                ),)
              ],
            ),
          ),
        )
      ],
    ) : Center();
  }
  static largeLanguageBarHome(BuildContext context,HomeController homeController) {
    return homeController.openCountry.value == true ?
    Column(
      children: [
        SizedBox(height: 35),
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Image.asset("assets/image/Icon_AED.png",
                    width: 30, height: 30),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "POPPINS"
                ),),
                SizedBox(width: 10,),
                Text("(UAE "+App_Localization.of(context).translate("dirham")+")",style: TextStyle(
                  fontSize: 14,
                    fontFamily: "POPPINS"
                ),)
              ],
            ),
          ),
        )
      ],
    ) : Center();
  }
  static bigLanguageBarHome(BuildContext context,HomeController homeController) {
    return homeController.openCountry.value ==true ?
    Column(
      children: [
        SizedBox(height: 30),
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Image.asset("assets/image/Icon_AED.png",
                    width: 25, height: 25),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: "POPPINS"
                ),),
                SizedBox(width: 5),
                Text("(UAE "+App_Localization.of(context).translate("dirham")+")",style: TextStyle(
                  fontSize: 10,
                    fontFamily: "POPPINS"
                ),)
              ],
            ),
          ),
        )
      ],
    ) : Center();
  }
  static medLanguageBarHome(BuildContext context,HomeController homeController) {
    return homeController.openCountry.value ==true ?
    Column(
      children: [
        SizedBox(height: 25),
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Image.asset("assets/image/Icon_AED.png",
                    width: 20, height: 20),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    fontFamily: "POPPINS"
                ),),
                SizedBox(width: 5),
                Text("(UAE "+App_Localization.of(context).translate("dirham")+")",style: TextStyle(
                  fontSize: 8,
                    fontFamily: "POPPINS"
                ),)
              ],
            ),
          ),
        )
      ],
    ) : Center();
  }

  //************************ News ************************

  static largeNews(BuildContext context,HomeController homeController) {
    print('-------------------');
    return Column(
      children: [
        // SizedBox(height: MediaQuery.of(context).size.width*0.13),
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
        )
      ],
    );
  }

}