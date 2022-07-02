import 'package:animals/app_localization.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/controller/shop_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:animals/view/on_hover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ShopHeader extends StatelessWidget {

  ShopController shopController = Get.find();
  HomeController homeController = Get.find();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Obx(
            () {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: MediaQuery.of(context).size.width>App.extra ? extraHeader(context,shopController) :
            MediaQuery.of(context).size.width>App.extra2 ? extra2Header(context,shopController) :
            MediaQuery.of(context).size.width>App.xLarge ? xLargeHeader(context,shopController) :
            MediaQuery.of(context).size.width>App.xLarge2 ? xLarge2Header(context,shopController) :
            MediaQuery.of(context).size.width>App.larg ? largeHeader(context,shopController) :
            MediaQuery.of(context).size.width>App.larg2 ? large2Header(context,shopController) :
            bigHeader(context,shopController),
          );
        }
    );
  }

  blackShopHeader(BuildContext context,double height,ShopController shopController,double fontSize,double img,double icon){
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
              child: Text(App_Localization.of(context).translate("same_day_delivery"),
                  style: TextStyle(
                      color: App.secondry,
                      fontSize: fontSize,
                      fontFamily: "FOUNDRYGRIDNIK"
                  )),
            ),
            GestureDetector(
              onTap: () {
                if(shopController.openCountry.value == false) {
                  shopController.openCountry.value = true;
                } else {
                  shopController.openCountry.value = false;
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset("assets/image/Icon_AED.svg",
                    width: img, height: img,),
                  shopController.openCountry.value == false ?
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
  titleShopHeader(BuildContext context,int index,String title,ShopController shopController,double font){
    return MouseRegion(
      onHover: (point){
        shopController.hoverIndex.value=index;
        shopController.petHover.value=false;
        if(index==1){
          shopController.petHover.value=true;
        }
        if(index==2){
          shopController.brandHover.value=true;
        }
      },
      onExit: (point){
        Future.delayed(Duration(milliseconds: 300)).then((value) {
          shopController.hoverIndex.value=-1;
          if(index==1){
            shopController.petHover.value=false;
          }
          if(index==2){
            shopController.brandHover.value=false;
          }
        });
      },
      child: GestureDetector(
        onTap: (){
          shopController.btmNavBarIndex.value = index;
        },
        child: Container(
          child: Center(child: Text(
              App_Localization.of(context).translate(title).toUpperCase(),
              style: TextStyle(
                  color: shopController.hoverIndex.value==index||shopController.btmNavBarIndex.value==index?App.primery:Colors.black,
                  fontSize: font,
                  fontFamily: "POPPINS",
                  fontWeight: FontWeight.w500),maxLines: 1),
          ),
        ),
      ),
    );
  }
  fakeTitleShopHeader(BuildContext context,int index,String title,double font){
    return Container(
      child: Center(child: Text(
          App_Localization.of(context).translate(title).toUpperCase(),
          style: TextStyle(
              color:Colors.transparent,
              fontSize: font,
              fontFamily: "POPPINS",
              fontWeight: FontWeight.w500),maxLines: 1),
      ),
    );
  }
  shopByPetList(BuildContext context,double pSuperCategory,double iconSize,double fontSize,double hpadding, double vpadding) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.width * 0.03),
              ListView.builder(
                itemCount: homeController.superCategory.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return OnHover(builder: (hover){
                    return  GestureDetector(
                      onTap: () {
                        homeController.selectedCategory.value = index;
                        shopController.animation(
                            MediaQuery.of(context).size.width * 0.126,
                            homeController.superCategory[homeController.selectedCategory.value].posts!.length
                        );
                      },
                      child: MouseRegion(
                        onHover: (point){
                          homeController.selectedCategory.value = index;
                        },
                        child: Container(
                          color: homeController.selectedCategory.value == index || hover ? App.grey : App.hoverGrey,
                          child: Padding(
                            padding: EdgeInsets.all(pSuperCategory),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  homeController.superCategory[index].title!,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSize,
                                      fontFamily: "POPPINS"
                                  ),
                                ),
                                Icon(Icons.arrow_right_outlined,size: iconSize,color: App.purple,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  );
                },
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.38,
          child: ListView.builder(
            itemCount: homeController.superCategory[homeController.selectedCategory.value].posts!.length,
            controller: shopController.scrollController,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, subindex) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.03,
                    width: MediaQuery.of(context).size.width * 0.126,
                    color: App.purple,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: vpadding,horizontal: hpadding),
                          child: Text(
                            homeController.superCategory[homeController.selectedCategory.value].posts![subindex].title!,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: fontSize,
                                fontFamily: "POPPINS"
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.12,
                        height: MediaQuery.of(context).size.width * 0.18,
                        color: App.grey,
                        child: ListView.builder(
                          itemCount: homeController.superCategory[homeController.selectedCategory.value].posts![subindex].posts!.length > 6 ?
                          6 : homeController.superCategory[homeController.selectedCategory.value].posts![subindex].posts!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                //todo
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: vpadding,horizontal: hpadding),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        OnHover(builder: (hover) {
                                          return Text(
                                            homeController.superCategory[homeController.selectedCategory.value].posts![subindex].posts![index].title!,
                                            style: TextStyle(
                                                color: hover ? App.primery : Colors.black,
                                                fontSize: fontSize,
                                                fontFamily: "POPPINS"
                                            ),
                                          );
                                        })
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      homeController.superCategory[homeController.selectedCategory.value].posts![subindex].posts!.length > 6 ?
                      GestureDetector(
                        onTap: () {
                          //todo go to product page
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.12,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: hpadding),
                            child: Text(App_Localization.of(context).translate("view_all"),
                                style: TextStyle(
                                  color: App.primery,
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "POPPINS",
                                )
                            ),
                          ),
                        ),
                      ) : Center()
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
  bigShopByPetList(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              ListView.builder(
                itemCount: homeController.superCategory.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return OnHover(builder: (hover){
                    return  GestureDetector(
                      onTap: () {
                        homeController.selectedCategory.value = index;
                        shopController.animation(
                            MediaQuery.of(context).size.width * 0.166,
                            homeController.superCategory[homeController.selectedCategory.value].posts!.length
                        );
                      },
                      child: MouseRegion(
                        onHover: (point){
                          homeController.selectedCategory.value = index;
                        },
                        child: Container(
                          color: homeController.selectedCategory.value == index || hover ? App.grey : App.hoverGrey,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  homeController.superCategory[index].title!,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontFamily: "POPPINS"
                                  ),
                                ),
                                Icon(Icons.arrow_right_outlined,size: 12,color: App.purple,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  );
                },
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: ListView.builder(
            itemCount: homeController.superCategory[homeController.selectedCategory.value].posts!.length,
            controller: shopController.scrollController,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, subindex) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.04,
                    width: MediaQuery.of(context).size.width * 0.166,
                    color: App.purple,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                          child: Text(
                            homeController.superCategory[homeController.selectedCategory.value].posts![subindex].title!,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: "POPPINS"
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.13,
                        height: MediaQuery.of(context).size.width * 0.18,
                        color: App.grey,
                        child: ListView.builder(
                          itemCount: homeController.superCategory[homeController.selectedCategory.value].posts![subindex].posts!.length > 6 ?
                          6 : homeController.superCategory[homeController.selectedCategory.value].posts![subindex].posts!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                //todo
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        OnHover(builder:(hover){
                                          return Text(
                                            homeController.superCategory[homeController.selectedCategory.value].posts![subindex].posts![index].title!,
                                            style: TextStyle(
                                                color: hover ? App.primery : Colors.black,
                                                fontSize: 10,
                                                fontFamily: "POPPINS"
                                            ),
                                          );
                                        })
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      homeController.superCategory[homeController.selectedCategory.value].posts![subindex].posts!.length > 6 ?
                      GestureDetector(
                        onTap: () {
                          //todo go to product page
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.12,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(App_Localization.of(context).translate("view_all"),
                                style: TextStyle(
                                  color: App.primery,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "POPPINS",
                                )
                            ),
                          ),
                        ),
                      ) : Center()
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
  shopByBrand(BuildContext context,double fontSize, double cPadding, double imgPadding) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: 1.2
        ),
        scrollDirection: Axis.vertical,
        itemCount: homeController.brand.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.all(cPadding),
              child: OnHover(builder: (hover) {
                return GestureDetector(
                  onTap: () {
                    //todo brand page
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: hover ? App.primery : Colors.transparent),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(imgPadding),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(homeController.brand[index]
                                    .image!
                                    .replaceAll(
                                    "localhost", "10.0.2.2")),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ),
                );
              })
          );
        });
  }

  //***************************** Extra *****************************
  extraHeader(BuildContext context,ShopController shopController){
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width*0.13,
          color: Colors.white,
          child: Column(
            children: [
              blackShopHeader(context,55,shopController,23,35,40),
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
                            Get.back();
                          },
                          child: Container(
                            color: Colors.white,
                            child: SvgPicture.asset("assets/image/logo.svg"),
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
                                                  homeController.locationSearch.value = 1;
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
                                                    homeController.locationSearch.value = 1;
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
                                      titleShopHeader(context,0,"home",shopController,23),
                                      Row(
                                        children: [
                                          titleShopHeader(context,1,"shop_by_bet",shopController,23),
                                          Icon(Icons.arrow_drop_down_outlined,size: 40,
                                            color: shopController.hoverIndex.value == 1 ||
                                                shopController.btmNavBarIndex.value == 1 ? App.primery : Colors.black,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          titleShopHeader(context,2,"shop_by_brands",shopController,23),
                                          Icon(Icons.arrow_drop_down_outlined,size: 40,
                                            color: shopController.hoverIndex.value == 2 ||
                                                shopController.btmNavBarIndex.value == 2 ? App.primery : Colors.black,
                                          )
                                        ],
                                      ),
                                      titleShopHeader(context,3,"offers",shopController,23),
                                      titleShopHeader(context,4,"new_arrivals",shopController,23),
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
                              //todo login
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
                                        child: Text(App_Localization.of(context).translate("login").toUpperCase(),
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
                              shopController.btmNavBarIndex.value = 6;
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
                                            child: Text(App_Localization.of(context).translate("cart").toUpperCase(),
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
        extraHover(context,shopController,23),
        Positioned(
          right: 0,
            child: App.shopLanguageBar(
            context, shopController, shopController.openCountry.value,55, 15, 35, 35, 23, 21))
      ],
    );
  }
  extraHover(BuildContext context,ShopController shopController,double fontSize){
    return
      shopController.petHover.value||
          shopController.petHoverContainer.value
          ? MouseRegion(
        onHover: (point){
          shopController.petHoverContainer.value=true;
        },
        onExit: (point){
          shopController.petHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.5,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.width * 0.25,
                          color: App.grey,
                          child: shopByPetList(context,15,40,23,15,20),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      shopController.brandHover.value||
          shopController.brandHoverContainer.value
          ?MouseRegion(
        onHover: (point){
          shopController.brandHoverContainer.value=true;
        },
        onExit:  (point){
          shopController.brandHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.4,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fakeTitleShopHeader(context,0,"home",fontSize),
                        Container(
                          width: MediaQuery.of(context).size.width*0.35,
                          height: MediaQuery.of(context).size.width * 0.2,
                          color: App.grey,
                          child: shopByBrand(context,23,40,20),
                        ),
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
  extra2Header(BuildContext context,ShopController shopController){
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width*0.13,
          color: Colors.white,
          child: Column(
            children: [
              blackShopHeader(context,50,shopController,21,30,35),
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
                            Get.back();
                          },
                          child: Container(
                            color: Colors.white,
                            child: SvgPicture.asset("assets/image/logo.svg"),
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
                                                  homeController.locationSearch.value = 1;
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
                                                    homeController.locationSearch.value = 1;
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
                                      titleShopHeader(context,0,"home",shopController,21),
                                      Row(
                                        children: [
                                          titleShopHeader(context,1,"shop_by_bet",shopController,21),
                                          Icon(Icons.arrow_drop_down_outlined,size: 35,
                                            color: shopController.hoverIndex.value == 1 ||
                                                shopController.btmNavBarIndex.value == 1 ? App.primery : Colors.black,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          titleShopHeader(context,2,"shop_by_brands",shopController,21),
                                          Icon(Icons.arrow_drop_down_outlined,size: 35,
                                            color: shopController.hoverIndex.value == 2 ||
                                                shopController.btmNavBarIndex.value == 2 ? App.primery : Colors.black,
                                          )
                                        ],
                                      ),
                                      titleShopHeader(context,3,"offers",shopController,21),
                                      titleShopHeader(context,4,"new_arrivals",shopController,21),
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
                              //todo login
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
                                        child: Text(App_Localization.of(context).translate("login").toUpperCase(),
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
                              shopController.btmNavBarIndex.value = 6;
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
                                            child: Text(App_Localization.of(context).translate("cart").toUpperCase(),
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
        extra2Hover(context,homeController,21),
        Positioned(
            right: 0,
            child: App.shopLanguageBar(
                context, shopController,shopController.openCountry.value,50, 13, 30, 30, 21, 19))
      ],
    );
  }
  extra2Hover(BuildContext context,HomeController homeController,double fontSize){
    return
      shopController.petHover.value||
          shopController.petHoverContainer.value
          ? MouseRegion(
        onHover: (point){
          shopController.petHoverContainer.value=true;
        },
        onExit: (point){
          shopController.petHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.5,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.width * 0.25,
                          color: App.grey,
                          child: shopByPetList(context,15,35,21,15,18),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      shopController.brandHover.value||
          shopController.brandHoverContainer.value
          ?MouseRegion(
        onHover: (point){
          shopController.brandHoverContainer.value=true;
        },
        onExit:  (point){
          shopController.brandHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.4,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fakeTitleShopHeader(context,0,"home",fontSize),
                        Container(
                          width: MediaQuery.of(context).size.width*0.35,
                          height: MediaQuery.of(context).size.width * 0.2,
                          color: App.grey,
                          child: shopByBrand(context,21,35,15),
                        ),
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

  ///////////////  XLarge ///////////////
  xLargeHeader(BuildContext context,ShopController shopController){
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width*0.12,
          color: Colors.white,
          child: Column(
            children: [
              blackShopHeader(context,45,shopController,19,25,30),
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
                            Get.back();
                          },
                          child: Container(
                            color: Colors.white,
                            child: SvgPicture.asset("assets/image/logo.svg"),
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
                                                  homeController.locationSearch.value = 1;
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
                                                    homeController.locationSearch.value = 1;
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
                                      titleShopHeader(context,0,"home",shopController,19),
                                      Row(
                                        children: [
                                          titleShopHeader(context,1,"shop_by_bet",shopController,19),
                                          Icon(Icons.arrow_drop_down_outlined,size: 30,
                                            color: shopController.hoverIndex.value == 1 ||
                                                shopController.btmNavBarIndex.value == 1 ? App.primery : Colors.black,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          titleShopHeader(context,2,"shop_by_brands",shopController,19),
                                          Icon(Icons.arrow_drop_down_outlined,size: 30,
                                            color: shopController.hoverIndex.value == 2 ||
                                                shopController.btmNavBarIndex.value == 2 ? App.primery : Colors.black,
                                          )
                                        ],
                                      ),
                                      titleShopHeader(context,3,"offers",shopController,19),
                                      titleShopHeader(context,4,"new_arrivals",shopController,19),
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
                              //todo login
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
                                        child: Text(App_Localization.of(context).translate("login").toUpperCase(),
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
                              shopController.btmNavBarIndex.value = 6;
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
                                            child: Text(App_Localization.of(context).translate("cart").toUpperCase(),
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
        xLargeHover(context,homeController,19),
        Positioned(
            right: 0,
            child: App.shopLanguageBar(
                context, shopController,shopController.openCountry.value,45, 11, 25, 25, 19, 17))
      ],
    );
  }
  xLargeHover(BuildContext context,HomeController homeController,double fontSize){
    return
      shopController.petHover.value||
          shopController.petHoverContainer.value
          ? MouseRegion(
        onHover: (point){
          shopController.petHoverContainer.value=true;
        },
        onExit: (point){
          shopController.petHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.5,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.width * 0.25,
                          color: App.grey,
                          child: shopByPetList(context,15,30,19,15,14),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      shopController.brandHover.value||
          shopController.brandHoverContainer.value
          ?MouseRegion(
        onHover: (point){
          shopController.brandHoverContainer.value=true;
        },
        onExit:  (point){
          shopController.brandHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.4,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fakeTitleShopHeader(context,0,"home",fontSize),
                        Container(
                          width: MediaQuery.of(context).size.width*0.35,
                          height: MediaQuery.of(context).size.width * 0.2,
                          color: App.grey,
                          child: shopByBrand(context,19,30,10),
                        ),
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

  ///////////////  XLarge2 ///////////////
  xLarge2Header(BuildContext context,ShopController shopController){
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width*0.12,
          color: Colors.white,
          child: Column(
            children: [
              blackShopHeader(context,40,shopController,17,20,25),
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
                            Get.back();
                          },
                          child: Container(
                            color: Colors.white,
                            child: SvgPicture.asset("assets/image/logo.svg"),
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
                                                  homeController.locationSearch.value = 1;
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
                                                    homeController.locationSearch.value = 1;
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
                            width: MediaQuery.of(context).size.width*0.37,
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.37,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      titleShopHeader(context,0,"home",shopController,17),
                                      Row(
                                        children: [
                                          titleShopHeader(context,1,"shop_by_bet",shopController,17),
                                          Icon(Icons.arrow_drop_down_outlined,size: 25,
                                            color: shopController.hoverIndex.value == 1 ||
                                                shopController.btmNavBarIndex.value == 1 ? App.primery : Colors.black,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          titleShopHeader(context,2,"shop_by_brands",shopController,17),
                                          Icon(Icons.arrow_drop_down_outlined,size: 25,
                                            color: shopController.hoverIndex.value == 2 ||
                                                shopController.btmNavBarIndex.value == 2 ? App.primery : Colors.black,
                                          )
                                        ],
                                      ),
                                      titleShopHeader(context,3,"offers",shopController,17),
                                      titleShopHeader(context,4,"new_arrivals",shopController,17),
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
                             //todo login
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
                                        child: Text(App_Localization.of(context).translate("login").toUpperCase(),
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
                              shopController.btmNavBarIndex.value = 6;
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
                                            child: Text(App_Localization.of(context).translate("cart").toUpperCase(),
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
        xLarge2Hover(context,homeController,17),
        Positioned(
            right: 0,
            child: App.shopLanguageBar(
                context, shopController,shopController.openCountry.value,40, 9, 20, 20, 17, 15))
      ],
    );
  }
  xLarge2Hover(BuildContext context,HomeController homeController,double fontSize){
    return
      shopController.petHover.value||
          shopController.petHoverContainer.value
          ? MouseRegion(
        onHover: (point){
          shopController.petHoverContainer.value=true;
        },
        onExit: (point){
          shopController.petHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.5,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.width * 0.25,
                          color: App.grey,
                          child: shopByPetList(context,13,25,17,15,12),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      shopController.brandHover.value||
          shopController.brandHoverContainer.value
          ?MouseRegion(
        onHover: (point){
          shopController.brandHoverContainer.value=true;
        },
        onExit:  (point){
          shopController.brandHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.4,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fakeTitleShopHeader(context,0,"home",fontSize),
                        Container(
                          width: MediaQuery.of(context).size.width*0.35,
                          height: MediaQuery.of(context).size.width * 0.2,
                          color: App.grey,
                          child: shopByBrand(context,17,30,10),
                        ),
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
  largeHeader(BuildContext context,ShopController shopController){
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width*0.12,
          color: Colors.white,
          child: Column(
            children: [
              blackShopHeader(context,35,shopController,15,15,20),
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
                           Get.back();
                          },
                          child: Container(
                            color: Colors.white,
                            child: SvgPicture.asset("assets/image/logo.svg"),
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
                                                  homeController.locationSearch.value = 1;
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
                                                    homeController.locationSearch.value = 1;
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
                            width: MediaQuery.of(context).size.width*0.38,
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.38,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      titleShopHeader(context,0,"home",shopController,15),
                                      Row(
                                        children: [
                                          titleShopHeader(context,1,"shop_by_bet",shopController,15),
                                          Icon(Icons.arrow_drop_down_outlined,size: 20,
                                            color: shopController.hoverIndex.value == 1 ||
                                                shopController.btmNavBarIndex.value == 1 ? App.primery : Colors.black,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          titleShopHeader(context,2,"shop_by_brands",shopController,15),
                                          Icon(Icons.arrow_drop_down_outlined,size: 20,
                                            color: shopController.hoverIndex.value == 2 ||
                                                shopController.btmNavBarIndex.value == 2 ? App.primery : Colors.black,
                                          )
                                        ],
                                      ),
                                      titleShopHeader(context,3,"offers",shopController,15),
                                      titleShopHeader(context,4,"new_arrivals",shopController,15),
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
                              //todo login
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
                                        child: Text(App_Localization.of(context).translate("login").toUpperCase(),
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
                              shopController.btmNavBarIndex.value = 6;
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
                                            child: Text(App_Localization.of(context).translate("cart").toUpperCase(),
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
        largeHover(context,homeController,15),
        Positioned(
            right: 0,
            child: App.shopLanguageBar(
                context, shopController,shopController.openCountry.value,35, 7, 15, 15, 15, 13))
      ],
    );
  }
  largeHover(BuildContext context,HomeController homeController,double fontSize){
    return
      shopController.petHover.value||
          shopController.petHoverContainer.value
          ? MouseRegion(
        onHover: (point){
          shopController.petHoverContainer.value=true;
        },
        onExit: (point){
          shopController.petHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.5,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.width * 0.26,
                          color: App.grey,
                          child: shopByPetList(context,13,20,15,8,8),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      shopController.brandHover.value||
          shopController.brandHoverContainer.value
          ?MouseRegion(
        onHover: (point){
          shopController.brandHoverContainer.value=true;
        },
        onExit:  (point){
          shopController.brandHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.4,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fakeTitleShopHeader(context,0,"home",fontSize),
                        Container(
                          width: MediaQuery.of(context).size.width*0.35,
                          height: MediaQuery.of(context).size.width * 0.2,
                          color: App.grey,
                          child: shopByBrand(context,15,20,10),
                        ),
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
  large2Header(BuildContext context,ShopController shopController){
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width*0.13,
          color: Colors.white,
          child: Column(
            children: [
              blackShopHeader(context,30,shopController,12,16,20),
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
                            Get.back();
                          },
                          child: Container(
                            color: Colors.white,
                            child: SvgPicture.asset("assets/image/logo.svg"),
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
                                                  homeController.locationSearch.value = 1;
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
                                                    homeController.locationSearch.value = 1;
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
                            width: MediaQuery.of(context).size.width*0.39,
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.39,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      titleShopHeader(context,0,"home",shopController,12),
                                      Row(
                                        children: [
                                          titleShopHeader(context,1,"shop_by_bet",shopController,12),
                                          Icon(Icons.arrow_drop_down_outlined,size: 15,
                                            color: shopController.hoverIndex.value == 1 ||
                                                shopController.btmNavBarIndex.value == 1 ? App.primery : Colors.black,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          titleShopHeader(context,2,"shop_by_brands",shopController,12),
                                          Icon(Icons.arrow_drop_down_outlined,size: 15,
                                            color: shopController.hoverIndex.value == 2 ||
                                                shopController.btmNavBarIndex.value == 2 ? App.primery : Colors.black,
                                          )
                                        ],
                                      ),
                                      titleShopHeader(context,3,"offers",shopController,12),
                                      titleShopHeader(context,4,"new_arrivals",shopController,12),
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
                              //todo login
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
                                        child: Text(App_Localization.of(context).translate("login").toUpperCase(),
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
                              shopController.btmNavBarIndex.value = 6;
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
                                            child: Text(App_Localization.of(context).translate("cart").toUpperCase(),
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
        large2Hover(context,homeController,12),
        Positioned(
            right: 0,
            child: App.shopLanguageBar(
                context, shopController,shopController.openCountry.value,30, 5, 10, 10, 12, 10))
      ],
    );
  }
  large2Hover(BuildContext context,HomeController homeController,double fontSize){
    return
      shopController.petHover.value||
          shopController.petHoverContainer.value
          ? MouseRegion(
        onHover: (point){
          shopController.petHoverContainer.value=true;
        },
        onExit: (point){
          shopController.petHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.5,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.width * 0.26,
                          color: App.grey,
                          child: shopByPetList(context,10,15,12,5,5),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      shopController.brandHover.value||
          shopController.brandHoverContainer.value
          ?MouseRegion(
        onHover: (point){
          shopController.brandHoverContainer.value=true;
        },
        onExit:  (point){
          shopController.brandHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.4,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fakeTitleShopHeader(context,0,"home",fontSize),
                        Container(
                          width: MediaQuery.of(context).size.width*0.35,
                          height: MediaQuery.of(context).size.width * 0.2,
                          color: App.grey,
                          child: shopByBrand(context,12,12,10),
                        ),
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
  bigHeader(BuildContext context,ShopController shopController){
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width*0.15,
          color: Colors.white,
          child: Column(
            children: [
              blackShopHeader(context,25,shopController,10,13,15),
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
                            Get.back();
                          },
                          child: Container(
                            color: Colors.white,
                            child: SvgPicture.asset("assets/image/logo.svg"),
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
                                                  homeController.locationSearch.value = 1;
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
                                                    homeController.locationSearch.value = 1;
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
                            width: MediaQuery.of(context).size.width*0.45,
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.45,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      titleShopHeader(context,0,"home",shopController,10),
                                      Row(
                                        children: [
                                          titleShopHeader(context,1,"shop_by_bet",shopController,10),
                                          Icon(Icons.arrow_drop_down_outlined,size: 12,
                                            color: shopController.hoverIndex.value == 1 ||
                                                shopController.btmNavBarIndex.value == 1 ? App.primery : Colors.black,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          titleShopHeader(context,2,"shop_by_brands",shopController,10),
                                          Icon(Icons.arrow_drop_down_outlined,size: 12,
                                            color: shopController.hoverIndex.value == 2 ||
                                                shopController.btmNavBarIndex.value == 2 ? App.primery : Colors.black,
                                          )
                                        ],
                                      ),
                                      titleShopHeader(context,3,"offers",shopController,10),
                                      titleShopHeader(context,4,"new_arrivals",shopController,10),
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
                              //todo login
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
                                        child: Text(App_Localization.of(context).translate("login").toUpperCase(),
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
                              shopController.btmNavBarIndex.value = 6;
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
                                            child: Text(App_Localization.of(context).translate("cart").toUpperCase(),
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
        bigHover(context,homeController,10),
        Positioned(
            right: 0,
            child: App.shopLanguageBar(
                context, shopController,shopController.openCountry.value,25, 3, 10, 10, 10, 8))
      ],
    );
  }
  bigHover(BuildContext context,HomeController homeController,double fontSize){
    return
      shopController.petHover.value||
          shopController.petHoverContainer.value
          ? MouseRegion(
        onHover: (point){
          shopController.petHoverContainer.value=true;
        },
        onExit: (point){
          shopController.petHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.65,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.65,
                          height: MediaQuery.of(context).size.width * 0.28,
                          color: App.grey,
                          child: bigShopByPetList(context),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ):
      shopController.brandHover.value||
          shopController.brandHoverContainer.value
          ?MouseRegion(
        onHover: (point){
          shopController.brandHoverContainer.value=true;
        },
        onExit:  (point){
          shopController.brandHoverContainer.value=false;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.45,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fakeTitleShopHeader(context,0,"home",fontSize),
                        Container(
                          width: MediaQuery.of(context).size.width*0.4,
                          height: MediaQuery.of(context).size.width * 0.25,
                          color: App.grey,
                          child: shopByBrand(context,10,10,10),
                        ),
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
