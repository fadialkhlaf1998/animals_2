import 'package:animals/app_localization.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_widget/zoom_widget.dart';

class About extends StatelessWidget {
  final HomeController homeController = Get.find();
  final GlobalKey<ScaffoldState> myKey = GlobalKey();

  About({Key? key}) : super(key: key);

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
                  child:  MediaQuery.of(context).size.width>App.extra?extraWidget(context) :
                  MediaQuery.of(context).size.width>App.xLarge?xLargeWidget(context) :
                  MediaQuery.of(context).size.width>App.larg?lgWidget(context)
                  :MediaQuery.of(context).size.width>App.big?bgWidget(context)
                  : mdWidget(context)

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

  extraWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.13),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(homeController.aboutPage!.image!),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.2,
                  child: Center(
                      child: Text(App_Localization.of(context).translate("about_us").toUpperCase(),
                          style: const TextStyle(
                              color: App.primery,
                              fontFamily: "FOUNDRYGRIDNIK",
                              fontSize:70,
                              fontWeight: FontWeight.bold),maxLines: 1)
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![0].data,
                          style: TextStyle(color: App.auto,
                            height: 1.5,
                            fontFamily: "POPPINS",
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![1].data,
                            style: TextStyle(color: App.auto,
                              fontSize: 25,
                              height: 1.5,
                              fontFamily: "POPPINS",
                            ),textAlign: TextAlign.justify),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![2].data,
                            style: TextStyle(color: App.auto,
                              fontSize: 25,
                              height: 1.5,
                              fontFamily: "POPPINS",
                            ),textAlign: TextAlign.justify),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("© 2022 by The Barkley Pet Camp",
                    style: TextStyle(
                        fontFamily: "POPPINS",
                        fontSize: 20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
  xLargeWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.12),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(homeController.aboutPage!.image!),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.2,
                  child: Center(
                      child: Text(App_Localization.of(context).translate("about_us").toUpperCase(),
                          style: const TextStyle(
                              color: App.primery,
                              fontFamily: "FOUNDRYGRIDNIK",
                              fontSize:60,
                              fontWeight: FontWeight.bold),maxLines: 1)
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![0].data,
                          style: TextStyle(color: App.auto,
                            height: 1.5,
                            fontFamily: "POPPINS",
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![1].data,
                            style: TextStyle(color: App.auto,
                              fontSize: 20,
                              height: 1.5,
                              fontFamily: "POPPINS",
                            ),textAlign: TextAlign.justify),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![2].data,
                            style: TextStyle(color: App.auto,
                              fontSize: 20,
                              height: 1.5,
                              fontFamily: "POPPINS",
                            ),textAlign: TextAlign.justify),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("© 2022 by The Barkley Pet Camp",
                    style: TextStyle(
                        fontFamily: "POPPINS",
                        fontSize: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }
  lgWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.12),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width*0.4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(homeController.aboutPage!.image!),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.2,
                  child: Center(
                      child: Text(App_Localization.of(context).translate("about_us").toUpperCase(),
                          style: const TextStyle(
                              color: App.primery,
                              fontFamily: "FOUNDRYGRIDNIK",
                              fontSize:50,
                              fontWeight: FontWeight.bold),maxLines: 1)
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![0].data,
                            style: TextStyle(color: App.auto,
                              height: 1.5,
                              fontFamily: "POPPINS",
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![1].data,
                            style: TextStyle(color: App.auto,
                                fontSize: 16,
                                height: 1.5,
                              fontFamily: "POPPINS",
                            ),textAlign: TextAlign.justify),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![2].data,
                            style: TextStyle(color: App.auto,
                                fontSize: 16,
                                height: 1.5,
                              fontFamily: "POPPINS",
                            ),textAlign: TextAlign.justify),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("© 2022 by The Barkley Pet Camp",
                    style: TextStyle(
                        fontFamily: "POPPINS",
                        fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }
  bgWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width *0.13),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width*0.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(homeController.aboutPage!.image!),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.2,
                  child: Center(
                      child: Text(App_Localization.of(context).translate("about_us").toUpperCase(),
                          style: const TextStyle(
                              color: App.primery,
                              fontFamily: "FOUNDRYGRIDNIK",
                              fontSize:35,
                              fontWeight: FontWeight.bold),maxLines: 1)
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![0].data,
                          style: TextStyle(color: App.auto,fontSize: 12,
                              height: 1.5,
                            fontFamily: "POPPINS",
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![1].data,
                            style: TextStyle(color: App.auto,fontSize: 12,
                                height: 1.5,
                              fontFamily: "POPPINS",
                            ),textAlign: TextAlign.justify),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![2].data,
                            style: TextStyle(color: App.auto,fontSize: 12,
                                height: 1.5,
                              fontFamily: "POPPINS",
                            ),textAlign: TextAlign.justify),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("© 2022 by The Barkley Pet Camp",
                    style: TextStyle(
                        fontFamily: "POPPINS",
                        fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
  mdWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.15),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width*0.6,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(homeController.aboutPage!.image!),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.15,
                  child: Center(
                      child: Text(App_Localization.of(context).translate("about_us").toUpperCase(),
                          style: const TextStyle(
                              fontFamily: "FOUNDRYGRIDNIK",
                              color: App.primery,fontSize:20,
                              fontWeight: FontWeight.bold),maxLines: 1)
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![0].data,
                          style: TextStyle(color: App.auto,fontSize: 10,
                              fontFamily: "POPPINS",
                              height: 1.5
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![1].data,
                            style: TextStyle(color: App.auto,fontSize: 10,
                                fontFamily: "POPPINS",
                                height: 1.5
                            ),textAlign: TextAlign.justify),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![2].data,
                            style: TextStyle(color: App.auto,fontSize: 10,
                                fontFamily: "POPPINS",
                                height: 1.5
                            ),textAlign: TextAlign.justify),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.04),
          App.footer(context,homeController),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("© 2022 by The Barkley Pet Camp",
                    style: TextStyle(
                        fontFamily: "POPPINS",
                        fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
