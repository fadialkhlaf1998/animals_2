import 'package:animals/app_localization.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/controller/shop_controller.dart';
import 'package:animals/helper/store.dart';
import 'package:animals/model/post.dart';
import 'package:animals/view/on_hover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class App {

  ////////////////////////  App Colors  ////////////////////////
  static const Color primery = Color(0xffff6200);
  static const Color orange = Color(0xffff9728);
  static const Color secondry = Color(0xffffffff);
  static const Color grey = Color(0xfff5f5f5);
  static const Color hoverGrey = Color(0xffececec);
  static const Color green = Color(0xff00a550);
  static const Color lightOrang =  Color(0xffFFB380);
  static Color auto = Colors.black.withOpacity(0.75);
  static Color purple = Color(0xff662482);
  static Color blue = Color(0xff1174bb);

  ////////////////////////  Responsives  ////////////////////////
  static const double extra =  2500;
  static const double extra2 =  2200;
  static const double xLarge = 1900;
  static const double xLarge2 = 1600;
  static const double larg = 1300;
  static const double larg2 = 1000;
  static const double big = 1000;

  ////////////////////////  Map  ////////////////////////
  static double latitude = 25.1774539 ;
  static double longitude = 55.3645627;


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

  //////////////////////// Footers  ////////////////////////
  static footer(BuildContext context,HomeController homeController){
    return  MediaQuery.of(context).size.width>App.extra ? extraFooter(context,homeController) :
    MediaQuery.of(context).size.width>App.extra2 ? extra2Footer(context,homeController) :
    MediaQuery.of(context).size.width>App.xLarge?xlargFooter(context,homeController) :
    MediaQuery.of(context).size.width>App.xLarge2?xlarg2Footer(context,homeController) :
      MediaQuery.of(context).size.width>App.larg?largFooter(context,homeController)
        :MediaQuery.of(context).size.width>App.larg2?large2Footer(context,homeController)
        : bigFooter(context,homeController);
  }
  static extraFooter(BuildContext context,HomeController homeController){
    return Obx(() => SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width > 2700 ? MediaQuery.of(context).size.width * 0.21 :
      MediaQuery.of(context).size.width * 0.22,
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                  height: MediaQuery.of(context).size.width*0.3,
                  child: GoogleMap(
                    zoomGesturesEnabled: false,
                    zoomControlsEnabled: false,
                    onMapCreated: homeController.onMapCreated,
                    markers: homeController.marker,
                    initialCameraPosition: homeController.initialCameraPosition,
                  ),
                ),),
                Positioned(
                  top : (MediaQuery.of(context).size.width*0.06) - 5,
                  left: (MediaQuery.of(context).size.width * 0.25) - 35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        color: purple,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("The Barckly",style: TextStyle(fontSize: 23,color: Colors.white)),
                            Text("Main Office",style: TextStyle(fontSize: 21,color: Colors.white))
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on,size: 50,color: purple,),
                      ),
                    ],
                  )
                ),
                GestureDetector(
                  onTap: (){
                    homeController.openMap(latitude, longitude);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width*0.3,
                    color: Colors.transparent,
                  ),
                ),
              ],
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
                                    fontSize: 23,
                                    color: Colors.white,fontWeight: FontWeight.bold)),
                            SizedBox(height: MediaQuery.of(context).size.width*0.03,child: Center(),),
                            Text("Warehouse S01, Ras Al Khor 2",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 21,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("Dubai, United Arab Emirates",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 21,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("04 333 5843",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 21,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("+971 54 204 6700",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 21,
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
                                  fontSize: 23,
                                  color: Colors.white,fontWeight: FontWeight.bold),maxLines: 1,),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            Container(
                                width: MediaQuery.of(context).size.width*0.2,
                                height: 70,
                                child: TextField(
                                  controller: homeController.subscribeEmail,
                                  style: TextStyle(
                                    fontFamily: "POPPINS",
                                    fontSize: 23,
                                  ),
                                  textAlignVertical: TextAlignVertical.bottom,
                                  decoration:  InputDecoration(
                                    hintText: App_Localization.of(context).translate("footer4_content_email"),
                                    hintStyle: TextStyle(color: Colors.grey,
                                        fontFamily: "POPPINS",
                                      fontSize: 23),
                                    fillColor: Colors.white.withOpacity(0.9),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: homeController.subscribeEmail.text.isEmpty
                                          && homeController.clickSubscribe.isTrue ?
                                      Colors.red : Colors.transparent,width: 3.3),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: homeController.subscribeEmail.text.isEmpty
                                          && homeController.clickSubscribe.isTrue ?
                                          Colors.red : Colors.transparent,width: 3.3),
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            GestureDetector(
                              onTap: () {
                                homeController.Subscribe(context, homeController.subscribeEmail.text);
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
                                            fontSize: 23,
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
                                    String facebook = 'https://www.facebook.com/thebarkley.ae';
                                     launchUrl(Uri.parse(facebook));
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
                                    String istagram = 'https://www.instagram.com/thebarkley.ae/';
                                    launchUrl(Uri.parse(istagram));
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
                                    String tiktok = 'https://www.tiktok.com/@bk9.ae';
                                    launchUrl(Uri.parse(tiktok));
                                  },
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/tiktok.svg",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    String youtube = 'https://www.youtube.com/channel/UCbo7v4tCiUVIfptpWqTGg-A';
                                    launchUrl(Uri.parse(youtube));
                                  },
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    child: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: SvgPicture.asset("assets/socialMedia/youtube.svg",
                                        color: Colors.white,
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
  static extra2Footer(BuildContext context,HomeController homeController){
    return Obx(() => SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width > 2350 ? MediaQuery.of(context).size.width * 0.21 :
      MediaQuery.of(context).size.width * 0.22,
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    height: MediaQuery.of(context).size.width*0.3,
                    child: GoogleMap(
                      zoomGesturesEnabled: false,
                      zoomControlsEnabled: false,
                      onMapCreated: homeController.onMapCreated,
                      markers: homeController.marker,
                      initialCameraPosition: homeController.initialCameraPosition,
                    ),
                  ),),
                Positioned(
                    top : (MediaQuery.of(context).size.width*0.06) - 10,
                    left: (MediaQuery.of(context).size.width * 0.25) - 35,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          color: purple,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("The Barckly",style: TextStyle(fontSize: 21,color: Colors.white)),
                              Text("Main Office",style: TextStyle(fontSize: 19,color: Colors.white))
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on,size: 50,color: purple,),
                        ),
                      ],
                    )
                ),
                GestureDetector(
                  onTap: (){
                    homeController.openMap(latitude, longitude);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width*0.3,
                    color: Colors.transparent,
                  ),
                ),
              ],
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
                                    fontSize: 21,
                                    color: Colors.white,fontWeight: FontWeight.bold)),
                            SizedBox(height: MediaQuery.of(context).size.width*0.03,child: Center(),),
                            Text("Warehouse S01, Ras Al Khor 2",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 19,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("Dubai, United Arab Emirates",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 19,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("04 333 5843",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 19,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("+971 54 204 6700",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 19,
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
                                  fontSize: 21,
                                  color: Colors.white,fontWeight: FontWeight.bold),maxLines: 1,),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            Container(
                                width: MediaQuery.of(context).size.width*0.2,
                                height: 65,
                                child: TextField(
                                  controller: homeController.subscribeEmail,
                                  style: TextStyle(
                                    fontFamily: "POPPINS",
                                    fontSize: 21,
                                  ),
                                  textAlignVertical: TextAlignVertical.bottom,
                                  decoration:  InputDecoration(
                                    hintText: App_Localization.of(context).translate("footer4_content_email"),
                                    hintStyle: TextStyle(color: Colors.grey,
                                        fontFamily: "POPPINS",
                                        fontSize: 21),
                                    fillColor: Colors.white.withOpacity(0.9),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: homeController.subscribeEmail.text.isEmpty
                                          && homeController.clickSubscribe.isTrue ?
                                      Colors.red : Colors.transparent,width: 3.3),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: homeController.subscribeEmail.text.isEmpty
                                          && homeController.clickSubscribe.isTrue ?
                                      Colors.red : Colors.transparent,width: 3.3),
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            GestureDetector(
                              onTap: () {
                                homeController.Subscribe(context, homeController.subscribeEmail.text);
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                                  width: MediaQuery.of(context).size.width*0.14,
                                  decoration: BoxDecoration(
                                      color: primery,
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(14),
                                        child: Text(App_Localization.of(context).translate("footer4_content_subscribe").toUpperCase(),
                                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                                            fontFamily: "POPPINS",
                                            fontSize: 21,
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
                                fontSize: 18,
                                color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.normal)) : Center(),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            Text(App_Localization.of(context).translate("become_our_friends") + "!",style:
                            TextStyle(
                                fontFamily: "POPPINS",
                                fontSize: 21,
                                color: Colors.white,fontWeight: FontWeight.w500)),
                            SizedBox(height: 10,child: Center(),),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    String facebook = 'https://www.facebook.com/thebarkley.ae';
                                    launchUrl(Uri.parse(facebook));
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
                                    String istagram = 'https://www.instagram.com/thebarkley.ae/';
                                    launchUrl(Uri.parse(istagram));
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
                                    String tiktok = 'https://www.tiktok.com/@bk9.ae';
                                    launchUrl(Uri.parse(tiktok));
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/tiktok.svg",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    String youtube = 'https://www.youtube.com/channel/UCbo7v4tCiUVIfptpWqTGg-A';
                                    launchUrl(Uri.parse(youtube));
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/youtube.svg",
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
      height: MediaQuery.of(context).size.width > 2050 ? MediaQuery.of(context).size.width * 0.21 :
      MediaQuery.of(context).size.width * 0.23,
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    height: MediaQuery.of(context).size.width*0.3,
                    child: GoogleMap(
                      zoomGesturesEnabled: false,
                      zoomControlsEnabled: false,
                      onMapCreated: homeController.onMapCreated,
                      markers: homeController.marker,
                      initialCameraPosition: homeController.initialCameraPosition,
                    ),
                  ),),
                Positioned(
                    top : (MediaQuery.of(context).size.width*0.06) - 15,
                    left: (MediaQuery.of(context).size.width * 0.25) - 33,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          color: purple,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("The Barckly",style: TextStyle(fontSize: 19,color: Colors.white)),
                              Text("Main Office",style: TextStyle(fontSize: 17,color: Colors.white))
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on,size: 45,color: purple,),
                        ),
                      ],
                    )
                ),
                GestureDetector(
                  onTap: (){
                    homeController.openMap(latitude, longitude);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width*0.3,
                    color: Colors.transparent,
                  ),
                ),
              ],
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
                                    fontSize: 19,
                                    color: Colors.white,fontWeight: FontWeight.bold)),
                            SizedBox(height: MediaQuery.of(context).size.width*0.03,child: Center(),),
                            Text("Warehouse S01, Ras Al Khor 2",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 17,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("Dubai, United Arab Emirates",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 17,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("04 333 5843",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 17,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("+971 54 204 6700",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 17,
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
                                  fontSize: 19,
                                  color: Colors.white,fontWeight: FontWeight.bold),maxLines: 1,),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            Container(
                                width: MediaQuery.of(context).size.width*0.2,
                                height: 60,
                                child: TextField(
                                  controller: homeController.subscribeEmail,
                                  style: TextStyle(
                                    fontFamily: "POPPINS",
                                    fontSize: 19,
                                  ),
                                  textAlignVertical: TextAlignVertical.bottom,
                                  decoration:  InputDecoration(
                                    hintText: App_Localization.of(context).translate("footer4_content_email"),
                                    hintStyle: TextStyle(color: Colors.grey,
                                        fontFamily: "POPPINS",
                                        fontSize: 19),
                                    fillColor: Colors.white.withOpacity(0.9),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: homeController.subscribeEmail.text.isEmpty
                                          && homeController.clickSubscribe.isTrue ?
                                      Colors.red : Colors.transparent,width: 3.3),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: homeController.subscribeEmail.text.isEmpty
                                          && homeController.clickSubscribe.isTrue ?
                                      Colors.red : Colors.transparent,width: 3.3),
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            GestureDetector(
                              onTap: () {
                                homeController.Subscribe(context, homeController.subscribeEmail.text);
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
                                        padding: const EdgeInsets.all(13),
                                        child: Text(App_Localization.of(context).translate("footer4_content_subscribe").toUpperCase(),
                                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                                            fontFamily: "POPPINS",
                                            fontSize: 19,
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
                                fontSize: 16,
                                color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.normal)) : Center(),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            Text(App_Localization.of(context).translate("become_our_friends") + "!",style:
                            TextStyle(
                                fontFamily: "POPPINS",
                                fontSize: 17,
                                color: Colors.white,fontWeight: FontWeight.w500)),
                            SizedBox(height: 10,child: Center(),),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    String facebook = 'https://www.facebook.com/thebarkley.ae';
                                    launchUrl(Uri.parse(facebook));
                                  },
                                  child: Container(
                                    width: 35,
                                    height: 35,
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
                                    String istagram = 'https://www.instagram.com/thebarkley.ae/';
                                    launchUrl(Uri.parse(istagram));
                                  },
                                  child: Container(
                                    width: 35,
                                    height: 35,
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
                                    String tiktok = 'https://www.tiktok.com/@bk9.ae';
                                    launchUrl(Uri.parse(tiktok));
                                  },
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/tiktok.svg",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    String youtube = 'https://www.youtube.com/channel/UCbo7v4tCiUVIfptpWqTGg-A';
                                    launchUrl(Uri.parse(youtube));
                                  },
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/youtube.svg",
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
  static xlarg2Footer(BuildContext context,HomeController homeController){
    return Obx(() => SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width > 1850 ? MediaQuery.of(context).size.width * 0.22 :
      MediaQuery.of(context).size.width * 0.24,
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    height: MediaQuery.of(context).size.width*0.3,
                    child: GoogleMap(
                      zoomGesturesEnabled: false,
                      zoomControlsEnabled: false,
                      onMapCreated: homeController.onMapCreated,
                      markers: homeController.marker,
                      initialCameraPosition: homeController.initialCameraPosition,
                    ),
                  ),),
                Positioned(
                    top : (MediaQuery.of(context).size.width*0.06) - 15,
                    left: (MediaQuery.of(context).size.width * 0.25) - 33,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          color: purple,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("The Barckly",style: TextStyle(fontSize: 17,color: Colors.white)),
                              Text("Main Office",style: TextStyle(fontSize: 15,color: Colors.white))
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on,size: 45,color: purple,),
                        ),
                      ],
                    )
                ),
                GestureDetector(
                  onTap: (){
                    homeController.openMap(latitude, longitude);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width*0.3,
                    color: Colors.transparent,
                  ),
                ),
              ],
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
                                    fontSize: 17,
                                    color: Colors.white,fontWeight: FontWeight.bold)),
                            SizedBox(height: MediaQuery.of(context).size.width*0.03,child: Center(),),
                            Text("Warehouse S01, Ras Al Khor 2",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 15,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("Dubai, United Arab Emirates",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 15,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("04 333 5843",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 15,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("+971 54 204 6700",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 15,
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
                                  fontSize: 17,
                                  color: Colors.white,fontWeight: FontWeight.bold),maxLines: 1,),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            Container(
                                width: MediaQuery.of(context).size.width*0.2,
                                height: 55,
                                child: TextField(
                                  controller: homeController.subscribeEmail,
                                  style: TextStyle(
                                    fontFamily: "POPPINS",
                                    fontSize: 17,
                                  ),
                                  textAlignVertical: TextAlignVertical.bottom,
                                  decoration:  InputDecoration(
                                    hintText: App_Localization.of(context).translate("footer4_content_email"),
                                    hintStyle: TextStyle(color: Colors.grey,
                                        fontFamily: "POPPINS",
                                        fontSize: 17),
                                    fillColor: Colors.white.withOpacity(0.9),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: homeController.subscribeEmail.text.isEmpty
                                          && homeController.clickSubscribe.isTrue ?
                                      Colors.red : Colors.transparent,width: 3.3),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: homeController.subscribeEmail.text.isEmpty
                                          && homeController.clickSubscribe.isTrue ?
                                      Colors.red : Colors.transparent,width: 3.3),
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            GestureDetector(
                              onTap: () {
                                homeController.Subscribe(context, homeController.subscribeEmail.text);
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
                                            fontSize: 17,
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
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.normal)) : Center(),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            Text(App_Localization.of(context).translate("become_our_friends") + "!",style:
                            TextStyle(
                                fontFamily: "POPPINS",
                                fontSize: 15,
                                color: Colors.white,fontWeight: FontWeight.w500)),
                            SizedBox(height: 10,child: Center(),),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    String facebook = 'https://www.facebook.com/thebarkley.ae';
                                    launchUrl(Uri.parse(facebook));
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
                                    String istagram = 'https://www.instagram.com/thebarkley.ae/';
                                    launchUrl(Uri.parse(istagram));
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
                                    String tiktok = 'https://www.tiktok.com/@bk9.ae';
                                    launchUrl(Uri.parse(tiktok));
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/tiktok.svg",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    String youtube = 'https://www.youtube.com/channel/UCbo7v4tCiUVIfptpWqTGg-A';
                                    launchUrl(Uri.parse(youtube));
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/youtube.svg",
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
      height: MediaQuery.of(context).size.width > 1450 ? MediaQuery.of(context).size.width * 0.22 :
      MediaQuery.of(context).size.width * 0.25,
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width*0.3,
                  child: GoogleMap(
                    zoomGesturesEnabled: false,
                    zoomControlsEnabled: false,
                    onMapCreated: homeController.onMapCreated,
                    markers: homeController.marker,
                    initialCameraPosition: homeController.initialCameraPosition,
                  ),
                ),
                Positioned(
                    top : (MediaQuery.of(context).size.width*0.06) - 14,
                    left: (MediaQuery.of(context).size.width * 0.25) - 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          color: purple,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("The Barckly",style: TextStyle(fontSize: 15,color: Colors.white)),
                              Text("Main Office",style: TextStyle(fontSize: 12,color: Colors.white))
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on,size: 40,color: purple,),
                        ),
                      ],
                    )
                ),
                GestureDetector(
                  onTap: (){
                    homeController.openMap(latitude, longitude);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width*0.3,
                    // width: 500,
                    color: Colors.transparent,
                  ),
                ),
              ],
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
                                    fontSize: 15,
                                    color: Colors.white,fontWeight: FontWeight.bold)),
                            SizedBox(height: MediaQuery.of(context).size.width*0.05/2,child: Center(),),
                            Text("Warehouse S01, Ras Al Khor 2",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 13,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("Dubai, United Arab Emirates",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 13,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("04 333 5843",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 13,
                                  color: Colors.white.withOpacity(0.7),fontWeight: FontWeight.normal),maxLines: 10,),
                            SizedBox(height: 10,child: Center(),),
                            Text("+971 54 204 6700",
                              style: TextStyle(
                                  fontFamily: "POPPINS",
                                  fontSize: 13,
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
                                  fontSize: 15,
                                  color: Colors.white,fontWeight: FontWeight.bold),maxLines: 1,),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            Container(
                                width: MediaQuery.of(context).size.width*0.2,
                                height: 45,
                                child: TextField(
                                  controller: homeController.subscribeEmail,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "POPPINS",
                                  ),
                                  textAlignVertical: TextAlignVertical.bottom,
                                  decoration:  InputDecoration(
                                    hintText: App_Localization.of(context).translate("footer4_content_email"),
                                    hintStyle: TextStyle(color: Colors.grey,
                                        fontFamily: "POPPINS",
                                      fontSize: 15),
                                    fillColor: Colors.white.withOpacity(0.9),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: homeController.subscribeEmail.text.isEmpty
                                          && homeController.clickSubscribe.isTrue ?
                                      Colors.red : Colors.transparent,width: 3.3),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: homeController.subscribeEmail.text.isEmpty
                                          && homeController.clickSubscribe.isTrue ?
                                      Colors.red : Colors.transparent,width: 3.3),
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            GestureDetector(
                              onTap: () {
                                homeController.Subscribe(context, homeController.subscribeEmail.text);
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
                                        padding: const EdgeInsets.all(8),
                                        child: Text(App_Localization.of(context).translate("footer4_content_subscribe").toUpperCase(),
                                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                                            fontFamily: "POPPINS",
                                            fontSize: 15,
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
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.normal)) : Center(),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            Text(App_Localization.of(context).translate("become_our_friends") + "!",style:
                            TextStyle(
                                fontFamily: "POPPINS",
                                fontSize: 13,
                                color: Colors.white,fontWeight: FontWeight.normal)),
                            SizedBox(height: 10,child: Center(),),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    String facebook = 'https://www.facebook.com/thebarkley.ae';
                                    launchUrl(Uri.parse(facebook));
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
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    String istagram = 'https://www.instagram.com/thebarkley.ae/';
                                    launchUrl(Uri.parse(istagram));
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
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    String tiktok = 'https://www.tiktok.com/@bk9.ae';
                                    launchUrl(Uri.parse(tiktok));
                                  },
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/tiktok.svg",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    String youtube = 'https://www.youtube.com/channel/UCbo7v4tCiUVIfptpWqTGg-A';
                                    launchUrl(Uri.parse(youtube));
                                  },
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/youtube.svg",
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
  static large2Footer(BuildContext context,HomeController homeController){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.width > 1250 ? MediaQuery.of(context).size.width * 0.21 :
      MediaQuery.of(context).size.width * 0.25,
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width*0.3,
                  child: GoogleMap(
                    zoomGesturesEnabled: false,
                    zoomControlsEnabled: false,
                    onMapCreated: homeController.onMapCreated,
                    markers: homeController.marker,
                    initialCameraPosition: homeController.initialCameraPosition,
                  ),
                ),
                Positioned(
                    top : (MediaQuery.of(context).size.width*0.06) - 20,
                    left: (MediaQuery.of(context).size.width * 0.25) - 25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          color: purple,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("The Barckly",style: TextStyle(fontSize: 12,color: Colors.white)),
                              Text("Main Office",style: TextStyle(fontSize: 10,color: Colors.white))
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on,size: 35,color: purple,),
                        ),
                      ],
                    )
                ),
                GestureDetector(
                  onTap: (){
                    homeController.openMap(latitude, longitude);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width*0.3,
                    // width: 500,
                    color: Colors.transparent,
                  ),
                ),
              ],
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
                                child: TextField(
                                  controller: homeController.subscribeEmail,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  style: TextStyle(
                                      fontFamily: "POPPINS",
                                      fontSize: 12),
                                  decoration:  InputDecoration(
                                    hintText: App_Localization.of(context).translate("footer4_content_email"),
                                    hintStyle: TextStyle(color: Colors.grey,fontSize: 12, fontFamily: "POPPINS",),
                                    fillColor: Colors.white.withOpacity(0.9),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: homeController.subscribeEmail.text.isEmpty
                                          && homeController.clickSubscribe.isTrue ?
                                      Colors.red : Colors.transparent,width: 2.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: homeController.subscribeEmail.text.isEmpty
                                          && homeController.clickSubscribe.isTrue ?
                                      Colors.red : Colors.transparent,width: 2.5),
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: 10,child: Center(),),
                            GestureDetector(
                              onTap: () {
                                homeController.Subscribe(context, homeController.subscribeEmail.text);
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
                            TextStyle(fontSize: 9,fontFamily: "POPPINS",color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.normal)) : Center(),
                            SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                            Text(App_Localization.of(context).translate("become_our_friends")+"!",style:
                            TextStyle(fontSize: 10,fontFamily: "POPPINS",color: Colors.white,fontWeight: FontWeight.normal)),
                            SizedBox(height: 5,child: Center(),),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    String facebook = 'https://www.facebook.com/thebarkley.ae';
                                    launchUrl(Uri.parse(facebook));
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
                                    String istagram = 'https://www.instagram.com/thebarkley.ae/';
                                    launchUrl(Uri.parse(istagram));
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
                                    String tiktok = 'https://www.tiktok.com/@bk9.ae';
                                    launchUrl(Uri.parse(tiktok));
                                  },
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/tiktok.svg",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () {
                                    String youtube = 'https://www.youtube.com/channel/UCbo7v4tCiUVIfptpWqTGg-A';
                                    launchUrl(Uri.parse(youtube));
                                  },
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: SvgPicture.asset("assets/socialMedia/youtube.svg",
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
  static bigFooter(BuildContext context,HomeController homeController){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width > 850 ? MediaQuery.of(context).size.width * 0.23:
      MediaQuery.of(context).size.width * 0.29,
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width*0.3,
                  child: GoogleMap(
                    zoomGesturesEnabled: false,
                    zoomControlsEnabled: false,
                    onMapCreated: homeController.onMapCreated,
                    markers: homeController.marker,
                    initialCameraPosition: homeController.initialCameraPosition,
                  ),
                ),
                Positioned(
                    top : (MediaQuery.of(context).size.width*0.06) - 20,
                    left: (MediaQuery.of(context).size.width * 0.25) - 25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          color: purple,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("The Barckly",style: TextStyle(fontSize: 10,color: Colors.white)),
                              Text("Main Office",style: TextStyle(fontSize: 8,color: Colors.white))
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on,size: 30,color: purple,),
                        ),
                      ],
                    )
                ),
                GestureDetector(
                  onTap: (){
                    homeController.openMap(latitude, longitude);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width*0.3,
                    // width: 500,
                    color: Colors.transparent,
                  ),
                ),
              ],
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
                              child: TextField(
                                controller: homeController.subscribeEmail,
                                textAlignVertical: TextAlignVertical.bottom,
                                style: TextStyle(
                                    fontFamily: "POPPINS",
                                    fontSize: 10),
                                decoration:  InputDecoration(
                                  hintText: App_Localization.of(context).translate("footer4_content_email"),
                                  hintStyle: TextStyle(
                                      fontFamily: "POPPINS",
                                      color: Colors.grey,fontSize: 10),
                                  fillColor: Colors.white.withOpacity(0.9),
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: homeController.subscribeEmail.text.isEmpty
                                        && homeController.clickSubscribe.isTrue ?
                                    Colors.red : Colors.transparent,width: 2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: homeController.subscribeEmail.text.isEmpty
                                        && homeController.clickSubscribe.isTrue ?
                                    Colors.red : Colors.transparent,width: 2),
                                  ),
                                ),
                              )
                          ),
                          SizedBox(height: 10,child: Center(),),
                          GestureDetector(
                            onTap: () {
                              homeController.Subscribe(context, homeController.subscribeEmail.text);
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
                          TextStyle(fontFamily: "POPPINS",fontSize: 8,color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.normal)): Center(),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,child: Center(),),
                          Text(App_Localization.of(context).translate("become_our_friends") + "!",style:
                          TextStyle(fontFamily: "POPPINS",fontSize: 8,color: Colors.white,fontWeight: FontWeight.normal)),
                          SizedBox(height: 5,child: Center(),),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  String facebook = 'https://www.facebook.com/thebarkley.ae';
                                  launchUrl(Uri.parse(facebook));
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
                                  String istagram = 'https://www.instagram.com/thebarkley.ae/';
                                  launchUrl(Uri.parse(istagram));
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
                                  String tiktok = 'https://www.tiktok.com/@bk9.ae';
                                  launchUrl(Uri.parse(tiktok));
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: SvgPicture.asset("assets/socialMedia/tiktok.svg",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 3),
                              GestureDetector(
                                onTap: () {
                                  String youtube = 'https://www.youtube.com/channel/UCbo7v4tCiUVIfptpWqTGg-A';
                                  launchUrl(Uri.parse(youtube));
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: SvgPicture.asset("assets/socialMedia/youtube.svg",
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

  //////////////////////// LanguageBarHome ////////////////////////
  static languageBarHome(BuildContext context,HomeController homeController) {
    return MediaQuery.of(context).size.width>App.extra?extraLanguageBarHome(context,homeController) :
    MediaQuery.of(context).size.width>App.extra2?extra2LanguageBarHome(context,homeController) :
    MediaQuery.of(context).size.width>App.xLarge?xLargeLanguageBarHome(context,homeController) :
    MediaQuery.of(context).size.width>App.xLarge2?xLarge2LanguageBarHome(context,homeController) :
    MediaQuery.of(context).size.width>App.larg?largeLanguageBarHome(context,homeController) :
    MediaQuery.of(context).size.width>App.larg2 ? large2LanguageBarHome(context,homeController) :
    bigLanguageBarHome(context,homeController);
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
                SvgPicture.asset("assets/image/Icon_AED.svg",
                    width: 35, height: 35),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    fontFamily: "POPPINS"
                ),),
                SizedBox(width: 10,),
                Text("(UAE "+App_Localization.of(context).translate("dirham")+")",style: TextStyle(
                    fontSize: 21,
                    fontFamily: "POPPINS"
                ),)
              ],
            ),
          ),
        )
      ],
    ) : Center();
  }
  static extra2LanguageBarHome(BuildContext context,HomeController homeController) {
    return homeController.openCountry.value == true ?
    Column(
      children: [
        SizedBox(height: 50),
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Row(
              children: [
                SvgPicture.asset("assets/image/Icon_AED.svg",
                    width: 30, height: 30),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    fontFamily: "POPPINS"
                ),),
                SizedBox(width: 10,),
                Text("(UAE "+App_Localization.of(context).translate("dirham")+")",style: TextStyle(
                    fontSize: 19,
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
    return homeController.openCountry.value == true ?
    Column(
      children: [
        SizedBox(height: 45),
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(11),
            child: Row(
              children: [
                SvgPicture.asset("assets/image/Icon_AED.svg",
                    width: 25, height: 25),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    fontFamily: "POPPINS"
                ),),
                SizedBox(width: 10,),
                Text("(UAE "+App_Localization.of(context).translate("dirham")+")",style: TextStyle(
                    fontSize: 17,
                    fontFamily: "POPPINS"
                ),)
              ],
            ),
          ),
        )
      ],
    ) : Center();
  }
  static xLarge2LanguageBarHome(BuildContext context,HomeController homeController) {
    return homeController.openCountry.value ==true ?
    Column(
      children: [
        SizedBox(height: 40),
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: Row(
              children: [
                SvgPicture.asset("assets/image/Icon_AED.svg",
                    width: 20, height: 20),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: "POPPINS"
                ),),
                SizedBox(width: 10,),
                Text("(UAE "+App_Localization.of(context).translate("dirham")+")",style: TextStyle(
                    fontSize: 15,
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
            padding: const EdgeInsets.all(7),
            child: Row(
              children: [
                SvgPicture.asset("assets/image/Icon_AED.svg",
                    width: 15, height: 15),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: "POPPINS"
                ),),
                SizedBox(width: 10,),
                Text("(UAE "+App_Localization.of(context).translate("dirham")+")",style: TextStyle(
                    fontSize: 13,
                    fontFamily: "POPPINS"
                ),)
              ],
            ),
          ),
        )
      ],
    ) : Center();
  }
  static large2LanguageBarHome(BuildContext context,HomeController homeController) {
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
                SvgPicture.asset("assets/image/Icon_AED.svg",
                    width: 10, height: 10),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: "POPPINS"
                ),),
                SizedBox(width: 10,),
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
  static bigLanguageBarHome(BuildContext context,HomeController homeController) {
    return homeController.openCountry.value ==true ?
    Column(
      children: [
        SizedBox(height: 25),
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Row(
              children: [
                SvgPicture.asset("assets/image/Icon_AED.svg",
                    width: 10, height: 10),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    fontFamily: "POPPINS"
                ),),
                SizedBox(width: 10,),
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

  //////////////////////// copyrights ////////////////////////
  static copyrights(BuildContext context,double height,double fontSize) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("© 2022 by The Barkley Pet Camp",
              style: TextStyle(
                  fontFamily: "POPPINS",
                  fontSize: fontSize)),
        ],
      ),
    );
  }

  //////////////////////// Rates ////////////////////////
  static ratesTable(String data,BuildContext context,double width,double tdSize,double thSize){
    return Html(data:data,
        style: {
          "table":Style(
            width: width,
          ),
          "td":Style(
              textAlign: TextAlign.left,
              padding: EdgeInsets.all(10),
              width: width/3,
              color: Colors.black,
              fontSize: FontSize(tdSize),
              fontFamily: "POPPINS",
              border: Border.all(width: 0.5,color: Colors.grey.withOpacity(0.5))
          ),
          "th":Style(
              textAlign: TextAlign.left,
              padding: EdgeInsets.all(10),
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


  //////////////////////// LanguageBarShop ////////////////////////
  static languageBarShop(BuildContext context,ShopController shopController) {
    return MediaQuery.of(context).size.width>App.extra?extraLanguageBarShop(context,shopController) :
    MediaQuery.of(context).size.width>App.extra2?extra2LanguageBarShop(context,shopController) :
    MediaQuery.of(context).size.width>App.xLarge?xLargeLanguageBarShop(context,shopController) :
    MediaQuery.of(context).size.width>App.xLarge2?xLarge2LanguageBarShop(context,shopController) :
    MediaQuery.of(context).size.width>App.larg?largeLanguageBarShop(context,shopController) :
    MediaQuery.of(context).size.width>App.larg2 ? large2LanguageBarShop(context,shopController) :
    bigLanguageBarShop(context,shopController);
  }
  static extraLanguageBarShop(BuildContext context,ShopController shopController) {
    return shopController.openCountry.value == true ?
    Column(
      children: [
        SizedBox(height: 55),
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                SvgPicture.asset("assets/image/Icon_AED.svg",
                    width: 35, height: 35),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    fontFamily: "POPPINS"
                ),),
                SizedBox(width: 10,),
                Text("(UAE "+App_Localization.of(context).translate("dirham")+")",style: TextStyle(
                    fontSize: 21,
                    fontFamily: "POPPINS"
                ),)
              ],
            ),
          ),
        )
      ],
    ) : Center();
  }
  static extra2LanguageBarShop(BuildContext context,ShopController shopController) {
    return shopController.openCountry.value == true ?
    Column(
      children: [
        SizedBox(height: 50),
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Row(
              children: [
                SvgPicture.asset("assets/image/Icon_AED.svg",
                    width: 30, height: 30),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    fontFamily: "POPPINS"
                ),),
                SizedBox(width: 10,),
                Text("(UAE "+App_Localization.of(context).translate("dirham")+")",style: TextStyle(
                    fontSize: 19,
                    fontFamily: "POPPINS"
                ),)
              ],
            ),
          ),
        )
      ],
    ) : Center();
  }
  static xLargeLanguageBarShop(BuildContext context,ShopController shopController) {
    return shopController.openCountry.value == true ?
    Column(
      children: [
        SizedBox(height: 45),
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(11),
            child: Row(
              children: [
                SvgPicture.asset("assets/image/Icon_AED.svg",
                    width: 25, height: 25),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    fontFamily: "POPPINS"
                ),),
                SizedBox(width: 10,),
                Text("(UAE "+App_Localization.of(context).translate("dirham")+")",style: TextStyle(
                    fontSize: 17,
                    fontFamily: "POPPINS"
                ),)
              ],
            ),
          ),
        )
      ],
    ) : Center();
  }
  static xLarge2LanguageBarShop(BuildContext context,ShopController shopController) {
    return shopController.openCountry.value ==true ?
    Column(
      children: [
        SizedBox(height: 40),
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: Row(
              children: [
                SvgPicture.asset("assets/image/Icon_AED.svg",
                    width: 20, height: 20),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: "POPPINS"
                ),),
                SizedBox(width: 10,),
                Text("(UAE "+App_Localization.of(context).translate("dirham")+")",style: TextStyle(
                    fontSize: 15,
                    fontFamily: "POPPINS"
                ),)
              ],
            ),
          ),
        )
      ],
    ) : Center();
  }
  static largeLanguageBarShop(BuildContext context,ShopController shopController) {
    return shopController.openCountry.value == true ?
    Column(
      children: [
        SizedBox(height: 35),
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: Row(
              children: [
                SvgPicture.asset("assets/image/Icon_AED.svg",
                    width: 15, height: 15),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: "POPPINS"
                ),),
                SizedBox(width: 10,),
                Text("(UAE "+App_Localization.of(context).translate("dirham")+")",style: TextStyle(
                    fontSize: 13,
                    fontFamily: "POPPINS"
                ),)
              ],
            ),
          ),
        )
      ],
    ) : Center();
  }
  static large2LanguageBarShop(BuildContext context,ShopController shopController) {
    return shopController.openCountry.value ==true ?
    Column(
      children: [
        SizedBox(height: 30),
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                SvgPicture.asset("assets/image/Icon_AED.svg",
                    width: 10, height: 10),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: "POPPINS"
                ),),
                SizedBox(width: 10,),
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
  static bigLanguageBarShop(BuildContext context,ShopController shopController) {
    return shopController.openCountry.value ==true ?
    Column(
      children: [
        SizedBox(height: 25),
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Row(
              children: [
                SvgPicture.asset("assets/image/Icon_AED.svg",
                    width: 10, height: 10),
                SizedBox(width: 5),
                Text(App_Localization.of(context).translate("uae"),style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    fontFamily: "POPPINS"
                ),),
                SizedBox(width: 10,),
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

}