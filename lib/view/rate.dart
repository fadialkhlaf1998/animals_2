import 'package:animals/helper/app.dart';
import 'package:animals/model/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animals/app_localization.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:zoom_widget/zoom_widget.dart';

class Rate extends StatelessWidget {
  Rate({Key? key}) : super(key: key);

  final HomeController homeController = Get.find();
  final GlobalKey<ScaffoldState> myKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: myKey,
      // endDrawer: App.myDrawer(context, homeController,myKey),
      body: RefreshIndicator(
        onRefresh: () async {
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
                  child: MediaQuery.of(context).size.width>App.extra ? extraWidget(context) :
                  MediaQuery.of(context).size.width>App.xLarge ? xlargeWidget(context) :
                  MediaQuery.of(context).size.width>App.larg ? largeWidget(context)
                      : MediaQuery.of(context).size.width>App.big ? bigWidget(context)
                      : medWidget(context)
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
  //************************ Extra ************************
  extraWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.13),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.3,
                      height: MediaQuery.of(context).size.height*0.2,
                      child: Center(child: Text(App_Localization.of(context).translate("rates").toUpperCase(),
                          style: const TextStyle(
                              color: App.primery,
                              fontFamily: "FOUNDRYGRIDNIK",
                              fontSize:70,fontWeight: FontWeight.bold),maxLines: 1)),
                    ),
                  ],
                ),
                extraRates(count:1,posts:homeController.service,background: const Color(0xffffffff)),
                SizedBox(height: MediaQuery.of(context).size.width*0.04),
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
  extraRates({required int count, required List<Post> posts, required Color background}) {
    return SizedBox(
      child: ListView.builder(
          itemCount: posts.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Obx(() => Column(
              children: [
                GestureDetector(
                  onTap:(){
                    if(homeController.openServiceIndex.value == index){
                      homeController.openServiceIndex.value = -1;
                    }else{
                      homeController.openServiceIndex.value = index;
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 70,
                    color: homeController.openServiceIndex.value==index ?
                    homeController.service[index].color : Colors.grey[400],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(posts[index].title!, style: TextStyle(
                              color: Colors.white,
                              fontFamily: "POPPINS",
                              fontSize: 25
                          ),),
                          homeController.openServiceIndex.value==index ?
                          Icon(Icons.add , color: Colors.white,size: 40,) :
                          Icon(Icons.remove, color: Colors.white,size: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                AnimatedSize(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.5+16,
                      child: !(homeController.openServiceIndex.value == index)
                          ? Center()
                          :  Center(child: App.ratesTable(posts[index].jsonData!.first.data,
                          context,
                          MediaQuery.of(context).size.width * 0.5,
                          23,
                          25
                      ),)
                  ),
                ),
                SizedBox(height: 10),
              ],
            ));
          }),
    );
  }

  //************************ xLarge ************************
  xlargeWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.12),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.3,
                      height: MediaQuery.of(context).size.height*0.2,
                      child: Center(child: Text(App_Localization.of(context).translate("rates").toUpperCase(),
                          style: const TextStyle(
                              color: App.primery,
                              fontFamily: "FOUNDRYGRIDNIK",
                              fontSize:60,fontWeight: FontWeight.bold),maxLines: 1)),
                    ),
                  ],
                ),
                xlargRates(count:1,posts:homeController.service,background: const Color(0xffffffff)),
                SizedBox(height: MediaQuery.of(context).size.width*0.04),
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
                    style: TextStyle(
                        fontFamily: "POPPINS",
                        fontSize: 15
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
  xlargRates({required int count, required List<Post> posts, required Color background}) {
    return SizedBox(
      child: ListView.builder(
          itemCount: posts.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Obx(() => Column(
              children: [
                GestureDetector(
                  onTap:(){
                    if(homeController.openServiceIndex.value == index){
                      homeController.openServiceIndex.value = -1;
                    }else{
                      homeController.openServiceIndex.value = index;
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 60,
                    color: homeController.openServiceIndex.value==index ?
                    homeController.service[index].color : Colors.grey[400],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(posts[index].title!, style: TextStyle(
                              color: Colors.white,
                              fontFamily: "POPPINS",
                              fontSize: 20
                          ),),
                          homeController.openServiceIndex.value==index ?
                          Icon(Icons.add , color: Colors.white,size: 35,) :
                          Icon(Icons.remove, color: Colors.white,size: 35,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                AnimatedSize(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.5+16,
                      child: !(homeController.openServiceIndex.value == index)
                          ? Center()
                          :  Center(child: App.ratesTable(posts[index].jsonData!.first.data,
                          context,
                          MediaQuery.of(context).size.width * 0.5,
                          18,
                          20
                      ),)
                  ),
                ),
                SizedBox(height: 10),
              ],
            ));
          }),
    );
  }

  //************************ Large ************************
  largeWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.12),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.3,
                      height: MediaQuery.of(context).size.height*0.2,
                      child: Center(child: Text(App_Localization.of(context).translate("rates").toUpperCase(),
                          style: const TextStyle(
                              color: App.primery,
                              fontFamily: "FOUNDRYGRIDNIK",
                              fontSize:50,fontWeight: FontWeight.bold),maxLines: 1)),
                    ),
                  ],
                ),
                largRates(count:1,posts:homeController.service,background: const Color(0xffffffff)),
                SizedBox(height: MediaQuery.of(context).size.width*0.04),
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
  largRates({required int count, required List<Post> posts, required Color background}) {
    return SizedBox(
      child: ListView.builder(
          itemCount: posts.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Obx(() => Column(
              children: [
                GestureDetector(
                  onTap:(){
                    if(homeController.openServiceIndex.value == index){
                      homeController.openServiceIndex.value = -1;
                    }else{
                      homeController.openServiceIndex.value = index;
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 40,
                    color: homeController.openServiceIndex.value==index ?
                    homeController.service[index].color : Colors.grey[400],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(posts[index].title!, style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,fontFamily: "POPPINS",
                          ),),
                          homeController.openServiceIndex.value==index ?
                          Icon(Icons.add , color: Colors.white,size: 25,) :
                          Icon(Icons.remove, color: Colors.white,size: 25,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                AnimatedSize(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.5+16,
                      child: !(homeController.openServiceIndex.value == index)
                          ? Center()
                          :  Center(child: App.ratesTable(posts[index].jsonData!.first.data,
                          context,
                          MediaQuery.of(context).size.width * 0.5,
                          14,
                          16
                      ),)
                  ),
                ),
                SizedBox(height: 10),
              ],
            ));
          }),
    );
  }

  //************************ Big ************************
  bigWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.13),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.2,
                  child: Center(child: Text(App_Localization.of(context).translate("rates").toUpperCase(),
                      style: const TextStyle(
                          fontFamily: "FOUNDRYGRIDNIK",
                          color: App.primery,fontSize:35,fontWeight: FontWeight.bold),maxLines: 1)),
                ),
                bigRates(count:1,posts:homeController.service,background: const Color(0xffffffff)),
                SizedBox(height: MediaQuery.of(context).size.width*0.04),
              ],
            ),
          ),
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
  bigRates({required int count, required List<Post> posts, required Color background}) {
    return SizedBox(
      child: ListView.builder(
          itemCount: posts.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Obx(() => Column(
              children: [
                GestureDetector(
                  onTap:(){
                    if(homeController.openServiceIndex.value == index){
                      homeController.openServiceIndex.value = -1;
                    }else{
                      homeController.openServiceIndex.value = index;
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 35,
                    color: homeController.openServiceIndex.value==index ?
                    homeController.service[index].color : Colors.grey[400],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(posts[index].title!, style: TextStyle(
                              fontFamily: "POPPINS",
                              color: Colors.white,fontSize: 12),),
                          homeController.openServiceIndex.value==index ?
                          Icon(Icons.add , color: Colors.white,size: 20,) :
                          Icon(Icons.remove, color: Colors.white,size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                AnimatedSize(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.6+16,
                      child: !(homeController.openServiceIndex.value == index)
                          ? Center()
                          :  Center(child: App.ratesTable(posts[index].jsonData!.first.data,
                          context,MediaQuery.of(context).size.width * 0.6,10,12),)
                  ),
                ),
                SizedBox(height: 10),
              ],
            ));
          }),
    );}

  //************************ Medium ************************
  medWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.15),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.15,
                  child: Center(child: Text(App_Localization.of(context).translate("rates").toUpperCase(),
                      style: const TextStyle(
                          fontFamily: "FOUNDRYGRIDNIK",
                          color: App.primery,fontSize:20,fontWeight: FontWeight.bold),maxLines: 1)),
                ),
                medRates(count:1,posts:homeController.service,background: const Color(0xffffffff)),
                SizedBox(height: MediaQuery.of(context).size.width*0.04),
              ],
            ),
          ),
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
  medRates({required int count, required List<Post> posts, required Color background}) {
    return SizedBox(
      child: ListView.builder(
          itemCount: posts.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Obx(() => Column(
              children: [
                GestureDetector(
                  onTap:(){
                    if(homeController.openServiceIndex.value == index){
                      homeController.openServiceIndex.value = -1;
                    }else{
                      homeController.openServiceIndex.value = index;
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 30,
                    color: homeController.openServiceIndex.value==index ?
                    homeController.service[index].color : Colors.grey[400],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(posts[index].title!, style: TextStyle(
                              fontFamily: "POPPINS",
                              color: Colors.white,fontSize: 10),),
                          homeController.openServiceIndex.value==index ?
                          Icon(Icons.add , color: Colors.white,size: 18,) :
                          Icon(Icons.remove, color: Colors.white,size: 18,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                AnimatedSize(
                  // vsync: this,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.6+16,
                      child: !(homeController.openServiceIndex.value == index)
                          ? Center()
                          :  Center(child: App.ratesTable(posts[index].jsonData!.first.data,
                          context,MediaQuery.of(context).size.width * 0.6,8,10),)
                  ),
                ),
                SizedBox(height: 10),
              ],
            ));
          }),
    );}

}
