import 'package:animals/app_localization.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:animals/model/post.dart';
import 'package:animals/view/homeHeader.dart';
import 'package:animals/view/on_hover.dart';
import 'package:animals/view/shopHeader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_widget/zoom_widget.dart';

class Search extends StatelessWidget {
  final HomeController homeController = Get.find();
  final GlobalKey<ScaffoldState> myKey = GlobalKey();

  List<String> postTypes = <String>[];
  List<Post> products = <Post>[];
  List<Post> service = <Post>[];

  Search(this.products, this.service);

  @override
  Widget build(BuildContext context) {
    postTypes = [
      App_Localization.of(context).translate("products"),
      App_Localization.of(context).translate("services")
    ];
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
                Obx(() {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/image/Background.png")
                          )
                      ),
                      child: MediaQuery.of(context).size.width>App.extra ? extraWidget(context) :
                      MediaQuery.of(context).size.width>App.extra2 ? extra2Widget(context) :
                      MediaQuery.of(context).size.width>App.xLarge ? xLargeWidget(context) :
                      MediaQuery.of(context).size.width>App.xLarge2 ? xLarge2Widget(context) :
                      MediaQuery.of(context).size.width>App.larg ? largeWidget(context) :
                      MediaQuery.of(context).size.width>App.larg2 ? large2Widget(context) :
                      bigWidget(context)
                    );
                  }
                ),
                Positioned(
                    child: homeController.locationSearch.value == 0 ?
                    HomeHeader() : ShopHeader()
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  extraWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.13),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child:Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Center(
                              child: Text(App_Localization.of(context).translate("search_results").toUpperCase(),
                                  style: TextStyle(
                                      color: App.primery.withOpacity(0.5),
                                      fontSize: 70,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "FOUNDRYGRIDNIK"
                                  ))),
                        ),
                      ),
                    ),
                  ),
                  _posts(context,width: 170,height: 70,font: 23),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                  homeController.selectedPostFilter.value==0 ?
                  Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2),
                  child: _product(count:4,ratio:4/6,posts:products,padding: 0,radius:40,circle:false ,
                      shadow: false,img_radius: 40,op: 1,fontSize: 23,saleWidth: 100,saleHeight: 45))
                      :
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: _services(context,h1: 50,h2: 23,maxLine: 6)
                  ),
                ],
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 50, 23),
        ],
      ),
    );
  }
  extra2Widget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.13),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child:Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Center(
                              child: Text(App_Localization.of(context).translate("search_results").toUpperCase(),
                                  style: TextStyle(
                                      color: App.primery.withOpacity(0.5),
                                      fontSize: 65,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "FOUNDRYGRIDNIK"
                                  ))),
                        ),
                      ),
                    ),
                  ),
                  _posts(context,width: 160,height: 70,font: 21),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                  homeController.selectedPostFilter.value==0 ?
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2),
                      child: _product(count:4,ratio:4/6,posts:products,padding: 0,radius:40,circle:false ,
                          shadow: false,img_radius: 40,op: 1,fontSize: 21,saleWidth: 100,saleHeight: 40))
                      :
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: _services(context,h1: 45,h2: 21,maxLine: 6)
                  ),
                ],
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 45, 21),
        ],
      ),
    );
  }
  xLargeWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.12),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child:Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Center(
                              child: Text(App_Localization.of(context).translate("search_results").toUpperCase(),
                                  style: TextStyle(
                                      color: App.primery.withOpacity(0.5),
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "FOUNDRYGRIDNIK"
                                  ))),
                        ),
                      ),
                    ),
                  ),
                  _posts(context,width: 140,height: 60,font: 19),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                  homeController.selectedPostFilter.value==0 ?
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2),
                      child: _product(count:4,ratio:4/6,posts:products,padding: 0,radius:40,circle:false ,
                          shadow: false,img_radius: 40,op: 1,fontSize: 19,saleWidth: 90,saleHeight: 35))
                      :
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: _services(context,h1: 40,h2: 19,maxLine: 5)
                  ),
                ],
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 40, 19),
        ],
      ),
    );
  }
  xLarge2Widget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.12),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child:Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Center(
                              child: Text(App_Localization.of(context).translate("search_results").toUpperCase(),
                                  style: TextStyle(
                                      color: App.primery.withOpacity(0.5),
                                      fontSize: 55,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "FOUNDRYGRIDNIK"
                                  ))),
                        ),
                      ),
                    ),
                  ),
                  _posts(context,width: 130,height: 60,font: 17),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                  homeController.selectedPostFilter.value==0 ?
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.15),
                      child: _product(count:4,ratio:4/6,posts:products,padding: 0,radius:40,circle:false ,
                          shadow: false,img_radius: 40,op: 1,fontSize: 17,saleWidth: 80,saleHeight: 30))
                      :
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: _services(context,h1: 35,h2: 17,maxLine: 4)
                  ),
                ],
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 35, 17),
        ],
      ),
    );
  }
  largeWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.12),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child:Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Center(
                              child: Text(App_Localization.of(context).translate("search_results").toUpperCase(),
                                  style: TextStyle(
                                      color: App.primery.withOpacity(0.5),
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "FOUNDRYGRIDNIK"
                                  ))),
                        ),
                      ),
                    ),
                  ),
                  _posts(context,width: 110,height: 50,font: 15),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                  homeController.selectedPostFilter.value==0 ?
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.15),
                      child: _product(count:4,ratio:4/6,posts:products,padding: 0,radius:40,circle:false ,
                          shadow: false,img_radius: 40,op: 1,fontSize: 15,saleWidth: 70,saleHeight: 30))
                      :
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: _services(context,h1: 30,h2: 15,maxLine: 4)
                  ),
                ],
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 30, 15),
        ],
      ),
    );
  }
  large2Widget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.13),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child:Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Center(
                              child: Text(App_Localization.of(context).translate("search_results").toUpperCase(),
                                  style: TextStyle(
                                      color: App.primery.withOpacity(0.5),
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "FOUNDRYGRIDNIK"
                                  ))),
                        ),
                      ),
                    ),
                  ),
                  _posts(context,width: 100,height: 50,font: 12),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                  homeController.selectedPostFilter.value==0 ?
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: _product(count:4,ratio:4/6,posts:products,padding: 0,radius:40,circle:false ,
                          shadow: false,img_radius: 40,op: 1,fontSize: 12,saleWidth: 60,saleHeight: 25))
                      :
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: _services(context,h1: 25,h2: 12,maxLine: 3)
                  ),
                ],
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 25, 12),
        ],
      ),
    );
  }
  bigWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.15),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child:Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Center(
                              child: Text(App_Localization.of(context).translate("search_results").toUpperCase(),
                                  style: TextStyle(
                                      color: App.primery.withOpacity(0.5),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "FOUNDRYGRIDNIK"
                                  ))),
                        ),
                      ),
                    ),
                  ),
                  _posts(context,width: 85,height: 40,font: 12),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                  homeController.selectedPostFilter.value==0 ?
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.12),
                      child: _product(count:3,ratio:4/6,posts:products,padding: 0,radius:40,circle:false ,
                          shadow: false,img_radius: 40,op: 1,fontSize: 10,saleWidth: 50,saleHeight: 20))
                      :
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: bigServices(context,h1: 20,h2: 10,maxLine: 3)
                  ),
                ],
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          App.copyrights(context, 20, 10),
        ],
      ),
    );
  }
  bigServices(BuildContext context, {required double h1,required double h2,required int maxLine}){
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ListView.builder(
          itemCount: service.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: h2),
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.8/6,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                            homeController.btmNavBarIndex.value = 2;
                            homeController.selectedServices.value = index;
                            Future.delayed(Duration(milliseconds: 500)).then((value) {
                              homeController.scrollDown();
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(service[index].image!),
                                )
                            ),
                          ),
                        )
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(service[index].title!,
                              style: TextStyle(
                                  fontSize: h1,
                                  fontWeight: FontWeight.bold,
                                  color: service[index].color,
                                  fontFamily: "FOUNDRYGRIDNIK"
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(service[index].stringDescription! + "Vista Square Tank For Betta OrangeVista Square Tank For Betta OrangeVista Square Tank For Betta OrangeVista Square Tank For Betta OrangeVista Square Tank For Betta OrangeVista Square Tank For Betta OrangeVista Square Tank For Betta Orange",
                              style: TextStyle(fontSize: h2,color: Colors.black,fontFamily: "POPPINS",),
                              overflow: TextOverflow.ellipsis,
                              maxLines: maxLine,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  _services(BuildContext context, {required double h1,required double h2,required int maxLine}){
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ListView.builder(
          itemCount: service.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: h2),
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.8/6,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                            homeController.btmNavBarIndex.value = 2;
                            homeController.selectedServices.value = index;
                            Future.delayed(Duration(milliseconds: 500)).then((value) {
                              homeController.scrollDown();
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(service[index].image!),
                                )
                            ),
                          ),
                        )
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text(service[index].title!,
                              style: TextStyle(
                                fontSize: h1,
                                fontWeight: FontWeight.bold,
                                color: service[index].color,
                                fontFamily: "FOUNDRYGRIDNIK"
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text(service[index].stringDescription! + "Vista Square Tank For Betta OrangeVista Square Tank For Betta OrangeVista Square Tank For Betta OrangeVista Square Tank For Betta OrangeVista Square Tank For Betta OrangeVista Square Tank For Betta OrangeVista Square Tank For Betta Orange",
                              style: TextStyle(fontSize: h2,color: Colors.black,fontFamily: "POPPINS",),
                              overflow: TextOverflow.ellipsis,
                              maxLines: maxLine,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
  _product({required int count, required double ratio, required List<Post> posts,required double padding, required double? img_radius, required double? radius, required bool circle, required bool shadow, required int op, required double fontSize,required double saleWidth,required double saleHeight}){
    return  Container(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: ratio),
          itemCount: posts.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  //todo
                },
                child: Stack(
                  children: [
                    OnHover(builder: (hover) {
                      return Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 5,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: img_radius == null ? null :
                                      BorderRadius.only(
                                        topLeft: Radius.circular(img_radius),
                                        topRight: Radius.circular(img_radius),
                                      ),
                                      image: DecorationImage(
                                          image: NetworkImage(posts[index]
                                              .image!
                                              .replaceAll(
                                              "localhost", "10.0.2.2")
                                          ),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                            ),
                            Flexible(
                                flex: 2,
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                    child: Text(posts[index].title!,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: fontSize,
                                            fontFamily: "POPPINS",
                                            fontWeight: FontWeight.w500,
                                            color: hover ? App.primery : Colors.black),
                                        maxLines: 2)
                                )
                            ),
                            Flexible(
                              flex: 2,
                              child: posts[index].regularPrice == null ?
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].price!.toStringAsFixed(2),
                                  style: TextStyle( fontFamily: "POPPINS",fontSize: fontSize,color: Colors.black,fontWeight: FontWeight.bold),maxLines: 1,),
                              ) :
                              Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].price!.toStringAsFixed(2),
                                              style: TextStyle( fontFamily: "POPPINS",fontSize: fontSize,color: Colors.black,fontWeight: FontWeight.bold),maxLines: 1)),
                                      SizedBox(
                                          child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].regularPrice!.toStringAsFixed(2),
                                            style: TextStyle( fontFamily: "POPPINS",fontSize: fontSize - 2,color: Colors.black.withOpacity(0.5),
                                                decoration: TextDecoration.lineThrough),maxLines: 1,)),
                                    ],
                                  )
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: GestureDetector(
                                onTap: (){
                                  homeController.fake.value = !homeController.fake.value;
                                  homeController.cartController.addToCart(posts[index],1, context);
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: App.purple,
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(padding),
                                      child: Text(
                                        App_Localization.of(context).translate("add_to_cart"),
                                        style: TextStyle(fontFamily: "POPPINS",color: Colors.white,fontWeight: FontWeight.w500,fontSize: fontSize),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: posts[index].regularPrice!=null?
                      Container(
                        width: saleWidth,
                        height: saleHeight,
                        color: Colors.red,
                        child: Center(child: Padding(
                          padding: const EdgeInsets.all(0.5),
                          child: Text(App_Localization.of(context).translate("sale").toUpperCase(),
                              style: TextStyle(fontFamily: "POPPINS",color: Colors.white,fontSize: fontSize),maxLines: 1),
                        ),),
                      ) : Center(),
                    )
                  ],
                )
            );
          }),
    );
  }
  _posts(BuildContext context,{required double width,required double height,required double font}){
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: postTypes.length,
              itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                homeController.selectedPostFilter.value = index;
              },
              child: Container(
                width: width,
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      postTypes[index] + " ("+ (index==0 ?products.length.toString():service.length.toString())+")",
                      style: TextStyle(color: Colors.black,fontSize: font,fontFamily: "POPPINS"),),
                    Container(
                      color: index == homeController.selectedPostFilter.value ?App.primery:Colors.black,
                      width: width - 10,
                      height: 3,
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

}
