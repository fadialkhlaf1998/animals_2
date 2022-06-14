import 'package:animals/view/about.dart';
import 'package:animals/view/book_assessment.dart';
import 'package:animals/view/contact.dart';
import 'package:animals/view/events.dart';
import 'package:animals/view/gallery.dart';
import 'package:animals/view/on_hover.dart';
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
              homeController.btmNavBarIndex.value == 5 ? Events() :
              Contact() ;
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
                    child: MediaQuery.of(context).size.width>App.larg?largHome(context)
                        :MediaQuery.of(context).size.width>App.big?bgHome(context)
                        :MediaQuery.of(context).size.width>App.mid?mdHome(context)
                        :MediaQuery.of(context).size.width>App.small?smHome(context):xsmHome(context)
                ),
              ),
            ),
            Positioned(
                right: 0,
                child: App.languageBarHome(context, homeController)
            ),
          ],
        )
      ),
    );
  }

  //************************ Large ************************
  largHome(BuildContext context){
    return OnHover(builder: (hover) {
      return Stack(
        children: [
          SingleChildScrollView(
            controller: App.scrollController,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.25),
                _slider(context),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(child: Text(App_Localization.of(context).translate("services").toUpperCase(),style: const TextStyle(color: App.primery,fontSize: 40,fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.15),
                  child:largService(count:3,ratio:1,posts:homeController.service,radius:50,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 50,op: 1),
                ),
                SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                largAbout(context),
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   color: const Color(0xfff5f5f5),
                //   child: Center(
                //     child: Padding(
                //       padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                //       child: Container(
                //         width: MediaQuery.of(context).size.width*0.5,
                //         color: const Color(0xfff5f5f5),
                //         child: Center(child: Text(App_Localization.of(context).translate("our_pets_choice"),style: const TextStyle(color: App.primery,fontSize: 50,fontWeight: FontWeight.bold))),
                //       ),
                //     ),
                //   ),
                // ),
                // Column(
                //   children: [
                //     Container(
                //       width: MediaQuery.of(context).size.width,
                //       color: const Color(0xfff5f5f5),
                //       child: Center(
                //         child: Padding(
                //           padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                //           child:largProduct(count:1,ratio:6/4,posts:homeController.product,height:MediaQuery.of(context).size.width*0.25,radius:0,circle:false,background: const Color(0xfff5f5f5),shadow: false,img_radius: null,op: 1),
                //         ),
                //       ),
                //     ),
                //     Container(
                //       width: MediaQuery.of(context).size.width,
                //       color: const Color(0xfff5f5f5),
                //       child: Center(
                //         child: Padding(
                //           // padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.03,top: MediaQuery.of(context).size.width*0.03,right: MediaQuery.of(context).size.width*0.03),
                //             padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.03),
                //             child: GestureDetector(
                //               onTap: (){
                //                 homeController.goToShop(-1);
                //               },
                //               child: Container(
                //                 width: MediaQuery.of(context).size.width/8,
                //                 height: MediaQuery.of(context).size.width/8/4,
                //
                //                 decoration: BoxDecoration(
                //                     color: App.primery,
                //                     borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/8/4/2)
                //                 ),
                //                 child: Center(
                //                     child:Padding(
                //                       padding: const EdgeInsets.all(2.0),
                //                       child: FittedBox(
                //                           child: Text(App_Localization.of(context).translate("all_items"),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                //                     )
                //                 ),
                //               ),
                //             )
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // Container( color: Colors.white,height: MediaQuery.of(context).size.width*0.02,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                            width: MediaQuery.of(context).size.width*0.7,
                            child: Center(child: Text(App_Localization.of(context).translate("partner_brands"),style: const TextStyle(color: App.primery,fontSize: 40,fontWeight: FontWeight.bold),)),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // color:const  Color(0xfff5f5f5),
                        child: Center(
                          child:largBrands(count:1,ratio:4/4,posts:homeController.brand,height:MediaQuery.of(context).size.width*0.15,radius:0,circle:false,background: const Color(0xfff5f5f5),shadow: false,img_radius: null,op: 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(App_Localization.of(context).translate("love_your_pets"),
                          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Container(height: 5),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.to(() => BookAssessment());
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width / 6,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: App.primery,
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.1)
                              ),
                              child: Center(
                                child: Text(App_Localization.of(context).translate("book_an_assessment"),style: const TextStyle(color: Colors.white ,fontSize: 16,fontWeight: FontWeight.bold),),
                              )
                          ),
                        )
                      ],
                    )
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                      width: MediaQuery.of(context).size.width*0.7,
                      child: Center(child: Text(App_Localization.of(context).translate("reviews").toUpperCase(),style: const TextStyle(color: App.primery,fontSize: 40,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ),
                largReview(context),
                SizedBox(height: MediaQuery.of(context).size.width*0.03),
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
          ),
          Positioned(child: App.header(context,homeController,myKey),),
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
    });
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
                //homeController.doFunction(op, posts[index].id, context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
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
                            // shape: circle
                            //     ? BoxShape.circle
                            //     : BoxShape.rectangle,
                            image: DecorationImage(
                                image: NetworkImage(posts[index]
                                    .image!
                                    .replaceAll(
                                    "localhost", "10.0.2.2")),
                                fit: BoxFit.cover)),
                        child: Align(
                          alignment: AlignmentDirectional.bottomStart,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              posts[index].title!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,fontSize: 20),
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
                    child: Align(alignment: Alignment.centerLeft,
                        child: Text(homeController.aboutHomePage!.subTitle!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40,
                          ), textAlign: TextAlign.left,maxLines: 2,)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Text(homeController.aboutHomePage!.stringDescription!,
                      style: TextStyle(
                          fontSize: App.largeFontSize(MediaQuery.of(context).size.width),
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
              height:  MediaQuery.of(context).size.width*0.3,
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
            child: Icon(Icons.arrow_back_ios_outlined,size: 70,color: App.primery,),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 200,
          height: MediaQuery.of(context).size.width * 0.2,
          child: CarouselSlider.builder(
            carouselController: carouselController,
            options: CarouselOptions(
                height: MediaQuery.of(context).size.width * 0.15,
                autoPlay: false,
                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy:
                CenterPageEnlargeStrategy.height,
                autoPlayInterval: Duration(seconds: 2),
                onPageChanged: (index, reason) {
                  homeController.set_index(index);
                }),
            itemCount: homeController.reviews.length  ,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.15,
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.1,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/image/quote.png",
                                      width: 60,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: Align(alignment: Alignment.centerLeft,child: Text(homeController.reviews[index].title!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,color: App.primery,
                                            fontSize: App.largeFontSize(MediaQuery.of(context).size.width),
                                        ), textAlign: TextAlign.left,maxLines: 1),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 80),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: Text(homeController.reviews[index].stringDescription!,
                                    maxLines: 6,
                                    style: TextStyle(
                                        fontSize: App.largeFontSize(MediaQuery.of(context).size.width),
                                        color: Colors.black,
                                        overflow: TextOverflow.ellipsis
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            )
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
            height: 100,
            width: 100,
            child: Icon(Icons.arrow_forward_ios_outlined,size: 70,color: App.primery,),
          ),
        )
      ],
    );
  }
  largProduct({required int count, required double ratio, required List<Post> posts, required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return Container(
      height: height,
      color: background,
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

            return OnHover(builder: (isHover){
              return GestureDetector(
                onTap: () {
                  //homeController.doFunction(op, posts[index].id, context);
                },
                child: Container(

                  margin: const EdgeInsets.only(bottom: 2),
                  decoration: BoxDecoration(
                    color: background,

                  ),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Stack(
                              children: [
                                Container(
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
                                Positioned(
                                  bottom: 0,
                                  child: AnimatedContainer(
                                    width: height/ratio,
                                    height: isHover?height*3/7/4:0,
                                    // height:height*3/7/4,
                                    color: Colors.white.withOpacity(0.75),
                                    duration: const Duration(milliseconds: 300),
                                    child: Center(child: Text(App_Localization.of(context).translate("quick_view"),style: const TextStyle(color: Colors.black),),),
                                  ),
                                ),
                                posts[index].regularPrice!=null?Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                    width: height/ratio/4,
                                    height: height*3/7/5,
                                    color: Colors.red,
                                    child: Center(child: Padding(
                                      padding: const EdgeInsets.all(0.5),
                                      child: Text(App_Localization.of(context).translate("sale"),style: const TextStyle(color: Colors.white,fontSize: 20),maxLines: 1),
                                    ),),
                                  ),
                                ):const Center(),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 4,
                          child: SizedBox(
                            width:height/ratio,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // FittedBox(child: Text(posts[index].title!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),maxLines: 1,),),
                                SizedBox(
                                    width:height/ratio,
                                    child: Center(child: Text(posts[index].title!,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),maxLines: 1,overflow: TextOverflow.ellipsis,))),
                                posts[index].regularPrice == null?SizedBox(
                                  width:height/ratio,
                                  child: Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].price!.toStringAsFixed(2),style: const TextStyle(fontSize: 20,color: Colors.grey),maxLines: 1,),),
                                ):SizedBox(
                                  width:height/ratio,
                                  child: Center(child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].price!.toStringAsFixed(2),style: const TextStyle(fontSize: 16,color: Colors.grey),maxLines: 1)),
                                      // SizedBox(width: height/ratio/6,),
                                      Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].regularPrice!.toStringAsFixed(2),style: TextStyle(fontSize: 13,color: Colors.grey.withOpacity(0.5),decoration: TextDecoration.lineThrough),maxLines: 1)),
                                    ],
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    width: height/ratio,
                                    height: height/8,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.black,width: 1)
                                    ),
                                    child: Obx(
                                            () {
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            FittedBox(
                                              child: GestureDetector(onTap: (){
                                                // homeController.fake.value = !homeController.fake.value;
                                                if(posts[index].cartCount.value>1){
                                                  posts[index].cartCount.value -- ;
                                                }
                                              },child: Icon(Icons.remove,color: Colors.grey,size: height/10,)),
                                            ),
                                            Text(posts[index].cartCount.value.toString(),style: const TextStyle(fontSize: 20,color: Colors.grey),maxLines: 1,),
                                            FittedBox(
                                              child: GestureDetector(onTap: (){
                                                // homeController.fake.value = !homeController.fake.value;
                                                posts[index].cartCount.value ++ ;
                                              },child: Icon(Icons.add,color: Colors.grey,size: height/10)),
                                            ),

                                          ],
                                        );
                                      }
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    homeController.cartController.addToCart(posts[index], posts[index].cartCount.value, context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Container(
                                      width: height/ratio,
                                      height: height/8,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          border: Border.all(color: Colors.black,width: 2)
                                      ),
                                      child: Center(
                                        child: Text(
                                          App_Localization.of(context).translate("add_to_cart"),
                                          style: const TextStyle(color: App.grey,fontWeight: FontWeight.w500,fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))

                    ],
                  ),
                ),
              );
            }
            );
          }),
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
              SizedBox(height: MediaQuery.of(context).size.height*0.25,),
              _slider(context),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      child: Center(child: Text(App_Localization.of(context).translate("services").toUpperCase(),style: const TextStyle(color: App.primery,fontSize: 35,fontWeight: FontWeight.bold))),
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
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   color: const Color(0xfff5f5f5),
              //   child: Center(
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
              //       child: Container(
              //         width: MediaQuery.of(context).size.width*0.5,
              //         color: const Color(0xfff5f5f5),
              //         child: Center(child: Text(App_Localization.of(context).translate("our_pets_choice"),style: const TextStyle(color: App.primery,fontSize: 40,fontWeight: FontWeight.bold))),
              //       ),
              //     ),
              //   ),
              // ),
              // Column(
              //   children: [
              //     Container(
              //       width: MediaQuery.of(context).size.width,
              //       color: const Color(0xfff5f5f5),
              //       child: Center(
              //         child: Padding(
              //           padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
              //           child:bgProduct(count:1,ratio:6/4,posts:homeController.product,height:MediaQuery.of(context).size.width*0.25,radius:0,circle:false,background: const Color(0xfff5f5f5),shadow: false,img_radius: null,op: 1),
              //         ),
              //       ),
              //     ),
              //     Container(
              //       width: MediaQuery.of(context).size.width,
              //       color: const Color(0xfff5f5f5),
              //       child: Center(
              //         child: Padding(
              //           // padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.03,top: MediaQuery.of(context).size.width*0.03,right: MediaQuery.of(context).size.width*0.03),
              //             padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.03),
              //             child: GestureDetector(
              //               onTap: (){
              //                 homeController.goToShop(-1);
              //               },
              //               child: Container(
              //                 width: MediaQuery.of(context).size.width/8,
              //                 height: MediaQuery.of(context).size.width/8/4,
              //
              //                 decoration: BoxDecoration(
              //                     color: App.primery,
              //                     borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/8/4/2)
              //                 ),
              //                 child: Center(
              //                     child:Padding(
              //                       padding: const EdgeInsets.all(2.0),
              //                       child: FittedBox(
              //                           child: Text(App_Localization.of(context).translate("all_items"),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),)),
              //                     )
              //                 ),
              //               ),
              //             )
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Container(
                width: MediaQuery.of(context).size.width,
                // color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                          width: MediaQuery.of(context).size.width*0.7,
                          child: Center(child: Text(App_Localization.of(context).translate("partner_brands"),style: const TextStyle(color: App.primery,fontSize: 35,fontWeight: FontWeight.bold),)),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      // color: const Color(0xfff5f5f5),
                      child: Center(
                        child:bgBrands(count:1,ratio:4/4,posts:homeController.brand,height:MediaQuery.of(context).size.width*0.15,radius:0,circle:false,background: const Color(0xfff5f5f5),shadow: false,img_radius: null,op: 1),
                        // child: Padding(
                        //   padding: EdgeInsets.all( MediaQuery.of(context).size.width*0.03),
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(App_Localization.of(context).translate("love_your_pets"),
                        style: TextStyle(color: Colors.white,fontSize: 18)),
                  ],
                ),
              ),
              Container(height: 5),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(() => BookAssessment());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: 40,
                          decoration: BoxDecoration(
                              color: App.primery,
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.1)
                          ),
                          child:  Center(
                            child: Text(App_Localization.of(context).translate("book_an_assessment"),style: const TextStyle(color: Colors.white ,fontSize: 15,fontWeight: FontWeight.bold),),
                          )
                        ),
                      )
                    ],
                  )
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                    width: MediaQuery.of(context).size.width*0.7,
                    child: Center(child: Text(App_Localization.of(context).translate("reviews").toUpperCase(),style: const TextStyle(color: App.primery,fontSize: 35,fontWeight: FontWeight.bold),)),
                  ),
                ),
              ),
              BigReview(context),
              SizedBox(height: MediaQuery.of(context).size.width*0.03),
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
        ),
        Positioned(child: App.header(context,homeController,myKey),),
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
            return Stack(
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      posts[index].title!,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
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
                    child: Align(alignment: Alignment.centerLeft,child: Text(homeController.aboutHomePage!.subTitle!,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white), textAlign: TextAlign.left,maxLines: 2,)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Text(homeController.aboutHomePage!.stringDescription!,
                      style: TextStyle(fontSize: 15,color: Colors.white.withOpacity(0.8)),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height:  MediaQuery.of(context).size.width*0.3,
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
                                            fontWeight: FontWeight.bold,color: App.primery,
                                            fontSize: App.largeFontSize(MediaQuery.of(context).size.width),
                                          ), textAlign: TextAlign.left,maxLines: 1),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 80),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  child: Text(homeController.reviews[index].stringDescription!,
                                    maxLines: 7,
                                    style: TextStyle(
                                        fontSize: App.largeFontSize(MediaQuery.of(context).size.width),
                                        color: Colors.black,
                                        overflow: TextOverflow.ellipsis
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            )
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
  bgProduct({required int count, required double ratio, required List<Post> posts, required double height, required double? img_radius, required double? radius, required bool circle,required Color background, required bool shadow, required int op}) {
    return Container(
      height: height,
      color: background,
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

            return OnHover(builder: (isHover){
              return GestureDetector(
                onTap: () {
                  //homeController.doFunction(op, posts[index].id, context);
                },
                child: Container(

                  margin: const EdgeInsets.only(bottom: 2),
                  decoration: BoxDecoration(
                    color: background,

                  ),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Stack(
                              children: [
                                Container(
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
                                Positioned(
                                  bottom: 0,
                                  child: AnimatedContainer(
                                    width: height/ratio,
                                    height: isHover?height*3/7/4:0,
                                    // height:height*3/7/4,
                                    color: Colors.white.withOpacity(0.75),
                                    duration: const Duration(milliseconds: 300),
                                    child: Center(child: Text(App_Localization.of(context).translate("quick_view"),style: const TextStyle(color: Colors.black,fontSize: 13),),),
                                  ),
                                ),
                                posts[index].regularPrice!=null?Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                    width: height/ratio/4,
                                    height: height*3/7/5,
                                    color: Colors.red,
                                    child: Center(child: Padding(
                                      padding: const EdgeInsets.all(0.5),
                                      child: Text(App_Localization.of(context).translate("sale"),style: const TextStyle(color: Colors.white,fontSize: 17),maxLines: 1),
                                    ),),
                                  ),
                                ):const Center(),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 4,
                          child: SizedBox(
                            width:height/ratio,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // FittedBox(child: Text(posts[index].title!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),maxLines: 1,),),
                                SizedBox(
                                    width:height/ratio,
                                    child: Center(child: Text(posts[index].title!,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.black),maxLines: 1,overflow: TextOverflow.ellipsis,))),
                                posts[index].regularPrice == null?SizedBox(
                                  width:height/ratio,
                                  child: Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].price!.toStringAsFixed(2),style: const TextStyle(fontSize: 17,color: Colors.grey),maxLines: 1,),),
                                ):SizedBox(
                                  width:height/ratio,
                                  child: Center(child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].price!.toStringAsFixed(2),style: const TextStyle(fontSize: 14,color: Colors.grey),maxLines: 1)),
                                      // SizedBox(width: height/ratio/6,),
                                      Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].regularPrice!.toStringAsFixed(2),style: TextStyle(fontSize: 11,color: Colors.grey.withOpacity(0.5),decoration: TextDecoration.lineThrough),maxLines: 1)),
                                    ],
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    width: height/ratio,
                                    height: height/8,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.black,width: 1)
                                    ),
                                    child: Obx(() {
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            FittedBox(
                                              child: GestureDetector(onTap: (){
                                                // homeController.fake.value = !homeController.fake.value;
                                                if(posts[index].cartCount.value>1){
                                                  posts[index].cartCount.value -- ;
                                                }
                                              },child: Icon(Icons.remove,color: Colors.grey,size: height/10,)),
                                            ),
                                            Text(posts[index].cartCount.value.toString(),style: const TextStyle(fontSize: 17,color: Colors.grey),maxLines: 1,),
                                            FittedBox(
                                              child: GestureDetector(onTap: (){
                                                // homeController.fake.value = !homeController.fake.value;
                                                posts[index].cartCount.value ++ ;
                                              },child: Icon(Icons.add,color: Colors.grey,size: height/10)),
                                            ),

                                          ],
                                        );
                                      }
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    homeController.cartController.addToCart(posts[index], posts[index].cartCount.value, context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Container(
                                      width: height/ratio,
                                      height: height/8,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          border: Border.all(color: Colors.black,width: 2)
                                      ),
                                      child: Center(
                                        child: Text(
                                          App_Localization.of(context).translate("add_to_cart"),
                                          style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))

                    ],
                  ),
                ),
              );
            }
            );
          }),
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
              SizedBox(height: MediaQuery.of(context).size.height*0.2),
              _slider(context),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      child: Center(child: Text(App_Localization.of(context).translate("services").toUpperCase(),style: const TextStyle(color: App.primery,fontSize: 25,fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.13),
                child:mdService(count:3,ratio:1,posts:homeController.service,radius:50,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: 50,op: 1),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              mdAbout(context),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   color: const Color(0xfff5f5f5),
              //   child: Center(
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
              //       child: Container(
              //         width: MediaQuery.of(context).size.width*0.5,
              //         color: const Color(0xfff5f5f5),
              //         child: Center(child: Text(App_Localization.of(context).translate("our_pets_choice"),style: const TextStyle(color: App.primery,fontSize: 30,fontWeight: FontWeight.bold))),
              //       ),
              //     ),
              //   ),
              // ),
              // Column(
              //   children: [
              //     Container(
              //       width: MediaQuery.of(context).size.width,
              //       color: const Color(0xfff5f5f5),
              //       child: Center(
              //         child: Padding(
              //           padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
              //           child:mdProduct(count:1,ratio:6/4,posts:homeController.product,height:MediaQuery.of(context).size.width*0.25,radius:0,circle:false,background: const Color(0xfff5f5f5),shadow: false,img_radius: null,op: 1),
              //         ),
              //       ),
              //     ),
              //     Container(
              //       width: MediaQuery.of(context).size.width,
              //       color: const Color(0xfff5f5f5),
              //       child: Center(
              //         child: Padding(
              //           // padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.03,top: MediaQuery.of(context).size.width*0.03,right: MediaQuery.of(context).size.width*0.03),
              //             padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.03),
              //             child: GestureDetector(
              //               onTap: (){
              //                 homeController.goToShop(-1);
              //               },
              //               child: Container(
              //                 width: MediaQuery.of(context).size.width/8,
              //                 height: MediaQuery.of(context).size.width/8/4,
              //
              //                 decoration: BoxDecoration(
              //                     color: App.primery,
              //                     borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/8/4/2)
              //                 ),
              //                 child: Center(
              //                     child:Padding(
              //                       padding: const EdgeInsets.all(2.0),
              //                       child: FittedBox(
              //                           child: Text(App_Localization.of(context).translate("all_items"),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),)),
              //                     )
              //                 ),
              //               ),
              //             )
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Container( color: Colors.white,height: MediaQuery.of(context).size.width*0.02,),
              Container(
                width: MediaQuery.of(context).size.width,
                // color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                          width: MediaQuery.of(context).size.width*0.7,
                          child: Center(child: Text(App_Localization.of(context).translate("partner_brands"),style: const TextStyle(color: App.primery,fontSize: 25,fontWeight: FontWeight.bold),)),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      // color: const Color(0xfff5f5f5),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all( MediaQuery.of(context).size.width*0.03),
                          child:mdBrands(count:1,ratio:4/4,posts:homeController.brand,height:MediaQuery.of(context).size.width*0.15,radius:0,circle:false,background: const Color(0xfff5f5f5),shadow: false,img_radius: null,op: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(App_Localization.of(context).translate("love_your_pets"),
                        style: TextStyle(color: Colors.white,fontSize: 14)),
                  ],
                ),
              ),
              Container(height: 5),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(() => BookAssessment());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: 35,
                          decoration: BoxDecoration(
                              color: App.primery,
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.1)
                          ),
                          child: Center(
                            child: Text(App_Localization.of(context).translate("book_an_assessment"),
                              style: const TextStyle(color: Colors.white ,fontSize: 13,fontWeight: FontWeight.bold),),
                          )
                        ),
                      )
                    ],
                  )
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                    width: MediaQuery.of(context).size.width*0.7,
                    child: Center(child: Text(App_Localization.of(context).translate("reviews").toUpperCase(),style: const TextStyle(color: App.primery,fontSize: 25,fontWeight: FontWeight.bold),)),
                  ),
                ),
              ),
              mdReview(context),
              SizedBox(height: MediaQuery.of(context).size.height*0.03),
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
        ),
        Positioned(child: App.header(context,homeController,myKey),),
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
                //homeController.doFunction(op, posts[index].id, context);
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
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  posts[index].title!,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,fontSize: 13),
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
                    child: Align(alignment: Alignment.centerLeft,child: Text(homeController.aboutHomePage!.subTitle!,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white), textAlign: TextAlign.left,maxLines: 2,)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Text(homeController.aboutHomePage!.stringDescription!,
                      style: TextStyle(fontSize: 12,color: Colors.white.withOpacity(0.8)),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height:  MediaQuery.of(context).size.width*0.3,
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
                                            fontWeight: FontWeight.bold,color: App.primery,
                                            fontSize: App.largeFontSize(MediaQuery.of(context).size.width),
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
                                  child: Text(homeController.reviews[index].stringDescription!,
                                    maxLines: 6,
                                    style: TextStyle(
                                        fontSize: App.largeFontSize(MediaQuery.of(context).size.width),
                                        color: Colors.black,
                                        overflow: TextOverflow.ellipsis
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            )
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
  mdProduct({required int count, required double ratio, required List<Post> posts, required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return Container(
      height: height,
      color: background,
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

            return OnHover(builder: (isHover){
              return GestureDetector(
                onTap: () {
                  //homeController.doFunction(op, posts[index].id, context);
                },
                child: Container(

                  margin: const EdgeInsets.only(bottom: 2),
                  decoration: BoxDecoration(
                    color: background,

                  ),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Stack(
                              children: [
                                Container(
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
                                Positioned(
                                  bottom: 0,
                                  child: AnimatedContainer(
                                    width: height/ratio,
                                    height: isHover?height*3/7/4:0,
                                    // height:height*3/7/4,
                                    color: Colors.white.withOpacity(0.75),
                                    duration: const Duration(milliseconds: 300),
                                    child: Center(child: Text(App_Localization.of(context).translate("quick_view"),style: const TextStyle(color: Colors.black,fontSize: 10),),),
                                  ),
                                ),
                                posts[index].regularPrice!=null?Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                    width: height/ratio/4,
                                    height: height*3/7/5,
                                    color: Colors.red,
                                    child: Center(child: Padding(
                                      padding: const EdgeInsets.all(0.5),
                                      child: Text(App_Localization.of(context).translate("sale"),style: const TextStyle(color: Colors.white,fontSize: 12),maxLines: 1),
                                    ),),
                                  ),
                                ):const Center(),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 4,
                          child: SizedBox(
                            width:height/ratio,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // FittedBox(child: Text(posts[index].title!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),maxLines: 1,),),
                                SizedBox(
                                    width:height/ratio,
                                    child: Center(child: Text(posts[index].title!,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),maxLines: 1,overflow: TextOverflow.ellipsis,))),
                                posts[index].regularPrice == null?SizedBox(
                                  width:height/ratio,
                                  child: Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].price!.toStringAsFixed(2),style: const TextStyle(fontSize: 14,color: Colors.grey),maxLines: 1,),),
                                ):SizedBox(
                                  width:height/ratio,
                                  child: Center(child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FittedBox(
                                        child: Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].price!.toStringAsFixed(2),style: const TextStyle(fontSize: 12,color: Colors.grey),maxLines: 1)),
                                      ),
                                      // SizedBox(width: height/ratio/6,),
                                      FittedBox(
                                        child: Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].regularPrice!.toStringAsFixed(2),style: TextStyle(fontSize: 9,color: Colors.grey.withOpacity(0.5),decoration: TextDecoration.lineThrough),maxLines: 1)),
                                      ),
                                    ],
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    width: height/ratio,
                                    height: height/8,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.black,width: 1)
                                    ),
                                    child: Obx(
                                       () {
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            FittedBox(
                                              child: GestureDetector(onTap: (){
                                                // homeController.fake.value = !homeController.fake.value;
                                                if(posts[index].cartCount.value>1){
                                                  posts[index].cartCount.value -- ;
                                                }
                                              },child: Icon(Icons.remove,color: Colors.grey,size: height/10,)),
                                            ),
                                            Text(posts[index].cartCount.value.toString(),style: const TextStyle(fontSize: 14,color: Colors.grey),maxLines: 1,),
                                            FittedBox(
                                              child: GestureDetector(onTap: (){
                                                // homeController.fake.value = !homeController.fake.value;
                                                posts[index].cartCount.value ++ ;
                                              },child: Icon(Icons.add,color: Colors.grey,size: height/10)),
                                            ),

                                          ],
                                        );
                                      }
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    homeController.cartController.addToCart(posts[index], posts[index].cartCount.value, context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Container(
                                      width: height/ratio,
                                      height: height/8,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          border: Border.all(color: Colors.black,width: 2)
                                      ),
                                      child: Center(
                                        child: Text(
                                          App_Localization.of(context).translate("add_to_cart"),
                                          style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))

                    ],
                  ),
                ),
              );
            }
            );
          }),
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

  //************************ small ************************
  smHome(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          controller: App.scrollController,
          child: Column(
            children: [
              // homeController.fake.value?Center():Center(),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),

              _slider(context),
              SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                child:smService(count:1,ratio:6/4,posts:homeController.service,height:MediaQuery.of(context).size.width*0.3,radius:0,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: null,op: 1),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              smAbout(context),
              // SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              Container(
                width: MediaQuery.of(context).size.width,
                color: const Color(0xfff5f5f5),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      color: const Color(0xfff5f5f5),
                      child: Center(child: Text(App_Localization.of(context).translate("our_pets_choice"),style: const TextStyle(color: App.primery,fontSize: 21,fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
              ),

              // SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xfff5f5f5),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                        child:smProduct(count:1,ratio:6/4,posts:homeController.product,height:MediaQuery.of(context).size.width*0.3,radius:0,circle:false,background: const Color(0xfff5f5f5),shadow: false,img_radius: null,op: 1),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xfff5f5f5),
                    child: Center(
                      child: Padding(
                        // padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.03,top: MediaQuery.of(context).size.width*0.03,right: MediaQuery.of(context).size.width*0.03),
                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.03),
                          child: GestureDetector(
                            onTap: (){
                              homeController.goToShop(-1);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/8,
                              height: MediaQuery.of(context).size.width/8/4,

                              decoration: BoxDecoration(
                                  color: App.primery,
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/8/4/2)
                              ),
                              child: Center(
                                  child:Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: FittedBox(
                                        child: Text(App_Localization.of(context).translate("all_items"),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),)),
                                  )
                              ),
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              ),
              Container( color: Colors.white,height: MediaQuery.of(context).size.width*0.02,),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      color: const Color(0xfff5f5f5),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.03),
                          width: MediaQuery.of(context).size.width*0.7,
                          color: const Color(0xfff5f5f5),
                          child: Center(child: Text(App_Localization.of(context).translate("best_brands"),style: const TextStyle(color: App.primery,fontSize: 21,fontWeight: FontWeight.bold),)),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      color: const Color(0xfff5f5f5),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all( MediaQuery.of(context).size.width*0.03),
                          child:smBrands(count:1,ratio:4/4,posts:homeController.brand,height:MediaQuery.of(context).size.width*0.15,radius:0,circle:false,background: const Color(0xfff5f5f5),shadow: false,img_radius: null,op: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              App.footer(context,homeController),
            ],
          ),
        ),
        Positioned(child: App.header(context,homeController,myKey),),
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
  smService({required int count, required double ratio, required List<Post> posts, required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
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
            return Stack(
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
                Positioned(
                  bottom: MediaQuery.of(context).size.width*0.03,
                  left: MediaQuery.of(context).size.width*0.03,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width/8,

                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(posts[index].title!,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 10),),)
                      ),
                      const SizedBox(height: 15,),
                      GestureDetector(
                        onTap: (){
                          App.bookNow();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/10,
                          height: MediaQuery.of(context).size.width/10/4,

                          decoration: BoxDecoration(
                              color: App.primery,
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/10/4/2)
                          ),
                          child: Center(
                              child:Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: FittedBox(
                                    child: Text(App_Localization.of(context).translate("book_now"),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 8),)),
                              )
                          ),
                        ),
                      )

                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
  smAbout(BuildContext context){
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
                    child: Align(alignment: Alignment.centerLeft,child: Text(homeController.aboutHomePage!.subTitle!,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15,), textAlign: TextAlign.left,maxLines: 2,)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Text(homeController.aboutHomePage!.stringDescription!,
                      style: TextStyle(fontSize: 8,color: Colors.black.withOpacity(0.8)),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height:  MediaQuery.of(context).size.width*0.3,
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
  smProduct({required int count, required double ratio, required List<Post> posts, required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return Container(
      height: height,
      color: background,
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

            return OnHover(builder: (isHover){
              return GestureDetector(
                onTap: () {
                  //homeController.doFunction(op, posts[index].id, context);
                },
                child: Container(

                  margin: const EdgeInsets.only(bottom: 2),
                  decoration: BoxDecoration(
                    color: background,

                  ),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Stack(
                              children: [
                                Container(
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
                                Positioned(
                                  bottom: 0,
                                  child: AnimatedContainer(
                                    width: height/ratio,
                                    height: isHover?height*3/7/4:0,
                                    // height:height*3/7/4,
                                    color: Colors.white.withOpacity(0.75),
                                    duration: const Duration(milliseconds: 300),
                                    child: Center(child: Text(App_Localization.of(context).translate("quick_view"),style: const TextStyle(color: Colors.black,fontSize: 8),),),
                                  ),
                                ),
                                posts[index].regularPrice!=null?Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                    width: height/ratio/4,
                                    height: height*3/7/5,
                                    color: Colors.red,
                                    child: Center(child: Padding(
                                      padding: const EdgeInsets.all(0.5),
                                      child: Text(App_Localization.of(context).translate("sale"),style: const TextStyle(color: Colors.white,fontSize: 10),maxLines: 1),
                                    ),),
                                  ),
                                ):const Center(),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 4,
                          child: SizedBox(
                            width:height/ratio,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // FittedBox(child: Text(posts[index].title!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),maxLines: 1,),),
                                SizedBox(
                                    width:height/ratio,
                                    child: Center(child: Text(posts[index].title!,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),maxLines: 1,overflow: TextOverflow.ellipsis,))),
                                posts[index].regularPrice == null?SizedBox(
                                  width:height/ratio,
                                  child: Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].price!.toStringAsFixed(2),style: const TextStyle(fontSize: 11,color: Colors.grey),maxLines: 1,),),
                                ):SizedBox(
                                  width:height/ratio,
                                  child: Center(child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FittedBox(
                                        child: Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].price!.toStringAsFixed(2),style: const TextStyle(fontSize: 11,color: Colors.grey),maxLines: 1)),
                                      ),
                                      // SizedBox(width: height/ratio/6,),
                                      FittedBox(
                                        child: Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].regularPrice!.toStringAsFixed(2),style: TextStyle(fontSize: 8,color: Colors.grey.withOpacity(0.5),decoration: TextDecoration.lineThrough),maxLines: 1)),
                                      ),
                                    ],
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    width: height/ratio,
                                    height: height/8,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.black,width: 1)
                                    ),
                                    child: Obx(
                                       () {
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            FittedBox(
                                              child: GestureDetector(onTap: (){
                                                // homeController.fake.value = !homeController.fake.value;
                                                if(posts[index].cartCount.value>1){
                                                  posts[index].cartCount.value -- ;
                                                }
                                              },child: Icon(Icons.remove,color: Colors.grey,size: height/10,)),
                                            ),
                                            Text(posts[index].cartCount.value.toString(),style: const TextStyle(fontSize: 12,color: Colors.grey),maxLines: 1,),
                                            FittedBox(
                                              child: GestureDetector(onTap: (){
                                                // homeController.fake.value = !homeController.fake.value;
                                                posts[index].cartCount.value ++ ;
                                              },child: Icon(Icons.add,color: Colors.grey,size: height/10)),
                                            ),

                                          ],
                                        );
                                      }
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    homeController.cartController.addToCart(posts[index], posts[index].cartCount.value, context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Container(
                                      width: height/ratio,
                                      height: height/8,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          border: Border.all(color: Colors.black,width: 2)
                                      ),
                                      child: Center(
                                        child: Text(
                                          App_Localization.of(context).translate("add_to_cart"),
                                          style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))

                    ],
                  ),
                ),
              );
            }
            );
          }),
    );
  }
  smBrands({required int count, required double ratio, required List<Post> posts, required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
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

  //************************ Xsmall ************************
  xsmHome(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          controller: App.scrollController,
          child: Column(
            children: [
              // homeController.fake.value?Center():Center(),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),

              _slider(context),
              SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                child:xsmService(count:1,ratio:6/4,posts:homeController.service,height:MediaQuery.of(context).size.width*0.6,radius:0,circle:false,background: const Color(0xffffffff),shadow: false,img_radius: null,op: 1),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              xsmAbout(context),
              // SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              Container(
                width: MediaQuery.of(context).size.width,
                color: const Color(0xfff5f5f5),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      color: const Color(0xfff5f5f5),
                      child: Center(child: Text(App_Localization.of(context).translate("our_pets_choice"),style: const TextStyle(color: App.primery,fontSize: 12,fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
              ),

              // SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xfff5f5f5),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                        child:xsmProduct(count:1,ratio:6/4,posts:homeController.product,height:MediaQuery.of(context).size.width*0.5,radius:0,circle:false,background: const Color(0xfff5f5f5),shadow: false,img_radius: null,op: 1),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xfff5f5f5),
                    child: Center(
                      child: Padding(
                        // padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.03,top: MediaQuery.of(context).size.width*0.03,right: MediaQuery.of(context).size.width*0.03),
                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.03),
                          child: GestureDetector(
                            onTap: (){
                              homeController.goToShop(-1);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/6,
                              height: MediaQuery.of(context).size.width/6/4,

                              decoration: BoxDecoration(
                                  color: App.primery,
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/6/4/2)
                              ),
                              child: Center(
                                  child:Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: FittedBox(
                                        child: Text(App_Localization.of(context).translate("all_items"),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),)),
                                  )
                              ),
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              ),
              Container( color: Colors.white,height: MediaQuery.of(context).size.width*0.02,),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      color: const Color(0xfff5f5f5),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.03),
                          width: MediaQuery.of(context).size.width*0.7,
                          color: const Color(0xfff5f5f5),
                          child: Center(child: Text(App_Localization.of(context).translate("best_brands"),style: const TextStyle(color: App.primery,fontSize: 12,fontWeight: FontWeight.bold),)),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      color: const Color(0xfff5f5f5),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all( MediaQuery.of(context).size.width*0.03),
                          child:xsmBrands(count:1,ratio:4/4,posts:homeController.brand,height:MediaQuery.of(context).size.width*0.25,radius:0,circle:false,background: const Color(0xfff5f5f5),shadow: false,img_radius: null,op: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width*0.03,),
              App.footer(context,homeController),
            ],
          ),
        ),
        Positioned(child: App.header(context,homeController,myKey),),
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
  xsmService({required int count, required double ratio, required List<Post> posts, required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
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
            return Stack(
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
                Positioned(
                  bottom: MediaQuery.of(context).size.width*0.03,
                  left: MediaQuery.of(context).size.width*0.03,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width/4,

                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(posts[index].title!,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12),),)
                      ),
                      const SizedBox(height: 15,),
                      GestureDetector(
                        onTap: (){
                          App.bookNow();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/5,
                          height: MediaQuery.of(context).size.width/5/4,

                          decoration: BoxDecoration(
                              color: App.primery,
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/5/4/2)
                          ),
                          child: Center(
                              child:Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: FittedBox(
                                    child: Text(App_Localization.of(context).translate("book_now"),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 8),)),
                              )
                          ),
                        ),
                      )

                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
  xsmAbout(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            child: Container(
              height:  MediaQuery.of(context).size.width*0.5,
              width: MediaQuery.of(context).size.width,
              color: App.primery,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: Align(alignment: Alignment.centerLeft,child: Text(homeController.aboutHomePage!.subTitle!,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15,), textAlign: TextAlign.left,maxLines: 2,)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: Text(homeController.aboutHomePage!.stringDescription!,
                      style: TextStyle(fontSize: 10,color: Colors.black.withOpacity(0.8)),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height:  MediaQuery.of(context).size.width*0.5,
              width: MediaQuery.of(context).size.width,
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
  xsmProduct({required int count, required double ratio, required List<Post> posts, required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
    return Container(
      height: height,
      color: background,
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

            return OnHover(builder: (isHover){
              return GestureDetector(
                onTap: () {
                  //homeController.doFunction(op, posts[index].id, context);
                },
                child: Container(

                  margin: const EdgeInsets.only(bottom: 2),
                  decoration: BoxDecoration(
                    color: background,

                  ),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Stack(
                              children: [
                                Container(
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
                                Positioned(
                                  bottom: 0,
                                  child: AnimatedContainer(
                                    width: height/ratio,
                                    height: isHover?height*3/7/4:0,
                                    // height:height*3/7/4,
                                    color: Colors.white.withOpacity(0.75),
                                    duration: const Duration(milliseconds: 300),
                                    child: Center(child: Text(App_Localization.of(context).translate("quick_view"),style: const TextStyle(color: Colors.black,fontSize: 10),),),
                                  ),
                                ),
                                posts[index].regularPrice!=null?Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                    width: height/ratio/4,
                                    height: height*3/7/5,
                                    color: Colors.red,
                                    child: Center(child: Padding(
                                      padding: const EdgeInsets.all(0.5),
                                      child: Text(App_Localization.of(context).translate("sale"),style: const TextStyle(color: Colors.white,fontSize: 8),maxLines: 1),
                                    ),),
                                  ),
                                ):const Center(),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 4,
                          child: SizedBox(
                            width:height/ratio,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // FittedBox(child: Text(posts[index].title!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),maxLines: 1,),),
                                SizedBox(
                                    width:height/ratio,
                                    child: Center(child: Text(posts[index].title!,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),maxLines: 1,overflow: TextOverflow.ellipsis,))),
                                posts[index].regularPrice == null?SizedBox(
                                  width:height/ratio,
                                  child: Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].price!.toStringAsFixed(2),style: const TextStyle(fontSize: 10,color: Colors.grey),maxLines: 1,),),
                                ):SizedBox(
                                  width:height/ratio,
                                  child: Center(child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FittedBox(
                                        child: Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].price!.toStringAsFixed(2),style: const TextStyle(fontSize: 10,color: Colors.grey),maxLines: 1)),
                                      ),
                                      // SizedBox(width: height/ratio/6,),
                                      FittedBox(
                                        child: Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].regularPrice!.toStringAsFixed(2),style: TextStyle(fontSize: 7,color: Colors.grey.withOpacity(0.5),decoration: TextDecoration.lineThrough),maxLines: 1)),
                                      ),
                                    ],
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    width: height/ratio,
                                    height: height/8,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.black,width: 1)
                                    ),
                                    child: Obx(
                                      () {
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            FittedBox(
                                              child: GestureDetector(onTap: (){
                                                // homeController.fake.value = !homeController.fake.value;
                                                if(posts[index].cartCount.value>1){
                                                  posts[index].cartCount.value -- ;
                                                }
                                              },child: Icon(Icons.remove,color: Colors.grey,size: height/10,)),
                                            ),
                                            Text(posts[index].cartCount.value.toString(),style: const TextStyle(fontSize: 12,color: Colors.grey),maxLines: 1,),
                                            FittedBox(
                                              child: GestureDetector(onTap: (){
                                                // homeController.fake.value = !homeController.fake.value;
                                                posts[index].cartCount.value ++ ;
                                              },child: Icon(Icons.add,color: Colors.grey,size: height/10)),
                                            ),

                                          ],
                                        );
                                      }
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    homeController.cartController.addToCart(posts[index], posts[index].cartCount.value, context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Container(
                                      width: height/ratio,
                                      height: height/8,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          border: Border.all(color: Colors.black,width: 2)
                                      ),
                                      child: Center(
                                        child: Text(
                                          App_Localization.of(context).translate("add_to_cart"),
                                          style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))

                    ],
                  ),
                ),
              );
            }
            );
          }),
    );
  }
  xsmBrands({required int count, required double ratio, required List<Post> posts, required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
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
  brands({required int count, required double ratio, required List<Post> posts, required double height, required double? img_radius, required double? radius, required bool circle, required Color background, required bool shadow, required int op}) {
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
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.5,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            /**slider*/
            child: CarouselSlider(
              items: homeController.banner.map((e){
                return GestureDetector(
                  onTap: (){
                    // homeController.doFunction(0,e.id,context);
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.5,
                      child:
                      CachedNetworkImage(
                        // placeholder: (context, url) => const CircularProgressIndicator(),
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
                            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.1),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width>App.larg ? MediaQuery.of(context).size.width * 0.3 : MediaQuery.of(context).size.width * 0.3,
                                    child: Text(homeController.banner[homeController.selder_selected.value].title!,
                                      style: TextStyle(
                                          color: Colors.white ,
                                          fontSize: MediaQuery.of(context).size.width>App.larg ? 30 :
                                          MediaQuery.of(context).size.width>App.big? 16 : 14,
                                          fontWeight: FontWeight.bold),),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                  GestureDetector(
                                    onTap: (){
                                      Get.to(() => BookAssessment());
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width>App.larg ?
                                          MediaQuery.of(context).size.width * 0.15 : MediaQuery.of(context).size.width>App.big?
                                          MediaQuery.of(context).size.width * 0.2 : MediaQuery.of(context).size.width * 0.23,
                                      height: MediaQuery.of(context).size.width>App.larg ?
                                          40 : MediaQuery.of(context).size.width>App.big?
                                          35 : 30,
                                      decoration: BoxDecoration(
                                          color: App.primery,
                                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.1)
                                      ),
                                      child: Center(
                                        child: Text(App_Localization.of(context).translate("book_an_assessment"),style:TextStyle(
                                            color: Colors.white ,
                                            fontSize: MediaQuery.of(context).size.width>App.larg ?
                                            15 : MediaQuery.of(context).size.width>App.big?
                                            12 : 10,
                                            fontWeight: FontWeight.bold),),
                                      ) ,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
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
        )
        /**3 point*/
        // Positioned(
        //   bottom: 10,
        //   child: SizedBox(
        //     width: MediaQuery.of(context).size.width,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children:homeController.banner.map((e) {
        //         return  Padding(
        //           padding: const EdgeInsets.all(4.0),
        //           child: Container(
        //             width: 8,
        //             height: 8,
        //             decoration: BoxDecoration(
        //               color: homeController.selder_selected.value == homeController.banner.indexOf(e)
        //                   ? App.primery
        //                   : Colors.grey,
        //               shape: BoxShape.circle,
        //             ),
        //           ),
        //         );
        //       }).toList(),
        //     ),
        //   ),
        // ),
      ],
    );
  }

}
