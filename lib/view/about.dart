import 'package:animals/app_localization.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:animals/view/header.dart';
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
                  child: MediaQuery.of(context).size.width>App.extra?extraWidget(context) :
                  MediaQuery.of(context).size.width>App.extra2?extra2Widget(context) :
                  MediaQuery.of(context).size.width>App.xLarge?xLargeWidget(context) :
                  MediaQuery.of(context).size.width>App.xLarge2?xLarge2Widget(context) :
                  MediaQuery.of(context).size.width>App.larg?lgWidget(context) :
                  MediaQuery.of(context).size.width>App.larg2?lg2Widget(context) : bgWidget(context)
                ),
                Positioned(child: Header()),
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(
                            child: Text(App_Localization.of(context).translate("about_us").toUpperCase(),
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
                            fontSize: 23,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![1].data,
                            style: TextStyle(color: App.auto,
                              fontSize: 23,
                              height: 1.5,
                              fontFamily: "POPPINS",
                            ),textAlign: TextAlign.justify),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![2].data,
                            style: TextStyle(color: App.auto,
                              fontSize: 23,
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
          App.copyrights(context, 50, 23),
        ],
      ),
    );
  }
  extra2Widget(BuildContext context){
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(
                            child: Text(App_Localization.of(context).translate("about_us").toUpperCase(),
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
                            fontSize: 21,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![1].data,
                            style: TextStyle(color: App.auto,
                              fontSize: 21,
                              height: 1.5,
                              fontFamily: "POPPINS",
                            ),textAlign: TextAlign.justify),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![2].data,
                            style: TextStyle(color: App.auto,
                              fontSize: 21,
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
          App.copyrights(context,45, 21)
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(
                            child: Text(App_Localization.of(context).translate("about_us").toUpperCase(),
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
                            fontSize: 19,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![1].data,
                            style: TextStyle(color: App.auto,
                              fontSize: 19,
                              height: 1.5,
                              fontFamily: "POPPINS",
                            ),textAlign: TextAlign.justify),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![2].data,
                            style: TextStyle(color: App.auto,
                              fontSize: 19,
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
          App.copyrights(context,40, 19)
        ],
      ),
    );
  }
  xLarge2Widget(BuildContext context){
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(
                            child: Text(App_Localization.of(context).translate("about_us").toUpperCase(),
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
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![1].data,
                            style: TextStyle(color: App.auto,
                              fontSize: 17,
                              height: 1.5,
                              fontFamily: "POPPINS",
                            ),textAlign: TextAlign.justify),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![2].data,
                            style: TextStyle(color: App.auto,
                              fontSize: 17,
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
          App.copyrights(context,35, 17)
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
                  height: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(homeController.aboutPage!.image!),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(
                            child: Text(App_Localization.of(context).translate("about_us").toUpperCase(),
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
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![1].data,
                            style: TextStyle(color: App.auto,
                              fontSize: 15,
                              height: 1.5,
                              fontFamily: "POPPINS",
                            ),textAlign: TextAlign.justify),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![2].data,
                            style: TextStyle(color: App.auto,
                              fontSize: 15,
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
          App.copyrights(context,30, 15)
        ],
      ),
    );
  }
  lg2Widget(BuildContext context){
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(
                            child: Text(App_Localization.of(context).translate("about_us").toUpperCase(),
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
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![1].data,
                            style: TextStyle(color: App.auto,
                              fontSize: 12,
                              height: 1.5,
                              fontFamily: "POPPINS",
                            ),textAlign: TextAlign.justify),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(homeController.aboutPage!.jsonData![2].data,
                            style: TextStyle(color: App.auto,
                              fontSize: 12,
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
          App.copyrights(context,25, 12)
        ],
      ),
    );
  }
  bgWidget(BuildContext context){
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(
                            child: Text(App_Localization.of(context).translate("about_us").toUpperCase(),
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
          App.copyrights(context,20, 10)
        ],
      ),
    );
  }
}
