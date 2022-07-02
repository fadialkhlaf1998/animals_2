import 'package:animals/app_localization.dart';
import 'package:animals/controller/shop_controller.dart';
import 'package:animals/view/cart.dart';
import 'package:animals/view/shopHeader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:zoom_widget/zoom_widget.dart';

class Shop extends StatelessWidget {

  final HomeController homeController = Get.find();
  final ShopController shopController =Get.find();
  final GlobalKey<ScaffoldState> myKey = GlobalKey();
  Shop() {
    shopController.btmNavBarIndex.value = 0;
    homeController.selectedCategory.value = 0;
    shopController.lengthBestSellers.value = 3;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return shopController.btmNavBarIndex.value == 0 ? _shop(context) :
      shopController.btmNavBarIndex.value == 1 ? _shop(context) :
      shopController.btmNavBarIndex.value == 2 ? _shop(context) :
      shopController.btmNavBarIndex.value == 3 ?  _shop(context)  :
      shopController.btmNavBarIndex.value == 4 ?  _shop(context)  :
      shopController.btmNavBarIndex.value == 5 ?  _shop(context)  : Cart();
    });
  }

  _shop(BuildContext context) {
    return Scaffold(
      key: myKey,
      body: RefreshIndicator(
        onRefresh: ()async{
          Get.offAllNamed("/");
        },
        child: Stack(
          children: [
            Zoom(
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
                        child: MediaQuery.of(context).size.width>App.extra ? extraShop(context) :
                        MediaQuery.of(context).size.width>App.extra2 ? extra2Shop(context) :
                        MediaQuery.of(context).size.width>App.xLarge ? xLargeShop(context) :
                        MediaQuery.of(context).size.width>App.xLarge2 ? xLarge2Shop(context) :
                        MediaQuery.of(context).size.width>App.larg ? largeShop(context) :
                        MediaQuery.of(context).size.width>App.larg2 ? large2Shop(context) :
                        bigShop(context)
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

  body(BuildContext context,double width, double height,double hPadding,double imgHeight,double text1Height,double text2Height,double h1, double h2){
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: hPadding),
        width: width,
        height: height,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width/4,
                  height: imgHeight,
                  child: Image.asset("assets/image/Icon_FreeDelivery.png"),
                ),
                Container(
                  width: width/4,
                  height: imgHeight,
                  child: Image.asset("assets/image/Icon_24Hours.png"),
                ),
                Container(
                  width: width/4,
                  height: imgHeight,
                  child: Image.asset("assets/image/Icon_Shop.png"),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width/4,
                  height: text1Height,
                  child: Center(child: Text(App_Localization.of(context).translate("shop_title_1"),
                    style: TextStyle(fontSize: h1, fontFamily: "POPPINS",
                        color: App.primery,fontWeight: FontWeight.bold),maxLines: 1,)),
                ),
                Container(
                  width: width/4,
                  height: text1Height,
                  child: Center(
                      child: Text(
                        App_Localization.of(context).translate("shop_title_2"),
                        style: TextStyle(fontSize: h1,color: App.primery, fontFamily: "POPPINS",
                            fontWeight: FontWeight.bold),maxLines: 1,)),
                ),
                Container(
                  width: width/4,
                  height: text1Height,
                  child: Center(child: Text(App_Localization.of(context).translate("shop_title_3"),
                    style: TextStyle(fontSize: h1,color: App.primery, fontFamily: "POPPINS",
                        fontWeight: FontWeight.bold),maxLines: 1,)),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width/4,
                  height: text2Height,
                  child: Text(App_Localization.of(context).translate("shop_content_1"),
                      style: TextStyle(fontSize: h2,color:
                      Colors.black.withOpacity(0.8),fontFamily: "POPPINS",
                      ),textAlign: TextAlign.center),
                ),
                SizedBox(
                  width: width/4,
                  height: text2Height,
                  child: Text(App_Localization.of(context).translate("shop_content_2"),style:
                  TextStyle(fontSize: h2,color: Colors.black.withOpacity(0.8),fontFamily: "POPPINS",
                  ),textAlign: TextAlign.center),
                ),
                SizedBox(
                  width: width/4,
                  height: text2Height,
                  child: Text(App_Localization.of(context).translate("shop_content_3"),style:
                  TextStyle(fontSize: h2,color:  Colors.black.withOpacity(0.8),fontFamily: "POPPINS",
                  ),textAlign: TextAlign.center),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  bestSellers({required int count, required double ratio,required double textPadding,required double pricePadding, required double hImg,required double? radius, required double fontSize,required double cartPadding}){
    return Container(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 40,
              crossAxisSpacing: 40,
              childAspectRatio: ratio),
          itemCount: shopController.lengthBestSellers.value ,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  //todo
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: cartPadding),
                        child: Container(
                          height: hImg,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.dubaipetfood.com/ccstore/v1/images/?source=/file/v6535707215804975448/products/100223.Acana%20Small%20Breed%20Adult%20Dry%20Dog%206.jpg&quality=0.8"
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: textPadding),
                          child: Center(
                            child: Text("Lily's Kitchen Adult Shepherd's Pie With Lamb Potatoes & Parsley Adult Dry Dog Food",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: fontSize,
                                  fontFamily: "POPPINS",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                maxLines: 3),
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.all(pricePadding),
                        child: Center(
                          child: Text(App_Localization.of(context).translate("aed")+" "+ "6.00",
                            style: TextStyle( fontFamily: "POPPINS",fontSize: fontSize,color: Colors.black.withOpacity(0.8)),maxLines: 1,),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black,width: 1.2)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    //decrease orders
                                  },
                                  icon: Icon(Icons.remove,color: Colors.black,size: fontSize,)
                              ),
                              Text("1",
                                style: TextStyle(fontFamily: "POPPINS",color: Colors.black,fontWeight: FontWeight.w500,fontSize: fontSize),
                              ),
                              IconButton(
                                  onPressed: () {
                                    //increase orders
                                  },
                                  icon: Icon(Icons.add,color: Colors.black,size: fontSize,)
                              ),
                            ],
                          )
                      ),
                      SizedBox(height: 5,),
                      GestureDetector(
                        onTap: (){
                          // homeController.fake.value = !homeController.fake.value;
                          // homeController.cartController.addToCart(posts[index],1, context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius!),
                            color: App.primery,
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(cartPadding),
                              child: Text(
                                App_Localization.of(context).translate("add_to_cart").toUpperCase(),
                                style: TextStyle(fontFamily: "POPPINS",color: Colors.white,fontWeight: FontWeight.w500,fontSize: fontSize),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
            );
          }),
    );
  }
  largeBestSellers({required int count, required double ratio,required double textPadding,required double pricePadding, required double hImg,required double? radius, required double fontSize,required double cartPadding}){
    return Container(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 40,
              crossAxisSpacing: 40,
              childAspectRatio: ratio),
          itemCount: shopController.lengthBestSellers.value ,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  //todo
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: cartPadding),
                        child: Container(
                          height: hImg,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.dubaipetfood.com/ccstore/v1/images/?source=/file/v6535707215804975448/products/100223.Acana%20Small%20Breed%20Adult%20Dry%20Dog%206.jpg&quality=0.8"
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: textPadding),
                          child: Center(
                            child: Text("Lily's Kitchen Adult Shepherd's Pie With Lamb Potatoes & Parsley Adult Dry Dog Food",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: fontSize,
                                  fontFamily: "POPPINS",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                maxLines: 3),
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.all(pricePadding),
                        child: Center(
                          child: Text(App_Localization.of(context).translate("aed")+" "+ "6.00",
                            style: TextStyle( fontFamily: "POPPINS",fontSize: fontSize,color: Colors.black.withOpacity(0.8)),maxLines: 1,),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width * 0.025,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black,width: 1.2)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    //decrease orders
                                  },
                                  icon: Icon(Icons.remove,color: Colors.black,size: fontSize,)
                              ),
                              Text("1",
                                style: TextStyle(fontFamily: "POPPINS",color: Colors.black,fontWeight: FontWeight.w500,fontSize: fontSize),
                              ),
                              IconButton(
                                  onPressed: () {
                                    //increase orders
                                  },
                                  icon: Icon(Icons.add,color: Colors.black,size: fontSize,)
                              ),
                            ],
                          )
                      ),
                      SizedBox(height: 5,),
                      GestureDetector(
                        onTap: (){
                          // homeController.fake.value = !homeController.fake.value;
                          // homeController.cartController.addToCart(posts[index],1, context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius!),
                            color: App.primery,
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(cartPadding),
                              child: Text(
                                App_Localization.of(context).translate("add_to_cart").toUpperCase(),
                                style: TextStyle(fontFamily: "POPPINS",color: Colors.white,fontWeight: FontWeight.w500,fontSize: fontSize),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
            );
          }),
    );
  }
  large2BestSellers({required int count, required double ratio,required double textPadding,required double pricePadding, required double hImg,required double? radius, required double fontSize,required double cartPadding}){
    return Container(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 40,
              crossAxisSpacing: 40,
              childAspectRatio: ratio),
          itemCount: shopController.lengthBestSellers.value ,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  //todo
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: cartPadding),
                        child: Container(
                          height: hImg,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.dubaipetfood.com/ccstore/v1/images/?source=/file/v6535707215804975448/products/100223.Acana%20Small%20Breed%20Adult%20Dry%20Dog%206.jpg&quality=0.8"
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: textPadding),
                          child: Center(
                            child: Text("Lily's Kitchen Adult Shepherd's Pie With Lamb Potatoes & Parsley Adult Dry Dog Food",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: fontSize,
                                  fontFamily: "POPPINS",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                maxLines: 3),
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.all(pricePadding),
                        child: Center(
                          child: Text(App_Localization.of(context).translate("aed")+" "+ "6.00",
                            style: TextStyle( fontFamily: "POPPINS",fontSize: fontSize,color: Colors.black.withOpacity(0.8)),maxLines: 1,),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width > 1200 ? MediaQuery.of(context).size.width * 0.025 :
                          MediaQuery.of(context).size.width * 0.028,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black,width: 1.2)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    //decrease orders
                                  },
                                  icon: Icon(Icons.remove,color: Colors.black,size: fontSize,)
                              ),
                              Text("1",
                                style: TextStyle(fontFamily: "POPPINS",color: Colors.black,fontWeight: FontWeight.w500,fontSize: fontSize),
                              ),
                              IconButton(
                                  onPressed: () {
                                    //increase orders
                                  },
                                  icon: Icon(Icons.add,color: Colors.black,size: fontSize,)
                              ),
                            ],
                          )
                      ),
                      SizedBox(height: 5,),
                      GestureDetector(
                        onTap: (){
                          // homeController.fake.value = !homeController.fake.value;
                          // homeController.cartController.addToCart(posts[index],1, context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius!),
                            color: App.primery,
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(cartPadding),
                              child: Text(
                                App_Localization.of(context).translate("add_to_cart").toUpperCase(),
                                style: TextStyle(fontFamily: "POPPINS",color: Colors.white,fontWeight: FontWeight.w500,fontSize: fontSize),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
            );
          }),
    );
  }
  bigBestSellers({required int count, required double ratio,required double textPadding,required double pricePadding, required double hImg,required double? radius, required double fontSize,required double cartPadding}){
    return Container(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: ratio),
          itemCount: shopController.lengthBestSellers.value ,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  //todo
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: cartPadding),
                        child: Container(
                          height: hImg,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.dubaipetfood.com/ccstore/v1/images/?source=/file/v6535707215804975448/products/100223.Acana%20Small%20Breed%20Adult%20Dry%20Dog%206.jpg&quality=0.8"
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: textPadding),
                          child: Center(
                            child: Text("Lily's Kitchen Adult Shepherd's Pie With Lamb Potatoes & Parsley Adult Dry Dog Food",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: fontSize,
                                  fontFamily: "POPPINS",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                maxLines: 3),
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.all(pricePadding),
                        child: Center(
                          child: Text(App_Localization.of(context).translate("aed")+" "+ "6.00",
                            style: TextStyle( fontFamily: "POPPINS",fontSize: fontSize,color: Colors.black.withOpacity(0.8)),maxLines: 1,),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height:MediaQuery.of(context).size.width * 0.03,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black,width: 1.2)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                                child: GestureDetector(
                                  onTap: () {
                                    //decrease order
                                  },
                                  child: Icon(Icons.remove,color: Colors.black,size: fontSize,),
                                )
                              ),
                              Text("1",
                                style: TextStyle(fontFamily: "POPPINS",color: Colors.black,fontWeight: FontWeight.w500,fontSize: fontSize),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                                  child: GestureDetector(
                                    onTap: () {
                                      //increase orders
                                    },
                                    child: Icon(Icons.add,color: Colors.black,size: fontSize,)
                                  )
                              ),
                            ],
                          )
                      ),
                      SizedBox(height: 5,),
                      GestureDetector(
                        onTap: (){
                          // homeController.fake.value = !homeController.fake.value;
                          // homeController.cartController.addToCart(posts[index],1, context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius!),
                            color: App.primery,
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(cartPadding),
                              child: Text(
                                App_Localization.of(context).translate("add_to_cart").toUpperCase(),
                                style: TextStyle(fontFamily: "POPPINS",color: Colors.white,fontWeight: FontWeight.w500,fontSize: fontSize),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
            );
          }),
    );
  }


  //************************ Extra ************************
  extraShop(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width*0.13),
              SizedBox(height: MediaQuery.of(context).size.width * 0.03),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.27,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/image/Shop_Slider.jpg")
                    )
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 100,vertical: 70),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.1,
                        width: MediaQuery.of(context).size.width * 0.33,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                //todo download from apple
                              },
                              child: Container(
                                  width: 300,
                                  height: 85,
                                  decoration: BoxDecoration(
                                    color: App.darkGrey,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/image/apple-logo.png",
                                        width: 60,height: 60,color: Colors.white,),
                                      SizedBox(width: 5,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Download on the",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: "POPPINS"
                                            ),
                                          ),
                                          Text("App Store",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "POPPINS"
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //todo download from google
                              },
                              child:  Container(
                                  width: 300,
                                  height: 85,
                                  decoration: BoxDecoration(
                                    color: App.darkGrey,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/image/google-play.png",width: 60,height: 60),
                                      SizedBox(width: 5,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("ANDROID APP ON",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: "POPPINS"
                                            ),
                                          ),
                                          Text("Google Play",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "POPPINS"
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              body(context,MediaQuery.of(context).size.width * 0.7,MediaQuery.of(context).size.width * 0.2,
                  MediaQuery.of(context).size.width*0.03,MediaQuery.of(context).size.width*0.07,
                  MediaQuery.of(context).size.width * 0.02, MediaQuery.of(context).size.width * 0.04, 23, 23),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                color: App.grey,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.5,
                            child: Center(
                                child: Text(App_Localization.of(context).translate("best_sellers").toUpperCase(),
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
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                      child: bestSellers(count:3,ratio:4/6,hImg: MediaQuery.of(context).size.width * 0.2,
                          textPadding: 25,pricePadding: 10,radius:40,fontSize: 23,cartPadding: 15),
                    ),
                    GestureDetector(
                      onTap: () {
                        shopController.viewAllProducts();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Center(
                                  child: Text(App_Localization.of(context).translate("view_all_products"),
                                      style: TextStyle(
                                        color: App.primery,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "POPPINS",
                                      )
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              App.footer(context,homeController),
              App.copyrights(context, 50, 23),
            ],
          ),
        ),
        Positioned(child: ShopHeader()),
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
  extra2Shop(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width*0.13),
              SizedBox(height: MediaQuery.of(context).size.width * 0.03),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/image/Shop_Slider.jpg")
                    )
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 100,vertical: 70),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.08,
                        width: MediaQuery.of(context).size.width * 0.33,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                //todo download from apple
                              },
                              child: Container(
                                  width: 270,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    color: App.darkGrey,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/image/apple-logo.png",
                                        width: 50,height: 50,color: Colors.white,),
                                      SizedBox(width: 5,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Download on the",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontFamily: "POPPINS"
                                            ),
                                          ),
                                          Text("App Store",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "POPPINS"
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //todo download from google
                              },
                              child:  Container(
                                  width: 270,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    color: App.darkGrey,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/image/google-play.png",width: 50,height: 50),
                                      SizedBox(width: 5,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("ANDROID APP ON",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontFamily: "POPPINS"
                                            ),
                                          ),
                                          Text("Google Play",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "POPPINS"
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              body(context,MediaQuery.of(context).size.width * 0.7,MediaQuery.of(context).size.width * 0.2,
                  MediaQuery.of(context).size.width*0.03,MediaQuery.of(context).size.width*0.06,
                  MediaQuery.of(context).size.width * 0.02, MediaQuery.of(context).size.width * 0.04, 21, 21),
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  color: App.grey,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Center(
                                  child: Text(App_Localization.of(context).translate("best_sellers").toUpperCase(),
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
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                        child: bestSellers(count:3,ratio:4/6,hImg: MediaQuery.of(context).size.width * 0.18,
                            textPadding: 25,pricePadding: 10,radius:40,fontSize: 21,cartPadding: 15),
                      ),
                      GestureDetector(
                        onTap: () {
                          shopController.viewAllProducts();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.5,
                                child: Center(
                                    child: Text(App_Localization.of(context).translate("view_all_products"),
                                        style: TextStyle(
                                          color: App.primery,
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "POPPINS",
                                        )
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              App.footer(context,homeController),
              App.copyrights(context, 45, 21),
            ],
          ),
        ),
        Positioned(child: ShopHeader()),
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

  //************************ Xlarge ************************
  xLargeShop(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width*0.12),
              SizedBox(height: MediaQuery.of(context).size.width * 0.03),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/image/Shop_Slider.jpg")
                    )
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80,vertical: 70),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.06,
                        width: MediaQuery.of(context).size.width * 0.33,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                //todo download from apple
                              },
                              child: Container(
                                  width: 240,
                                  height: 65,
                                  decoration: BoxDecoration(
                                    color: App.darkGrey,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/image/apple-logo.png",
                                        width: 40,height: 40,color: Colors.white,),
                                      SizedBox(width: 5,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Download on the",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: "POPPINS"
                                            ),
                                          ),
                                          Text("App Store",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "POPPINS"
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //todo download from google
                              },
                              child:  Container(
                                  width: 240,
                                  height: 65,
                                  decoration: BoxDecoration(
                                    color: App.darkGrey,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/image/google-play.png",width: 40,height: 40),
                                      SizedBox(width: 5,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("ANDROID APP ON",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: "POPPINS"
                                            ),
                                          ),
                                          Text("Google Play",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "POPPINS"
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              body(context,MediaQuery.of(context).size.width * 0.7,MediaQuery.of(context).size.width * 0.2,
                  MediaQuery.of(context).size.width*0.03,MediaQuery.of(context).size.width*0.05,
                  MediaQuery.of(context).size.width * 0.02, MediaQuery.of(context).size.width * 0.06, 19, 19),
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  color: App.grey,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Center(
                                  child: Text(App_Localization.of(context).translate("best_sellers").toUpperCase(),
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
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                        child: bestSellers(count:3,ratio:4/6,hImg: MediaQuery.of(context).size.width * 0.18,
                            textPadding: 25,pricePadding: 10,radius:40,fontSize: 19,cartPadding: 13),
                      ),
                      GestureDetector(
                        onTap: () {
                          shopController.viewAllProducts();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.5,
                                child: Center(
                                    child: Text(App_Localization.of(context).translate("view_all_products"),
                                        style: TextStyle(
                                          color: App.primery,
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "POPPINS",
                                        )
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              App.footer(context,homeController),
              App.copyrights(context, 40, 19),
            ],
          ),
        ),
        Positioned(child: ShopHeader()),
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

  //************************ Xlarge2 ************************
  xLarge2Shop(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width*0.12),
              SizedBox(height: MediaQuery.of(context).size.width * 0.03),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/image/Shop_Slider.jpg")
                    )
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 90,vertical: 70),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.05,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                //todo download from apple
                              },
                              child: Container(
                                  width: 200,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: App.darkGrey,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/image/apple-logo.png",
                                        width: 35,height: 35,color: Colors.white,),
                                      SizedBox(width: 5,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Download on the",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: "POPPINS"
                                            ),
                                          ),
                                          Text("App Store",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "POPPINS"
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //todo download from google
                              },
                              child:  Container(
                                  width: 200,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: App.darkGrey,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/image/google-play.png",width: 35,height: 35),
                                      SizedBox(width: 5,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("ANDROID APP ON",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: "POPPINS"
                                            ),
                                          ),
                                          Text("Google Play",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "POPPINS"
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              body(context,MediaQuery.of(context).size.width * 0.7,MediaQuery.of(context).size.width * 0.2,
                  MediaQuery.of(context).size.width*0.03,MediaQuery.of(context).size.width*0.05,
                  MediaQuery.of(context).size.width * 0.02, MediaQuery.of(context).size.width * 0.06, 17, 17),
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  color: App.grey,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Center(
                                  child: Text(App_Localization.of(context).translate("best_sellers").toUpperCase(),
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
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                        child: bestSellers(count:3,ratio:4/6,hImg: MediaQuery.of(context).size.width * 0.16,
                            textPadding: 25,pricePadding: 10,radius:40,fontSize: 17,cartPadding: 10),
                      ),
                      GestureDetector(
                        onTap: () {
                          shopController.viewAllProducts();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.5,
                                child: Center(
                                    child: Text(App_Localization.of(context).translate("view_all_products"),
                                        style: TextStyle(
                                          color: App.primery,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "POPPINS",
                                        )
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              App.footer(context,homeController),
              App.copyrights(context, 35, 17),
            ],
          ),
        ),
        Positioned(child: ShopHeader()),
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
  largeShop(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width*0.12),
              SizedBox(height: MediaQuery.of(context).size.width * 0.03),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/image/Shop_Slider.jpg")
                    )
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80,vertical: 70),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.035,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                //todo download from apple
                              },
                              child: Container(
                                  width: 160,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: App.darkGrey,
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/image/apple-logo.png",
                                        width: 30,height: 30,color: Colors.white,),
                                      SizedBox(width: 5,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Download on the",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9,
                                                fontFamily: "POPPINS"
                                            ),
                                          ),
                                          Text("App Store",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "POPPINS"
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //todo download from google
                              },
                              child:  Container(
                                  width: 160,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: App.darkGrey,
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/image/google-play.png",width: 30,height: 30),
                                      SizedBox(width: 5,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("ANDROID APP ON",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9,
                                                fontFamily: "POPPINS"
                                            ),
                                          ),
                                          Text("Google Play",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "POPPINS"
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              body(context,MediaQuery.of(context).size.width * 0.7,MediaQuery.of(context).size.width * 0.2,
                  MediaQuery.of(context).size.width*0.03,MediaQuery.of(context).size.width*0.05,
                  MediaQuery.of(context).size.width * 0.02, MediaQuery.of(context).size.width * 0.07, 15, 15),
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  color: App.grey,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Center(
                                  child: Text(App_Localization.of(context).translate("best_sellers").toUpperCase(),
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
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                        child: largeBestSellers(count:3,ratio:4/6,hImg: MediaQuery.of(context).size.width * 0.15,
                            textPadding: 25,pricePadding: 8,radius:40,fontSize: 15,cartPadding: 6),
                      ),
                      GestureDetector(
                        onTap: () {
                          shopController.viewAllProducts();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.5,
                                child: Center(
                                    child: Text(App_Localization.of(context).translate("view_all_products"),
                                        style: TextStyle(
                                          color: App.primery,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "POPPINS",
                                        )
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              App.footer(context,homeController),
              App.copyrights(context, 30, 15),
            ],
          ),
        ),
        Positioned(child: ShopHeader()),
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
  large2Shop(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width*0.13),
              SizedBox(height: MediaQuery.of(context).size.width * 0.03),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/image/Shop_Slider.jpg")
                    )
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 60,vertical: MediaQuery.of(context).size.width > 1200 ?
                  60 : 50),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.035,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                //todo download from apple
                              },
                              child: Container(
                                  width: 130,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: App.darkGrey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/image/apple-logo.png",
                                        width: 25,height: 25,color: Colors.white,),
                                      SizedBox(width: 5,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Download on the",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 7,
                                                fontFamily: "POPPINS"
                                            ),
                                          ),
                                          Text("App Store",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "POPPINS"
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //todo download from google
                              },
                              child:  Container(
                                  width: 130,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: App.darkGrey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/image/google-play.png",width: 30,height: 30),
                                      SizedBox(width: 5,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("ANDROID APP ON",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 7,
                                                fontFamily: "POPPINS"
                                            ),
                                          ),
                                          Text("Google Play",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "POPPINS"
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              body(context,MediaQuery.of(context).size.width * 0.75,MediaQuery.of(context).size.width * 0.2,
                  MediaQuery.of(context).size.width*0.03,MediaQuery.of(context).size.width*0.05,
                  MediaQuery.of(context).size.width * 0.02, MediaQuery.of(context).size.width * 0.07, 12, 12),
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  color: App.grey,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Center(
                                  child: Text(App_Localization.of(context).translate("best_sellers").toUpperCase(),
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
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                        child: large2BestSellers(count:3,ratio:4/6,hImg: MediaQuery.of(context).size.width * 0.15,
                            textPadding: 10,pricePadding: 8,radius:40,fontSize: 12,cartPadding: 6),
                      ),
                      GestureDetector(
                        onTap: () {
                          shopController.viewAllProducts();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.5,
                                child: Center(
                                    child: Text(App_Localization.of(context).translate("view_all_products"),
                                        style: TextStyle(
                                          color: App.primery,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "POPPINS",
                                        )
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              App.footer(context,homeController),
              App.copyrights(context, 25, 12),
            ],
          ),
        ),
        Positioned(child: ShopHeader()),
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
  bigShop(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width*0.15),
              SizedBox(height: MediaQuery.of(context).size.width * 0.03),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/image/Shop_Slider.jpg")
                    )
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40,
                      vertical: MediaQuery.of(context).size.width > 800 ? 40 : 35),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.04,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                //todo download from apple
                              },
                              child: Container(
                                  width: 100,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: App.darkGrey,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/image/apple-logo.png",
                                        width: 20,height: 20,color: Colors.white,),
                                      SizedBox(width: 5,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Download on the",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 5,
                                                fontFamily: "POPPINS"
                                            ),
                                          ),
                                          Text("App Store",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "POPPINS"
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //todo download from google
                              },
                              child:  Container(
                                  width: 100,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: App.darkGrey,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/image/google-play.png",width: 20,height: 20),
                                      SizedBox(width: 5,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("ANDROID APP ON",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 5,
                                                fontFamily: "POPPINS"
                                            ),
                                          ),
                                          Text("Google Play",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "POPPINS"
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              body(context,MediaQuery.of(context).size.width * 0.8,MediaQuery.of(context).size.width * 0.23,
                  MediaQuery.of(context).size.width*0.03,MediaQuery.of(context).size.width*0.05,
                  MediaQuery.of(context).size.width * 0.02, MediaQuery.of(context).size.width * 0.1, 10, 10),
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  color: App.grey,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Center(
                                  child: Text(App_Localization.of(context).translate("best_sellers").toUpperCase(),
                                      style: TextStyle(
                                          color: App.primery,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "FOUNDRYGRIDNIK"
                                      ))),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                        child: bigBestSellers(count:3,ratio:4/6,hImg: MediaQuery.of(context).size.width * 0.15,
                            textPadding: 8,pricePadding: 0,radius:40,fontSize: 10,cartPadding: 5),
                      ),
                      GestureDetector(
                        onTap: () {
                          shopController.viewAllProducts();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.5,
                                child: Center(
                                    child: Text(App_Localization.of(context).translate("view_all_products"),
                                        style: TextStyle(
                                          color: App.primery,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "POPPINS",
                                        )
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              App.footer(context,homeController),
              App.copyrights(context, 20, 10),
            ],
          ),
        ),
        Positioned(child: ShopHeader()),
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
