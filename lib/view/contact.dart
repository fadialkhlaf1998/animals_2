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
        SizedBox(height: MediaQuery.of(context).size.width * 0.12),
        SizedBox(height: MediaQuery.of(context).size.width * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width/2 - 5,
              height: MediaQuery.of(context).size.width * 0.31,
              decoration:BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/map.PNG"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Container(
              width: 10,
              height: MediaQuery.of(context).size.width * 0.31,
              color: Colors.white,
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.31,
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
                      SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                              child: Text(App_Localization.of(context).translate("contact_us").toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: "FOUNDRYGRIDNIK",
                                      fontSize:35,
                                      fontWeight: FontWeight.bold),maxLines: 1)
                          ),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width*0.2,
                          height: 40,
                          color: Colors.white.withOpacity(0.9),
                          child: TextField(
                            style: TextStyle(fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration:  InputDecoration(
                              hintText: App_Localization.of(context).translate("first_name"),
                              hintStyle: TextStyle(color: Colors.grey,fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
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
                          width: MediaQuery.of(context).size.width*0.2,
                          height: 40,
                          color: Colors.white.withOpacity(0.9),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,
                            style: TextStyle(fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
                            decoration:  InputDecoration(
                              hintText: App_Localization.of(context).translate("last_name"),
                              hintStyle: TextStyle(color: Colors.grey,fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
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
                          width: MediaQuery.of(context).size.width*0.2,
                          height: 40,
                          color: Colors.white.withOpacity(0.9),
                          child: TextField(
                            style: TextStyle(fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration:  InputDecoration(
                              hintText: App_Localization.of(context).translate("footer4_content_email"),
                              hintStyle: TextStyle(color: Colors.grey,fontSize: App.largeFontSize(MediaQuery.of(context).size.width)),
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
                          //todo subscribe
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            decoration: BoxDecoration(
                                color: App.primery,
                                borderRadius: BorderRadius.circular(50/2)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Text(App_Localization.of(context).translate("footer4_content_subscribe"),
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: "FOUNDRYGRIDNIK",
                                      fontSize: App.largeFontSize(MediaQuery.of(context).size.width)
                                  ),),
                              ),
                            )
                        ),
                      ),
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(App_Localization.of(context).translate("footer1"),
                              style: TextStyle(
                                  fontSize: App.largeFontSize(MediaQuery.of(context).size.width) + 5,
                                  color: Colors.white,fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text("Warehouse S01, Ras Al Khor 2",
                            style: TextStyle(
                                fontSize: App.largeFontSize(MediaQuery.of(context).size.width),
                                color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                          SizedBox(height: 10),
                          Text("Dubai, United Arab Emirates",
                            style: TextStyle(
                                fontSize: App.largeFontSize(MediaQuery.of(context).size.width),
                                color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("T. " + "+9714 333 5843",
                                style: TextStyle(
                                    fontSize: App.largeFontSize(MediaQuery.of(context).size.width),
                                    color: Colors.white.withOpacity(0.7),
                                    fontWeight: FontWeight.normal),
                                maxLines: 10,
                              ),
                              SizedBox(width: 5),
                              Text(" / ",
                                style: TextStyle(
                                    fontSize: App.largeFontSize(MediaQuery.of(context).size.width) + 5,
                                    color: Colors.white.withOpacity(0.7),
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(width: 5),
                              Text("M. " + "+971 54 204 6700",
                                style: TextStyle(
                                    fontSize: App.largeFontSize(MediaQuery.of(context).size.width),
                                    color: Colors.white.withOpacity(0.7),
                                    fontWeight: FontWeight.normal),
                                maxLines: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
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
                              width: MediaQuery.of(context).size.width > 2000 ? 40 : 25,
                              height: MediaQuery.of(context).size.width > 2000 ? 40 : 25,
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
                              width: MediaQuery.of(context).size.width > 2000 ? 40 : 25,
                              height: MediaQuery.of(context).size.width > 2000 ? 40 : 25,
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
                              width: MediaQuery.of(context).size.width > 2000 ? 40 : 25,
                              height: MediaQuery.of(context).size.width > 2000 ? 40 : 25,
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
                              width: MediaQuery.of(context).size.width > 2000 ? 40 : 25,
                              height: MediaQuery.of(context).size.width > 2000 ? 40 : 25,
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
                  style: TextStyle(
                      fontFamily: "FOUNDRYGRIDNIK",
                      fontSize: App.largeFontSize( MediaQuery.of(context).size.width))),
            ],
          ),
        ),
      ],
    );
  }
   bigContactUs(BuildContext context,HomeController homeController){
     return Column(
       children: [
         SizedBox(height: MediaQuery.of(context).size.width * 0.12),
         SizedBox(height: MediaQuery.of(context).size.width * 0.05),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Container(
               width: MediaQuery.of(context).size.width/2 - 5,
               height: MediaQuery.of(context).size.width*0.37,
               decoration:BoxDecoration(
                   image: DecorationImage(
                       image: AssetImage("assets/image/map.PNG"),
                       fit: BoxFit.cover
                   )
               ),
             ),
             Container(
               width: 10,
               height: MediaQuery.of(context).size.width * 0.37,
               color: Colors.white,
             ),
             Container(
               height: MediaQuery.of(context).size.width * 0.37,
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
                       SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                       SizedBox(
                         height: MediaQuery.of(context).size.height*0.1,
                         child: Center(
                             child: Text(App_Localization.of(context).translate("contact_us").toUpperCase(),
                                 style: const TextStyle(
                                     fontFamily: "FOUNDRYGRIDNIK",
                                     color: Colors.white,fontSize:25,
                                     fontWeight: FontWeight.bold),maxLines: 1)
                         ),
                       ),
                       Container(
                           width: MediaQuery.of(context).size.width*0.2,
                           height: 35,
                           color: Colors.white.withOpacity(0.9),
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
                       SizedBox(height: 10),
                       Container(
                           width: MediaQuery.of(context).size.width*0.2,
                           height: 35,
                           color: Colors.white.withOpacity(0.9),
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
                       SizedBox(height: 10),
                       Container(
                           width: MediaQuery.of(context).size.width*0.2,
                           height: 35,
                           color: Colors.white.withOpacity(0.9),
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
                       SizedBox(height: 15),
                       GestureDetector(
                         onTap: () {
                           //todo subscribe
                         },
                         child: Container(
                             width: MediaQuery.of(context).size.width * 0.13,
                             decoration: BoxDecoration(
                                 color: App.primery,
                                 borderRadius: BorderRadius.circular(50/2)
                             ),
                             child: Center(
                               child: Padding(
                                 padding: const EdgeInsets.all(10),
                                 child: Text(App_Localization.of(context).translate("footer4_content_subscribe"),
                                   style: TextStyle(
                                       fontFamily: "FOUNDRYGRIDNIK",
                                       fontWeight: FontWeight.bold,color: Colors.white,fontSize: 13),),
                               ),
                             )
                         ),
                       ),
                       SizedBox(height: 20),
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
                       SizedBox(height: 20),
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
                   style: TextStyle(
                       fontFamily: "FOUNDRYGRIDNIK",
                       fontSize: 10)),
             ],
           ),
         ),
       ],
     );
  }
   medContactUs(BuildContext context,HomeController homeController){
     return Column(
       children: [
         SizedBox(height: MediaQuery.of(context).size.width * 0.14),
         SizedBox(height: MediaQuery.of(context).size.width * 0.05),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Container(
               width: MediaQuery.of(context).size.width/2 - 5,
               height: MediaQuery.of(context).size.width * 0.5,
               decoration:BoxDecoration(
                   image: DecorationImage(
                       image: AssetImage("assets/image/map.PNG"),
                       fit: BoxFit.cover
                   )
               ),
             ),
             Container(
               width: 10,
               height: MediaQuery.of(context).size.width * 0.5,
               color: Colors.white,
             ),
             Container(
               height: MediaQuery.of(context).size.width * 0.5,
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
                       SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                       SizedBox(
                         height: MediaQuery.of(context).size.height*0.1,
                         child: Center(
                             child: Text(App_Localization.of(context).translate("contact_us").toUpperCase(),
                                 style: const TextStyle(
                                     fontFamily: "FOUNDRYGRIDNIK",
                                     color: Colors.white,fontSize:20,
                                     fontWeight: FontWeight.bold),maxLines: 1)
                         ),
                       ),
                       Container(
                           width: MediaQuery.of(context).size.width*0.2,
                           height: 30,
                           color: Colors.white.withOpacity(0.9),
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
                       SizedBox(height: 10),
                       Container(
                           width: MediaQuery.of(context).size.width*0.2,
                           height: 30,
                           color: Colors.white.withOpacity(0.9),
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
                       SizedBox(height: 10),
                       Container(
                           width: MediaQuery.of(context).size.width*0.2,
                           height: 30,
                           color: Colors.white.withOpacity(0.9),
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
                       SizedBox(height: 15),
                       GestureDetector(
                         onTap: () {
                           //todo subscribe
                         },
                         child: Container(
                             width: MediaQuery.of(context).size.width * 0.13,
                             decoration: BoxDecoration(
                                 color: App.primery,
                                 borderRadius: BorderRadius.circular(50/2)
                             ),
                             child: Center(
                               child: Padding(
                                 padding: const EdgeInsets.all(10),
                                 child: Text(App_Localization.of(context).translate("footer4_content_subscribe"),
                                   style: TextStyle(
                                     fontFamily: "FOUNDRYGRIDNIK",
                                       fontWeight: FontWeight.bold,color: Colors.white,fontSize: 10),),
                               ),
                             )
                         ),
                       ),
                       SizedBox(height: 20),
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
                   style: TextStyle(
                       fontFamily: "FOUNDRYGRIDNIK",
                       fontSize: 10)),
             ],
           ),
         ),
       ],
     );
  }

}
