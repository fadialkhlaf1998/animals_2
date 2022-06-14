import 'package:animals/app_localization.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zoom_widget/zoom_widget.dart';

class Contact extends StatelessWidget {
  final HomeController homeController = Get.find();

  final GlobalKey<ScaffoldState> myKey = GlobalKey();

  Contact({Key? key}) : super(key: key);
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     key: myKey,
  //     endDrawer: App.myDrawer(context, homeController,myKey),
  //     body: RefreshIndicator(
  //       onRefresh: ()async{
  //         Get.offAllNamed("/");
  //       },
  //       child: Zoom(
  //         maxZoomWidth: MediaQuery.of(context).size.width,
  //         maxZoomHeight: MediaQuery.of(context).size.height,
  //         child: SafeArea(
  //           child: Stack(
  //             children: [
  //               Container(
  //                 width: MediaQuery.of(context).size.width,
  //                 height: MediaQuery.of(context).size.height,
  //                 decoration: BoxDecoration(
  //                     image: DecorationImage(
  //                         fit: BoxFit.cover,
  //                         image: AssetImage("assets/image/Background.png")
  //                     )
  //                 ),
  //                 child: SingleChildScrollView(
  //                   child: Column(
  //                     children: [
  //                       SizedBox(height: MediaQuery.of(context).size.width>App.mid?MediaQuery.of(context).size.height*0.15:MediaQuery.of(context).size.height*0.1,),
  //                       _body(context,
  //                       //title
  //                       MediaQuery.of(context).size.width>App.larg?30
  //                           :MediaQuery.of(context).size.width>App.big?22
  //                           :MediaQuery.of(context).size.width>App.mid?16
  //                           :MediaQuery.of(context).size.width>App.small?12:7,
  //                       //body
  //                       MediaQuery.of(context).size.width>App.larg?25
  //                           :MediaQuery.of(context).size.width>App.big?15
  //                           :MediaQuery.of(context).size.width>App.mid?12
  //                           :MediaQuery.of(context).size.width>App.small?9:6,
  //                       ),
  //                       App.footer(context,homeController),
  //                       Container(
  //                         width: MediaQuery.of(context).size.width,
  //                         height: 50,
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: [
  //                             Text("© 2022 by The Barkley Pet Camp",
  //                                 style: TextStyle(fontSize: 10)),
  //                           ],
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               Positioned(child: App.header(context, homeController,myKey)),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  // _body(BuildContext context,double title, double body){
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     height: MediaQuery.of(context).size.width*0.4,
  //     decoration: const BoxDecoration(
  //         image: DecorationImage(
  //             image: AssetImage("assets/image/contact_cover.jpg"),
  //             fit: BoxFit.fitHeight
  //         )
  //     ),
  //     child: Center(
  //       child: Container(
  //         width: MediaQuery.of(context).size.width*0.4,
  //         height: MediaQuery.of(context).size.width<400?100:MediaQuery.of(context).size.width*0.3,
  //         color: App.green.withOpacity(0.75),
  //         child: Center(
  //           child: SizedBox(
  //             width: MediaQuery.of(context).size.width*0.3,
  //             height:  MediaQuery.of(context).size.width<400?80:MediaQuery.of(context).size.width*0.2,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text("Dubai, United Arab Emirates",style: TextStyle(fontWeight: FontWeight.bold,fontSize: title),maxLines: 1,),
  //                 SizedBox(height:MediaQuery.of(context).size.width*0.01),
  //                 Text("Tel: 04 123 4567",style: TextStyle(fontSize: body,color: App.auto),maxLines: 1,),
  //                 Text("Ras Al Khor Industrial Area 2",style: TextStyle(fontSize: body,color: App.auto),maxLines: 1,),
  //                 Text("Dubai, United Arab Emirates",style: TextStyle(fontSize: body,color: App.auto),maxLines: 1,),
  //                 SizedBox(height:MediaQuery.of(context).size.width*0.02),
  //
  //
  //                 Text("Opening Hours",style: TextStyle(fontSize: title,fontWeight: FontWeight.bold),maxLines: 1,),
  //                 SizedBox(height:MediaQuery.of(context).size.width*0.01),
  //                 Text("Monday - Saturday: 7am - 10pm",style: TextStyle(fontSize: body,color: App.auto),maxLines: 1,),
  //                 Text("Sunday: Closed",style: TextStyle(fontSize: body,color: App.auto),maxLines: 1,),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: myKey,
      endDrawer: App.myDrawer(context, homeController,myKey),
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
                  child: SingleChildScrollView(
                    child: contactUs(context, homeController)
                  )
                ),
                Positioned(child: App.header(context, homeController,myKey)),
                Positioned(
                    right: 0,
                    child: App.languageBarHome(context, homeController)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
   contactUs(BuildContext context,HomeController homeController){
    return MediaQuery.of(context).size.width>App.larg ? largeContactUs(context,homeController)
        : MediaQuery.of(context).size.width>App.big ?
          bigContactUs(context,homeController) : medContactUs(context,homeController);
  }
   largeContactUs(BuildContext context,HomeController homeController){
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.25),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width/2 - 5,
              height: MediaQuery.of(context).size.width*0.4,
              decoration:BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/map.PNG"),
                      fit: BoxFit.fill
                  )
              ),
            ),
            Container(
              width: 10,
              height: MediaQuery.of(context).size.width * 0.4,
              color: Colors.white,
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.4,
              width: MediaQuery.of(context).size.width/2 - 5,
              color: App.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: 25,
                      height: 25,
                    )
                  ),
                  Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.15,
                        child: Center(
                            child: Text(App_Localization.of(context).translate("contact_us").toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.white,fontSize:30,
                                    fontWeight: FontWeight.bold),maxLines: 1)
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width*0.2,
                          height: 40,
                          color: Colors.white.withOpacity(0.7),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration:  InputDecoration(
                              hintText: App_Localization.of(context).translate("first_name"),
                              hintStyle: TextStyle(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                              ),
                              enabledBorder:const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                              ),
                            ),
                          )
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Container(
                          width: MediaQuery.of(context).size.width*0.2,
                          height: 40,
                          color: Colors.white.withOpacity(0.7),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration:  InputDecoration(
                              hintText: App_Localization.of(context).translate("last_name"),
                              hintStyle: TextStyle(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                              ),
                              enabledBorder:const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                              ),
                            ),
                          )
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Container(
                          width: MediaQuery.of(context).size.width*0.2,
                          height: 40,
                          color: Colors.white.withOpacity(0.7),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration:  InputDecoration(
                              hintText: App_Localization.of(context).translate("footer4_content_email"),
                              hintStyle: TextStyle(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                              ),
                              enabledBorder:const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                              ),
                            ),
                          )
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      GestureDetector(
                        onTap: () {
                          //todo subscribe
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: 40,
                            decoration: BoxDecoration(
                                color: App.primery,
                                borderRadius: BorderRadius.circular(50/2)
                            ),
                            child: Center(
                              child: Text(App_Localization.of(context).translate("footer4_content_subscribe"),
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15),),
                            )
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(App_Localization.of(context).translate("footer1"),
                              style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text("Warehouse S01, Ras Al Khor 2",
                            style: TextStyle(fontSize: 15,color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                          SizedBox(height: 10),
                          Text("Dubai, United Arab Emirates",
                            style: TextStyle(fontSize: 15,color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("T. " + "+9714 333 5843",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white.withOpacity(0.7),
                                    fontWeight: FontWeight.normal),
                                maxLines: 10,
                              ),
                              SizedBox(width: 5),
                              Text(" / ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white.withOpacity(0.7),
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(width: 5),
                              Text("M. " + "+971 54 204 6700",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white.withOpacity(0.7),
                                    fontWeight: FontWeight.normal),
                                maxLines: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          SizedBox(height: 10),
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
                          SizedBox(height: 10),
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
                          SizedBox(height: 10),
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
    );
  }
   bigContactUs(BuildContext context,HomeController homeController){
     return Column(
       children: [
         SizedBox(height: MediaQuery.of(context).size.height * 0.25),
         SizedBox(height: MediaQuery.of(context).size.height * 0.1),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Container(
               width: MediaQuery.of(context).size.width/2 - 5,
               height: MediaQuery.of(context).size.width*0.4,
               decoration:BoxDecoration(
                   image: DecorationImage(
                       image: AssetImage("assets/image/map.PNG"),
                       fit: BoxFit.fill
                   )
               ),
             ),
             Container(
               width: 10,
               height: MediaQuery.of(context).size.width * 0.4,
               color: Colors.white,
             ),
             Container(
               height: MediaQuery.of(context).size.width * 0.4,
               width: MediaQuery.of(context).size.width/2 - 5,
               color: App.green,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 20),
                       child: Container(
                         width: 25,
                         height: 25,
                       )
                   ),
                   Column(
                     children: [
                       SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                       SizedBox(
                         height: MediaQuery.of(context).size.height*0.1,
                         child: Center(
                             child: Text(App_Localization.of(context).translate("contact_us").toUpperCase(),
                                 style: const TextStyle(
                                     color: Colors.white,fontSize:25,
                                     fontWeight: FontWeight.bold),maxLines: 1)
                         ),
                       ),
                       Container(
                           width: MediaQuery.of(context).size.width*0.2,
                           height: 35,
                           color: Colors.white.withOpacity(0.7),
                           child: TextField(
                             style: TextStyle(fontSize: 13),
                             textAlignVertical: TextAlignVertical.bottom,
                             decoration:  InputDecoration(
                               hintText: App_Localization.of(context).translate("first_name"),
                               hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
                               focusedBorder: OutlineInputBorder(
                                 borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                               ),
                               enabledBorder:const OutlineInputBorder(
                                 borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                               ),
                             ),
                           )
                       ),
                       SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                       Container(
                           width: MediaQuery.of(context).size.width*0.2,
                           height: 35,
                           color: Colors.white.withOpacity(0.7),
                           child: TextField(
                             style: TextStyle(fontSize: 13),
                             textAlignVertical: TextAlignVertical.bottom,
                             decoration:  InputDecoration(
                               hintText: App_Localization.of(context).translate("last_name"),
                               hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
                               focusedBorder: OutlineInputBorder(
                                 borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                               ),
                               enabledBorder:const OutlineInputBorder(
                                 borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                               ),
                             ),
                           )
                       ),
                       SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                       Container(
                           width: MediaQuery.of(context).size.width*0.2,
                           height: 35,
                           color: Colors.white.withOpacity(0.7),
                           child: TextField(
                             style: TextStyle(fontSize: 13),
                             textAlignVertical: TextAlignVertical.bottom,
                             decoration:  InputDecoration(
                               hintText: App_Localization.of(context).translate("footer4_content_email"),
                               hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
                               focusedBorder: OutlineInputBorder(
                                 borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                               ),
                               enabledBorder:const OutlineInputBorder(
                                 borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                               ),
                             ),
                           )
                       ),
                       SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                       GestureDetector(
                         onTap: () {
                           //todo subscribe
                         },
                         child: Container(
                             width: MediaQuery.of(context).size.width * 0.13,
                             height: 35,
                             decoration: BoxDecoration(
                                 color: App.primery,
                                 borderRadius: BorderRadius.circular(50/2)
                             ),
                             child: Center(
                               child: Text(App_Localization.of(context).translate("footer4_content_subscribe"),
                                 style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 13),),
                             )
                         ),
                       ),
                       SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Text(App_Localization.of(context).translate("footer1"),
                               style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold)),
                           SizedBox(height: 5),
                           Text("Warehouse S01, Ras Al Khor 2",
                             style: TextStyle(fontSize: 13,color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                           SizedBox(height: 5),
                           Text("Dubai, United Arab Emirates",
                             style: TextStyle(fontSize: 13,color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                           SizedBox(height: 5),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text("T. " + "+9714 333 5843",
                                 style: TextStyle(
                                     fontSize: 13,
                                     color: Colors.white.withOpacity(0.7),
                                     fontWeight: FontWeight.normal),
                                 maxLines: 10,
                               ),
                               SizedBox(width: 5),
                               Text(" / ",
                                 style: TextStyle(
                                     fontSize: 15,
                                     color: Colors.white.withOpacity(0.7),
                                     fontWeight: FontWeight.normal),
                               ),
                               SizedBox(width: 5),
                               Text("M. " + "+971 54 204 6700",
                                 style: TextStyle(
                                     fontSize: 13,
                                     color: Colors.white.withOpacity(0.7),
                                     fontWeight: FontWeight.normal),
                                 maxLines: 10,
                               ),
                             ],
                           ),
                         ],
                       ),
                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 25),
                     child: SingleChildScrollView(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
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
                           SizedBox(height: 10),
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
                           SizedBox(height: 10),
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
                           SizedBox(height: 10),
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
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ],
         ),
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
     );
  }
   medContactUs(BuildContext context,HomeController homeController){
     return Column(
       children: [
         SizedBox(height: MediaQuery.of(context).size.height * 0.25),
         SizedBox(height: MediaQuery.of(context).size.height * 0.05),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Container(
               width: MediaQuery.of(context).size.width/2 - 5,
               height: MediaQuery.of(context).size.width * 0.45,
               decoration:BoxDecoration(
                   image: DecorationImage(
                       image: AssetImage("assets/image/map.PNG"),
                       fit: BoxFit.fill
                   )
               ),
             ),
             Container(
               width: 10,
               height: MediaQuery.of(context).size.width * 0.45,
               color: Colors.white,
             ),
             Container(
               height: MediaQuery.of(context).size.width * 0.45,
               width: MediaQuery.of(context).size.width/2 - 5,
               color: App.green,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 20),
                       child: Container(
                         width: 20,
                         height: 20,
                       )
                   ),
                   Column(
                     children: [
                       SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                       SizedBox(
                         height: MediaQuery.of(context).size.height*0.1,
                         child: Center(
                             child: Text(App_Localization.of(context).translate("contact_us").toUpperCase(),
                                 style: const TextStyle(
                                     color: Colors.white,fontSize:20,
                                     fontWeight: FontWeight.bold),maxLines: 1)
                         ),
                       ),
                       Container(
                           width: MediaQuery.of(context).size.width*0.2,
                           height: 30,
                           color: Colors.white.withOpacity(0.7),
                           child: TextField(
                             style: TextStyle(fontSize: 10),
                             textAlignVertical: TextAlignVertical.bottom,
                             decoration:  InputDecoration(
                               hintText: App_Localization.of(context).translate("first_name"),
                               hintStyle: TextStyle(color: Colors.grey,fontSize: 10),
                               focusedBorder: OutlineInputBorder(
                                 borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                               ),
                               enabledBorder:const OutlineInputBorder(
                                 borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                               ),
                             ),
                           )
                       ),
                       SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                       Container(
                           width: MediaQuery.of(context).size.width*0.2,
                           height: 30,
                           color: Colors.white.withOpacity(0.7),
                           child: TextField(
                             style: TextStyle(fontSize: 10),
                             textAlignVertical: TextAlignVertical.bottom,
                             decoration:  InputDecoration(
                               hintText: App_Localization.of(context).translate("last_name"),
                               hintStyle: TextStyle(color: Colors.grey,fontSize: 10),
                               focusedBorder: OutlineInputBorder(
                                 borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                               ),
                               enabledBorder:const OutlineInputBorder(
                                 borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                               ),
                             ),
                           )
                       ),
                       SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                       Container(
                           width: MediaQuery.of(context).size.width*0.2,
                           height: 30,
                           color: Colors.white.withOpacity(0.7),
                           child: TextField(
                             style: TextStyle(fontSize: 10),
                             textAlignVertical: TextAlignVertical.bottom,
                             decoration:  InputDecoration(
                               hintText: App_Localization.of(context).translate("footer4_content_email"),
                               hintStyle: TextStyle(color: Colors.grey,fontSize: 10),
                               focusedBorder: OutlineInputBorder(
                                 borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                               ),
                               enabledBorder:const OutlineInputBorder(
                                 borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                               ),
                             ),
                           )
                       ),
                       SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                       GestureDetector(
                         onTap: () {
                           //todo subscribe
                         },
                         child: Container(
                             width: MediaQuery.of(context).size.width * 0.13,
                             height: 30,
                             decoration: BoxDecoration(
                                 color: App.primery,
                                 borderRadius: BorderRadius.circular(50/2)
                             ),
                             child: Center(
                               child: Text(App_Localization.of(context).translate("footer4_content_subscribe"),
                                 style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 10),),
                             )
                         ),
                       ),
                       SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Text(App_Localization.of(context).translate("footer1"),
                               style: TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.bold)),
                           SizedBox(height: 5),
                           Text("Warehouse S01, Ras Al Khor 2",
                             style: TextStyle(fontSize: 10,color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                           SizedBox(height: 5),
                           Text("Dubai, United Arab Emirates",
                             style: TextStyle(fontSize: 10,color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                           SizedBox(height: 5),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text("T. " + "+9714 333 5843",
                                 style: TextStyle(
                                     fontSize: 10,
                                     color: Colors.white.withOpacity(0.7),
                                     fontWeight: FontWeight.normal),
                                 maxLines: 10,
                               ),
                               SizedBox(width: 5),
                               Text(" / ",
                                 style: TextStyle(
                                     fontSize: 13,
                                     color: Colors.white.withOpacity(0.7),
                                     fontWeight: FontWeight.normal),
                               ),
                               SizedBox(width: 5),
                               Text("M. " + "+971 54 204 6700",
                                 style: TextStyle(
                                     fontSize: 10,
                                     color: Colors.white.withOpacity(0.7),
                                     fontWeight: FontWeight.normal),
                                 maxLines: 10,
                               ),
                             ],
                           ),
                         ],
                       ),
                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20),
                     child: SingleChildScrollView(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
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
                           SizedBox(height: 10),
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
                           SizedBox(height: 10),
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
                           SizedBox(height: 10),
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
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ],
         ),
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
     );
  }

}
