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
                  child:MediaQuery.of(context).size.width>App.larg?lgWidget(context)
                  :MediaQuery.of(context).size.width>App.big?bgWidget(context)
                  :MediaQuery.of(context).size.width>App.mid?mdWidget(context)
                  :MediaQuery.of(context).size.width>App.small?smWidget(context):xsmWidget(context),
                ),
                Positioned(child: App.header(context, homeController,myKey)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  lgWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.25),
          Container(
            width: MediaQuery.of(context).size.width,
            // color: const Color(0xfff5f5f5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.3,
                        height: MediaQuery.of(context).size.height*0.1,
                        child: Center(child: Text(App_Localization.of(context).translate("our_story"),style: const TextStyle(color: App.green,fontSize:40,fontWeight: FontWeight.bold),maxLines: 1)),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.25,
                          height: MediaQuery.of(context).size.height*0.05,
                          child: Text(homeController.aboutPage!.subTitle!,style: const TextStyle(color: App.primery,fontSize: 25,fontWeight: FontWeight.bold),maxLines: 1),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*0.25,
                                  child: Text(homeController.aboutPage!.jsonData![0].data,style: TextStyle(color: App.auto,fontSize: 14),textAlign: TextAlign.justify),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*0.25,
                                  child: Text(homeController.aboutPage!.jsonData![1].data,style: TextStyle(color: App.auto,fontSize: 14),textAlign: TextAlign.justify),
                                )
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.25,
                              child: Text(homeController.aboutPage!.jsonData![2].data,style: TextStyle(color: App.auto,fontSize: 14),textAlign: TextAlign.justify),
                            )
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    height: MediaQuery.of(context).size.width*0.6/2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(homeController.aboutPage!.image!),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
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
    );
  }
  bgWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.25),
          Container(
            width: MediaQuery.of(context).size.width,
            // color: const Color(0xfff5f5f5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.3,
                        height: MediaQuery.of(context).size.height*0.1,
                        child: Center(child: Text(App_Localization.of(context).translate("our_story"),style: const TextStyle(color: App.green,fontSize:30,fontWeight: FontWeight.bold),maxLines: 1)),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.25,
                          height: MediaQuery.of(context).size.height*0.05,
                          child: Text(homeController.aboutPage!.subTitle!,style: const TextStyle(color: App.primery,fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*0.25,
                                  child: Text(homeController.aboutPage!.jsonData![0].data,style: TextStyle(color: App.auto,fontSize: 12),textAlign: TextAlign.justify),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*0.25,
                                  child: Text(homeController.aboutPage!.jsonData![1].data,style: TextStyle(color: App.auto,fontSize: 12),textAlign: TextAlign.justify),
                                )
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.25,
                              child: Text(homeController.aboutPage!.jsonData![2].data,style: TextStyle(color: App.auto,fontSize: 12),textAlign: TextAlign.justify),
                            )
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    height: MediaQuery.of(context).size.width*0.6/2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(homeController.aboutPage!.image!),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
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
    );
  }
  mdWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.25),
          Container(
            width: MediaQuery.of(context).size.width,
            // color: const Color(0xfff5f5f5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.3,
                        height: MediaQuery.of(context).size.height*0.1,
                        child: Center(child: Text(App_Localization.of(context).translate("our_story"),style: const TextStyle(color: App.green,fontSize:25,fontWeight: FontWeight.bold),maxLines: 1)),
                      ),

                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.25,
                          height: MediaQuery.of(context).size.height*0.05,
                          child: Text(homeController.aboutPage!.subTitle!,style: const TextStyle(color: App.primery,fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*0.25,
                                  child: Text(homeController.aboutPage!.jsonData![0].data,style: TextStyle(color: App.auto,fontSize: 10),textAlign: TextAlign.justify),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*0.25,
                                  child: Text(homeController.aboutPage!.jsonData![1].data,style: TextStyle(color: App.auto,fontSize: 10),textAlign: TextAlign.justify),
                                )
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.25,
                              child: Text(homeController.aboutPage!.jsonData![2].data,style: TextStyle(color: App.auto,fontSize: 10),textAlign: TextAlign.justify),
                            )
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    height: MediaQuery.of(context).size.width*0.6/2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(homeController.aboutPage!.image!),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
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
    );
  }
  smWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1,),
          Container(
            width: MediaQuery.of(context).size.width,
            // color: const Color(0xfff5f5f5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.3,
                        height: MediaQuery.of(context).size.height*0.1,
                        child: Center(child: Text(App_Localization.of(context).translate("our_story"),style: const TextStyle(color: App.green,fontSize:25,fontWeight: FontWeight.bold),maxLines: 1)),
                      ),

                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.6,
                          height: MediaQuery.of(context).size.height*0.05,
                          child: Text(homeController.aboutPage!.subTitle!,style: const TextStyle(color: App.primery,fontSize: 14,fontWeight: FontWeight.bold),),
                        ),

                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.6,
                          child: Text(homeController.aboutPage!.jsonData![0].data,style: TextStyle(color: App.auto,fontSize: 10),textAlign: TextAlign.justify),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.6,
                          child: Text(homeController.aboutPage!.jsonData![1].data,style: TextStyle(color: App.auto,fontSize: 10),textAlign: TextAlign.justify),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.6,
                          child: Text(homeController.aboutPage!.jsonData![2].data,style: TextStyle(color: App.auto,fontSize: 10),textAlign: TextAlign.justify),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    height: MediaQuery.of(context).size.width*0.6/2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(homeController.aboutPage!.image!),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
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
    );
  }
  xsmWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1,),
          Container(
            width: MediaQuery.of(context).size.width,
            // color: const Color(0xfff5f5f5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.6,
                        height: MediaQuery.of(context).size.height*0.1,
                        child: Center(child: Text(App_Localization.of(context).translate("our_story"),style: const TextStyle(color: App.green,fontSize:18,fontWeight: FontWeight.bold),maxLines: 1)),
                      ),

                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.6,
                          child: Text(homeController.aboutPage!.subTitle!,style: const TextStyle(color: App.primery,fontSize: 10,fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.6,
                          child: Text(homeController.aboutPage!.jsonData![0].data,style: TextStyle(color: App.auto,fontSize: 9),textAlign: TextAlign.justify),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.6,
                          child: Text(homeController.aboutPage!.jsonData![1].data,style: TextStyle(color: App.auto,fontSize: 9),textAlign: TextAlign.justify),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.6,
                          child: Text(homeController.aboutPage!.jsonData![2].data,style: TextStyle(color: App.auto,fontSize: 10),textAlign: TextAlign.justify),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    height: MediaQuery.of(context).size.width*0.6/2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(homeController.aboutPage!.image!),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.03,),
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
    );
  }
  bigWidget(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width*0.25,
              height: MediaQuery.of(context).size.height*0.05,
              child: AutoSizeText(homeController.aboutPage!.subTitle!,style: const TextStyle(color: App.primery,fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.justify,minFontSize: 0,stepGranularity: 0.1,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.25,
                      child: AutoSizeText(homeController.aboutPage!.jsonData![0].data,style: TextStyle(color: App.auto,fontSize: 14),textAlign: TextAlign.justify,minFontSize: 0,stepGranularity: 0.1,),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.25,
                      child: AutoSizeText(homeController.aboutPage!.jsonData![1].data,style: TextStyle(color: App.auto,fontSize: 14),textAlign: TextAlign.justify,minFontSize: 0,stepGranularity: 0.1,),
                    )
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.25,
                  child: AutoSizeText(homeController.aboutPage!.jsonData![2].data,style: TextStyle(color: App.auto,fontSize: 14),textAlign: TextAlign.justify,minFontSize: 0,stepGranularity: 0.1,),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width*0.03,),
          ],
        ),
      ),
    );
  }
  smallWidget(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width*0.6,
              height: MediaQuery.of(context).size.height*0.05,
              child: AutoSizeText(homeController.aboutPage!.subTitle!,style: const TextStyle(color: App.primery,fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.justify,minFontSize: 0,stepGranularity: 0.1,maxLines: 1),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: AutoSizeText(homeController.aboutPage!.jsonData![0].data,style: TextStyle(color: App.auto,fontSize: 14),textAlign: TextAlign.justify,minFontSize: 0,stepGranularity: 0.1,),
                ),
                SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: AutoSizeText(homeController.aboutPage!.jsonData![1].data,style: TextStyle(color: App.auto,fontSize: 14),textAlign: TextAlign.justify,minFontSize: 0,stepGranularity: 0.1,),
                ),
                SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: AutoSizeText(homeController.aboutPage!.jsonData![2].data,style: TextStyle(color: App.auto,fontSize: 14),textAlign: TextAlign.justify,minFontSize: 0,stepGranularity: 0.1,),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width*0.03,),
          ],
        ),
      ),
    );
  }
}
