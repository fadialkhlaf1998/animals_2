import 'package:animals/app_localization.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:animals/view/on_hover.dart';
import 'package:animals/view/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {

  HomeController homeController = Get.find();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: MediaQuery.of(context).size.width>App.extra ? extraHeader(context,homeController) :
            MediaQuery.of(context).size.width>App.extra2 ? extra2Header(context,homeController) :
            MediaQuery.of(context).size.width>App.xLarge ? xLargeHeader(context,homeController) :
            MediaQuery.of(context).size.width>App.xLarge2 ? xLarge2Header(context,homeController) :
            MediaQuery.of(context).size.width>App.larg ? largeHeader(context,homeController) :
            MediaQuery.of(context).size.width>App.larg2 ? large2Header(context,homeController) :
            bigHeader(context,homeController),
        );
      }
    );
  }

  blackHeader(BuildContext context,double height,HomeController homeController,double fontSize,double img,double icon){
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: img + icon,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(App_Localization.of(context).translate("free_pet_pick_up"),
                  style: TextStyle(
                      color: App.secondry,
                      fontSize: fontSize,
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
                  SvgPicture.asset("assets/image/Icon_AED.svg",
                    width: img, height: img,),
                  homeController.openCountry.value == false ?
                  Icon(Icons.arrow_drop_down,color: Colors.white,size: icon,) :
                  Icon(Icons.arrow_drop_up,color: Colors.white,size: icon)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  titleHeader(BuildContext context,int index,String title,HomeController homeController,double font){
    return MouseRegion(
      onHover: (point){
        homeController.hoverIndex.value=index;
        homeController.serviceHover.value=false;
        if(index==2){
          homeController.serviceHover.value=true;
        }
        if(index==5){
          homeController.newsHover.value=true;
        }
      },
      onExit: (point){
        Future.delayed(Duration(milliseconds: 300)).then((value) {
          homeController.hoverIndex.value=-1;
          if(index==2){
            homeController.serviceHover.value=false;
          }
          if(index==5){
            homeController.newsHover.value=false;
          }

        });

      },

      child: GestureDetector(
        onTap: (){
          Get.back();
          Get.back();
          Get.back();
          Get.back();
          homeController.btmNavBarIndex.value = index;

        },
        child: Container(
          child: Center(child: Text(
              App_Localization.of(context).translate(title).toUpperCase(),
              style: TextStyle(
                  color: homeController.hoverIndex.value==index||homeController.btmNavBarIndex.value==index?App.primery:Colors.black,
                  fontSize: font,
                  fontFamily: "POPPINS",
                  fontWeight: FontWeight.w500),maxLines: 1),
          ),
        ),
      ),
    );
  }
  fakeTitleHeader(BuildContext context,int index,String title,double font){
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        child: Center(child: Text(
            App_Localization.of(context).translate(title).toUpperCase(),
            style: TextStyle(
                color:Colors.transparent,
                fontSize: font,
                fontFamily: "POPPINS",
                fontWeight: FontWeight.w500),maxLines: 1),
        ),
      ),
    );
  }
  serviceList(BuildContext context,double fontSize, double hpadding, double vpadding) {
    return ListView.builder(
      itemCount: homeController.service.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return OnHover(builder: (hover){
          return  GestureDetector(
            onTap: (){
              homeController.btmNavBarIndex.value = 2;
              homeController.selectedServices.value = index;
              Future.delayed(Duration(milliseconds: 500)).then((value) {
                homeController.scrollDown();
              });
            },
            child: Container(
                color: hover?App.orange.withOpacity(0.5):App.primery,
                padding: EdgeInsets.symmetric(horizontal: hpadding,vertical: vpadding),
                child: Text(
                  homeController.service[index].title!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontFamily: "POPPINS"
                  ),
                )
            ),
          );
        }
        );
      },
    );
  }
  newsList(BuildContext context,double fontSize, double hpadding, double vpadding){
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        OnHover(builder: (hover){
          return  GestureDetector(
            onTap: (){
              homeController.btmNavBarIndex.value = 5;
              homeController.selectedNews.value = 0;
            },
            child: Container(
                color: hover?App.orange.withOpacity(0.5):App.primery,
                padding: EdgeInsets.symmetric(horizontal: hpadding,vertical: vpadding),
                child: Text(
                  App_Localization.of(context).translate("events"),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontFamily: "POPPINS"
                  ),
                )
            ),
          );
        }
        ),
        OnHover(builder: (hover){
          return  GestureDetector(
            onTap: (){
              homeController.btmNavBarIndex.value = 5;
              homeController.selectedNews.value = 1;
            },
            child: Container(
                color: hover?App.orange.withOpacity(0.5):App.primery,
                padding: EdgeInsets.symmetric(horizontal: hpadding,vertical: vpadding),
                child: Text(
                  App_Localization.of(context).translate("blog"),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontFamily: "POPPINS"
                  ),
                )
            ),
          );
        }
        )
      ],
    );
  }


  ///////////////  Extra ///////////////
  extraHeader(BuildContext context,HomeController homeController){
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width*0.13,
          color: Colors.white,
          child: Column(
            children: [
              blackHeader(context,55,homeController,23,35,40),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width*0.13-55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Center(
                        child: GestureDetector(
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
                            width: MediaQuery.of(context).size.width * 0.1,
                            height:  MediaQuery.of(context).size.width * 0.13 - 55 ,
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
                      width: MediaQuery.of(context).size.width / 2,
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
                                                    fontSize: 23,
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
                                                      fontSize: 23,
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
                                                  child: Container(
                                                    width: 90,
                                                    height: 70,
                                                    decoration: BoxDecoration(
                                                        color: App.primery,
                                                        borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(40),
                                                            bottomRight: Radius.circular(40))
                                                    ),
                                                    child: Icon(Icons.search,color: Colors.white,size: 50,),
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
                                      titleHeader(context,0,"home",homeController,23),
                                      titleHeader(context,1,"about",homeController,23),
                                      titleHeader(context,2,"services",homeController,23),
                                      titleHeader(context,3,"rates",homeController,23),
                                      titleHeader(context,4,"gallery",homeController,23),
                                      titleHeader(context,5,"news",homeController,23),
                                      titleHeader(context,6,"contact_us",homeController,23),
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
                              color: App.purple,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.025,
                                    height: MediaQuery.of(context).size.width * 0.025,
                                    child: SvgPicture.asset("assets/image/Icon_GoToShop.svg",color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Center(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.04,
                                        child: Text(App_Localization.of(context).translate("go_to_shop").toUpperCase(),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontFamily: "POPPINS",
                                              color: Colors.white ,
                                              fontSize: 23,
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
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                color: App.primery,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.025,
                                        height: MediaQuery.of(context).size.width * 0.025,
                                        child: SvgPicture.asset("assets/image/Icon_Boarding.svg",
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
                                                  fontSize: 23,
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
              ),
            ],
          ),
        ),
        extraHover(context,homeController,23)
      ],
    );
  }
  extraHover(BuildContext context,HomeController homeController,double fontSize){
    return
      homeController.serviceHover.value||
      homeController.serviceHoverContainer.value
      ?MouseRegion(
        onHover: (point){
          homeController.serviceHoverContainer.value=true;
        },
        onExit:  (point){
          homeController.serviceHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.35,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fakeTitleHeader(context,0,"home",fontSize),
                        fakeTitleHeader(context,1,"about",fontSize),
                        Container(
                          width: 200+((MediaQuery.of(context).size.width*0.35)/35),
                          color: App.primery,
                          child: serviceList(context,23,10,8),
                        ),
                        fakeTitleHeader(context,4,"gallery",fontSize),
                        fakeTitleHeader(context,5,"news",fontSize),
                        fakeTitleHeader(context,6,"contact_us",fontSize),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      homeController.newsHover.value||
      homeController.newsHoverContainer.value
      ?MouseRegion(
        onHover: (point){
          homeController.newsHoverContainer.value=true;
        },
        onExit:  (point){
          homeController.newsHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.35,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        fakeTitleHeader(context,0,"home",fontSize),
                        fakeTitleHeader(context,1,"about",fontSize),
                        fakeTitleHeader(context,2,"services",fontSize),
                        fakeTitleHeader(context,3,"rates",fontSize),
                        fakeTitleHeader(context,4,"gallery",fontSize),
                        // SizedBox(width: (MediaQuery.of(context).size.width*0.35)/35,),
                        Container(
                          width: 190+((MediaQuery.of(context).size.width*0.35)/35),
                          color: App.primery,
                          child: newsList(context,23,10,8),
                        ),
                        SizedBox(width: (MediaQuery.of(context).size.width*0.001),),
                        // fakeTitleHeader(context,4,"contact_us",25),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      Center();
  }

  ///////////////  Extra2 ///////////////
  extra2Header(BuildContext context,HomeController homeController){
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width*0.13,
          color: Colors.white,
          child: Column(
            children: [
              blackHeader(context,50,homeController,21,30,35),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width*0.13-50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Center(
                        child: GestureDetector(
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
                            width: MediaQuery.of(context).size.width * 0.1,
                            height:  MediaQuery.of(context).size.width * 0.13 - 50 ,
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
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width * 0.13 - 50,
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
                                              height: 65,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius: BorderRadius.circular(40)
                                              ),
                                              child: TextField(
                                                onSubmitted: (query){
                                                  homeController.search(context, query);
                                                },
                                                style: TextStyle(
                                                    fontSize: 21,
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
                                                      fontSize: 21,
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
                                                  child: Container(
                                                    width: 90,
                                                    height: 65,
                                                    decoration: BoxDecoration(
                                                        color: App.primery,
                                                        borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(40),
                                                            bottomRight: Radius.circular(40))
                                                    ),
                                                    child: Icon(Icons.search,color: Colors.white,size: 50,),
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
                                      titleHeader(context,0,"home",homeController,21),
                                      titleHeader(context,1,"about",homeController,21),
                                      titleHeader(context,2,"services",homeController,21),
                                      titleHeader(context,3,"rates",homeController,21),
                                      titleHeader(context,4,"gallery",homeController,21),
                                      titleHeader(context,5,"news",homeController,21),
                                      titleHeader(context,6,"contact_us",homeController,21),
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
                    Container(
                      height: MediaQuery.of(context).size.width*0.13 - 50,
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
                              color: App.purple,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.025,
                                    height: MediaQuery.of(context).size.width * 0.025,
                                    child: SvgPicture.asset("assets/image/Icon_GoToShop.svg",color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Center(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.04,
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
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                color: App.primery,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.025,
                                        height: MediaQuery.of(context).size.width * 0.025,
                                        child: SvgPicture.asset("assets/image/Icon_Boarding.svg",
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
              ),
            ],
          ),
        ),
        extra2Hover(context,homeController,21)
      ],
    );
  }
  extra2Hover(BuildContext context,HomeController homeController,double fontSize){
    return
      homeController.serviceHover.value||
          homeController.serviceHoverContainer.value
          ?MouseRegion(
        onHover: (point){
          homeController.serviceHoverContainer.value=true;
        },
        onExit:  (point){
          homeController.serviceHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.35,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fakeTitleHeader(context,0,"home",fontSize),
                        fakeTitleHeader(context,1,"about",fontSize),
                        Container(
                          width: 200+((MediaQuery.of(context).size.width*0.35)/35),
                          color: App.primery,
                          child: serviceList(context,21,10,8),
                        ),
                        fakeTitleHeader(context,4,"gallery",fontSize),
                        fakeTitleHeader(context,5,"news",fontSize),
                        fakeTitleHeader(context,6,"contact_us",fontSize),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      homeController.newsHover.value||
          homeController.newsHoverContainer.value
          ?MouseRegion(
        onHover: (point){
          homeController.newsHoverContainer.value=true;
        },
        onExit:  (point){
          homeController.newsHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.35,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fakeTitleHeader(context,0,"home",fontSize),
                        fakeTitleHeader(context,1,"about",fontSize),
                        fakeTitleHeader(context,2,"services",fontSize),
                        fakeTitleHeader(context,3,"rates",fontSize),
                        fakeTitleHeader(context,4,"gallery",fontSize),
                        Container(
                          width: 170+((MediaQuery.of(context).size.width*0.35)/35),
                          color: App.primery,
                          child: newsList(context,21,10,8),
                        ),
                        SizedBox(width: (MediaQuery.of(context).size.width*0.001),),
                        // fakeTitleHeader(context,4,"contact_us",25),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      Center();
  }

  ///////////////  xLarge ///////////////
  xLargeHeader(BuildContext context,HomeController homeController){
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width*0.12,
          color: Colors.white,
          child: Column(
            children: [
              blackHeader(context,45,homeController,19,25,30),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width*0.12-45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Center(
                        child: GestureDetector(
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
                            width: MediaQuery.of(context).size.width * 0.1,
                            height:  MediaQuery.of(context).size.width * 0.12 - 45 ,
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
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width * 0.12 - 45,
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
                                                    fontSize: 19,
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
                                                      fontSize: 19,
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
                                                  child: Container(
                                                    width: 80,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                        color: App.primery,
                                                        borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(40),
                                                            bottomRight: Radius.circular(40))
                                                    ),
                                                    child: Icon(Icons.search,color: Colors.white,size: 40,),
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
                                      titleHeader(context,0,"home",homeController,19),
                                      titleHeader(context,1,"about",homeController,19),
                                      titleHeader(context,2,"services",homeController,19),
                                      titleHeader(context,3,"rates",homeController,19),
                                      titleHeader(context,4,"gallery",homeController,19),
                                      titleHeader(context,5,"news",homeController,19,),
                                      titleHeader(context,6,"contact_us",homeController,19),
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
                    Container(
                      height: MediaQuery.of(context).size.width*0.12 - 45,
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
                              color: App.purple,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.025,
                                    height: MediaQuery.of(context).size.width * 0.025,
                                    child: SvgPicture.asset("assets/image/Icon_GoToShop.svg",color: Colors.white,
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
                                              fontSize: 19,
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
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                color: App.primery,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.025,
                                        height: MediaQuery.of(context).size.width * 0.025,
                                        child: SvgPicture.asset("assets/image/Icon_Boarding.svg",
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
                                                  fontSize: 19,
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
              ),
            ],
          ),
        ),
        xLargeHover(context,homeController,19)
      ],
    );
  }
  xLargeHover(BuildContext context,HomeController homeController,double fontSize){
    return
      homeController.serviceHover.value||
          homeController.serviceHoverContainer.value
          ?MouseRegion(
        onHover: (point){
          homeController.serviceHoverContainer.value=true;
        },
        onExit:  (point){
          homeController.serviceHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.35,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fakeTitleHeader(context,0,"home",fontSize),
                        fakeTitleHeader(context,1,"about",fontSize),
                        Container(
                          width: 170+((MediaQuery.of(context).size.width*0.35)/35),
                          color: App.primery,
                          child: serviceList(context,19,10,8),
                        ),
                        fakeTitleHeader(context,4,"gallery",fontSize),
                        fakeTitleHeader(context,5,"news",fontSize),
                        fakeTitleHeader(context,6,"contact_us",fontSize),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      homeController.newsHover.value||
          homeController.newsHoverContainer.value
          ?MouseRegion(
        onHover: (point){
          homeController.newsHoverContainer.value=true;
        },
        onExit:  (point){
          homeController.newsHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.35,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fakeTitleHeader(context,0,"home",fontSize),
                        fakeTitleHeader(context,1,"about",fontSize),
                        fakeTitleHeader(context,2,"services",fontSize),
                        fakeTitleHeader(context,3,"rates",fontSize),
                        fakeTitleHeader(context,4,"gallery",fontSize),
                        Container(
                          width: 160+((MediaQuery.of(context).size.width*0.35)/35),
                          color: App.primery,
                          child: newsList(context, 19,10,8),
                        ),
                        SizedBox(width: (MediaQuery.of(context).size.width*0.001),),
                        // fakeTitleHeader(context,4,"contact_us",25),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      Center();
  }

  ///////////////  xLarge2 ///////////////
  xLarge2Header(BuildContext context,HomeController homeController){
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width*0.12,
          color: Colors.white,
          child: Column(
            children: [
              blackHeader(context,40,homeController,17,20,25),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width*0.12-40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Center(
                        child: GestureDetector(
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
                            width: MediaQuery.of(context).size.width * 0.1,
                            height:  MediaQuery.of(context).size.width * 0.12 - 40 ,
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
                      width: MediaQuery.of(context).size.width / 2,
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
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius: BorderRadius.circular(40)
                                              ),
                                              child: TextField(
                                                onSubmitted: (query){
                                                  homeController.search(context, query);
                                                },
                                                style: TextStyle(
                                                    fontSize: 17,
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
                                                      fontSize: 17,
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
                                                  child: Container(
                                                    width: 80,
                                                    height: 55,
                                                    decoration: BoxDecoration(
                                                        color: App.primery,
                                                        borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(40),
                                                            bottomRight: Radius.circular(40))
                                                    ),
                                                    child: Icon(Icons.search,color: Colors.white,size: 40,),
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
                                      titleHeader(context,0,"home",homeController,17),
                                      titleHeader(context,1,"about",homeController,17),
                                      titleHeader(context,2,"services",homeController,17),
                                      titleHeader(context,3,"rates",homeController,17),
                                      titleHeader(context,4,"gallery",homeController,17),
                                      titleHeader(context,5,"news",homeController,17),
                                      titleHeader(context,6,"contact_us",homeController,17),
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
                              color: App.purple,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.025,
                                    height: MediaQuery.of(context).size.width * 0.025,
                                    child: SvgPicture.asset("assets/image/Icon_GoToShop.svg",color: Colors.white,
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
                                              fontSize: 17,
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
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                color: App.primery,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.025,
                                        height: MediaQuery.of(context).size.width * 0.025,
                                        child: SvgPicture.asset("assets/image/Icon_Boarding.svg",
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
                                                  fontSize: 17,
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
              ),
            ],
          ),
        ),
        xLarge2Hover(context,homeController,17)
      ],
    );
  }
  xLarge2Hover(BuildContext context,HomeController homeController,double fontSize){
    return
      homeController.serviceHover.value||
          homeController.serviceHoverContainer.value
          ?MouseRegion(
        onHover: (point){
          homeController.serviceHoverContainer.value=true;
        },
        onExit:  (point){
          homeController.serviceHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.35,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fakeTitleHeader(context,0,"home",fontSize),
                        fakeTitleHeader(context,1,"about",fontSize),
                        Container(
                          width: 150+((MediaQuery.of(context).size.width*0.35)/35),
                          color: App.primery,
                          child: serviceList(context,17,10,8),
                        ),
                        fakeTitleHeader(context,4,"gallery",fontSize),
                        fakeTitleHeader(context,5,"news",fontSize),
                        fakeTitleHeader(context,6,"contact_us",fontSize),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      homeController.newsHover.value||
          homeController.newsHoverContainer.value
          ?MouseRegion(
        onHover: (point){
          homeController.newsHoverContainer.value=true;
        },
        onExit:  (point){
          homeController.newsHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.35,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fakeTitleHeader(context,0,"home",fontSize),
                        fakeTitleHeader(context,1,"about",fontSize),
                        fakeTitleHeader(context,2,"services",fontSize),
                        fakeTitleHeader(context,3,"rates",fontSize),
                        fakeTitleHeader(context,4,"gallery",fontSize),
                        Container(
                          width: 140+((MediaQuery.of(context).size.width*0.35)/35),
                          color: App.primery,
                          child: newsList(context, 17,10,8),
                        ),
                        SizedBox(width: (MediaQuery.of(context).size.width*0.001),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      Center();
  }

  ///////////////  Large ///////////////
  largeHeader(BuildContext context,HomeController homeController){
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width*0.12,
          color: Colors.white,
          child: Column(
            children: [
              blackHeader(context,35,homeController,15,15,20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width*0.12-35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Center(
                        child: GestureDetector(
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
                            width: MediaQuery.of(context).size.width * 0.1,
                            height:  MediaQuery.of(context).size.width * 0.12 - 35 ,
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
                      width: MediaQuery.of(context).size.width / 2,
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
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.4,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius: BorderRadius.circular(40)
                                              ),
                                              child: TextField(
                                                onSubmitted: (query){
                                                  homeController.search(context, query);
                                                },
                                                style: TextStyle(
                                                    fontSize: 15,
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
                                                      fontSize: 15,
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
                                                  child: Container(
                                                    width: 45,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        color: App.primery,
                                                        borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(40),
                                                            bottomRight: Radius.circular(40))
                                                    ),
                                                    child: Icon(Icons.search,color: Colors.white),
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
                                      titleHeader(context,0,"home",homeController,15),
                                      titleHeader(context,1,"about",homeController,15),
                                      titleHeader(context,2,"services",homeController,15),
                                      titleHeader(context,3,"rates",homeController,15),
                                      titleHeader(context,4,"gallery",homeController,15),
                                      titleHeader(context,5,"news",homeController,15),
                                      titleHeader(context,6,"contact_us",homeController,15),
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
                              color: App.purple,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.025,
                                    height: MediaQuery.of(context).size.width * 0.025,
                                    child: SvgPicture.asset("assets/image/Icon_GoToShop.svg",color: Colors.white,
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
                                              fontFamily: "POPPINS",
                                              color: Colors.white ,
                                              fontSize: 15,
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
                                color: App.primery,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.025,
                                        height: MediaQuery.of(context).size.width * 0.025,
                                        child: SvgPicture.asset("assets/image/Icon_Boarding.svg",
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
                                                  fontFamily: "POPPINS",
                                                  color: Colors.white ,
                                                  fontSize: 16,
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
              ),
            ],
          ),
        ),
        largeHover(context,homeController,16)
      ],
    );
  }
  largeHover(BuildContext context,HomeController homeController,double fontSize){
    return
      homeController.serviceHover.value||
          homeController.serviceHoverContainer.value
          ?MouseRegion(
        onHover: (point){
          homeController.serviceHoverContainer.value=true;
        },
        onExit:  (point){
          homeController.serviceHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.35,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fakeTitleHeader(context,0,"home",fontSize),
                        fakeTitleHeader(context,1,"about",fontSize),
                        Container(
                          width: 120+((MediaQuery.of(context).size.width*0.35)/35),
                          color: App.primery,
                          child: serviceList(context,15,10,8),
                        ),
                        fakeTitleHeader(context,4,"gallery",fontSize),
                        fakeTitleHeader(context,5,"news",fontSize),
                        fakeTitleHeader(context,6,"contact_us",fontSize),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      homeController.newsHover.value||
          homeController.newsHoverContainer.value
          ?MouseRegion(
        onHover: (point){
          homeController.newsHoverContainer.value=true;
        },
        onExit:  (point){
          homeController.newsHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.35,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fakeTitleHeader(context,0,"home",fontSize),
                        fakeTitleHeader(context,1,"about",fontSize),
                        fakeTitleHeader(context,2,"services",fontSize),
                        fakeTitleHeader(context,3,"rates",fontSize),
                        fakeTitleHeader(context,4,"gallery",fontSize),
                        Container(
                          width: 130+((MediaQuery.of(context).size.width*0.35)/35),
                          color: App.primery,
                          child: newsList(context, 15,10,8),
                        ),
                        SizedBox(width: (MediaQuery.of(context).size.width*0.001),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      Center();
  }

  ///////////////  Large2 ///////////////
  large2Header(BuildContext context,HomeController homeController){
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width*0.13,
          color: Colors.white,
          child: Column(
            children: [
              blackHeader(context,30,homeController,12,16,20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width*0.13-30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Center(
                        child: GestureDetector(
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
                            width: MediaQuery.of(context).size.width * 0.1,
                            height:  MediaQuery.of(context).size.width * 0.13 - 30 ,
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
                      width: MediaQuery.of(context).size.width / 2,
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
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.4,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius: BorderRadius.circular(40)
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
                                                  child: Container(
                                                    width: 45,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                        color: App.primery,
                                                        borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(40),
                                                            bottomRight: Radius.circular(40))
                                                    ),
                                                    child: Icon(Icons.search,color: Colors.white),
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
                            width: MediaQuery.of(context).size.width*0.38,
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.38,
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
                    Container(
                      height: MediaQuery.of(context).size.width*0.13 - 30,
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
                              color: App.purple,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.025,
                                    height: MediaQuery.of(context).size.width * 0.025,
                                    child: SvgPicture.asset("assets/image/Icon_GoToShop.svg",color: Colors.white,
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
                                              fontFamily: "POPPINS",
                                              color: Colors.white ,
                                              fontSize: 12,
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
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                color: App.primery,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.025,
                                        height: MediaQuery.of(context).size.width * 0.025,
                                        child: SvgPicture.asset("assets/image/Icon_Boarding.svg",
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Center(
                                          child: Container(
                                            width: MediaQuery.of(context).size.width * 0.07,
                                            child: Text(App_Localization.of(context).translate("book_a_boarding").toUpperCase(),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontFamily: "POPPINS",
                                                  color: Colors.white ,
                                                  fontSize: 12,
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
              ),
            ],
          ),
        ),
        large2Hover(context,homeController,12)
      ],
    );
  }
  large2Hover(BuildContext context,HomeController homeController,double fontSize){
    return
      homeController.serviceHover.value||
          homeController.serviceHoverContainer.value
          ?MouseRegion(
        onHover: (point){
          homeController.serviceHoverContainer.value=true;
        },
        onExit:  (point){
          homeController.serviceHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.38,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.38,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fakeTitleHeader(context,0,"home",fontSize),
                        fakeTitleHeader(context,1,"about",fontSize),
                        Container(
                          width: 100+((MediaQuery.of(context).size.width*0.38)/38),
                          color: App.primery,
                          child: serviceList(context,12,10,8),
                        ),
                        fakeTitleHeader(context,4,"gallery",fontSize),
                        fakeTitleHeader(context,5,"news",fontSize),
                        fakeTitleHeader(context,6,"contact_us",fontSize),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      homeController.newsHover.value||
          homeController.newsHoverContainer.value
          ?MouseRegion(
        onHover: (point){
          homeController.newsHoverContainer.value=true;
        },
        onExit:  (point){
          homeController.newsHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.38,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.38,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fakeTitleHeader(context,0,"home",fontSize),
                        fakeTitleHeader(context,1,"about",fontSize),
                        fakeTitleHeader(context,2,"services",fontSize),
                        fakeTitleHeader(context,3,"rates",fontSize),
                        fakeTitleHeader(context,4,"gallery",fontSize),
                        Container(
                          width: 100+((MediaQuery.of(context).size.width*0.38)/38),
                          color: App.primery,
                          child: newsList(context, 12,10,8),
                        ),
                        SizedBox(width: (MediaQuery.of(context).size.width*0.001),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      Center();
  }

  ///////////////  Big ///////////////
  bigHeader(BuildContext context,HomeController homeController){
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width*0.15,
          color: Colors.white,
          child: Column(
            children: [
              blackHeader(context,25,homeController,10,13,15),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width*0.15-25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Center(
                        child: GestureDetector(
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
                            width: MediaQuery.of(context).size.width * 0.1,
                            height:  MediaQuery.of(context).size.width * 0.13 - 25 ,
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
                      width: MediaQuery.of(context).size.width / 2,
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
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.45,
                                              height: 30,
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
                                                  child: Container(
                                                    width: 40,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        color: App.primery,
                                                        borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(20),
                                                            bottomRight: Radius.circular(20))
                                                    ),
                                                    child: Icon(Icons.search,color: Colors.white),
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
                            width: MediaQuery.of(context).size.width*0.43,
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.43,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      titleHeader(context,0,"home",homeController,10),
                                      titleHeader(context,1,"about",homeController,10),
                                      titleHeader(context,2,"services",homeController,10),
                                      titleHeader(context,3,"rates",homeController,10),
                                      titleHeader(context,4,"gallery",homeController,10),
                                      titleHeader(context,5,"news",homeController,10),
                                      titleHeader(context,6,"contact_us",homeController,10),
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
                    Container(
                      height: MediaQuery.of(context).size.width*0.15 - 25,
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
                              color: App.purple,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.025,
                                    height: MediaQuery.of(context).size.width * 0.025,
                                    child: SvgPicture.asset("assets/image/Icon_GoToShop.svg",
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.05,
                                        child: Text(App_Localization.of(context).translate("go_to_shop").toUpperCase(),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontFamily: "POPPINS",
                                              color: Colors.white ,
                                              fontSize: 9,
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
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                color: App.primery,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.025,
                                        height: MediaQuery.of(context).size.width * 0.025,
                                        child: SvgPicture.asset("assets/image/Icon_Boarding.svg",
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Center(
                                          child: Container(
                                            width: MediaQuery.of(context).size.width * 0.1,
                                            child: Text(App_Localization.of(context).translate("book_a_boarding").toUpperCase(),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontFamily: "POPPINS",
                                                  color: Colors.white ,
                                                  fontSize: 9,
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
              ),
            ],
          ),
        ),
        bigHover(context,homeController,10)
      ],
    );
  }
  bigHover(BuildContext context,HomeController homeController,double fontSize){
    return
      homeController.serviceHover.value||
          homeController.serviceHoverContainer.value
          ?MouseRegion(
        onHover: (point){
          homeController.serviceHoverContainer.value=true;
        },
        onExit:  (point){
          homeController.serviceHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.43,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.43,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fakeTitleHeader(context,0,"home",fontSize),
                        fakeTitleHeader(context,1,"about",fontSize),
                        Container(
                          width: 90+((MediaQuery.of(context).size.width*0.35)/35),
                          color: App.primery,
                          child: serviceList(context,10,10,8),
                        ),
                        fakeTitleHeader(context,4,"gallery",fontSize),
                        fakeTitleHeader(context,5,"news",fontSize),
                        fakeTitleHeader(context,6,"contact_us",fontSize),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      homeController.newsHover.value||
          homeController.newsHoverContainer.value
          ?MouseRegion(
        onHover: (point){
          homeController.newsHoverContainer.value=true;
        },
        onExit:  (point){
          homeController.newsHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.43,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.43,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fakeTitleHeader(context,0,"home",fontSize),
                        fakeTitleHeader(context,1,"about",fontSize),
                        fakeTitleHeader(context,2,"services",fontSize),
                        fakeTitleHeader(context,3,"rates",fontSize),
                        fakeTitleHeader(context,4,"gallery",fontSize),
                        Container(
                          width: 90+((MediaQuery.of(context).size.width*0.35)/35),
                          color: App.primery,
                          child: newsList(context, 10,10,8),
                        ),
                        SizedBox(width: (MediaQuery.of(context).size.width*0.001),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      Center();
  }
}
