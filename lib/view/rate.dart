import 'package:animals/helper/app.dart';
import 'package:animals/model/post.dart';
import 'package:animals/view/homeHeader.dart';
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
                  MediaQuery.of(context).size.width>App.extra2 ? extra2Widget(context) :
                  MediaQuery.of(context).size.width>App.xLarge ? xlargeWidget(context) :
                  MediaQuery.of(context).size.width>App.xLarge2 ? xlarge2Widget(context) :
                  MediaQuery.of(context).size.width>App.larg ? largeWidget(context) :
                  MediaQuery.of(context).size.width>App.larg2 ? large2Widget(context) :
                  bigWidget(context)
                ),
                // Positioned(child: App.header(context, homeController,myKey)),
                Positioned(child: HomeHeader()),

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
          SizedBox(height: MediaQuery.of(context).size.width*0.14),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(child: Text(App_Localization.of(context).translate("rates").toUpperCase(),
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
                extraRates(count:1,posts:homeController.service,background: const Color(0xffffffff)),
                SizedBox(height: MediaQuery.of(context).size.width*0.04),
              ],
            ),
          ),
          App.footer(context,homeController),
          App.copyrights(context, 50, 23),
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
                              fontSize: 23,
                              letterSpacing: 2
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
                      width: MediaQuery.of(context).size.width * 0.5+20,
                      child: !(homeController.openServiceIndex.value == index)
                          ? Center()
                          :  Center(child: App.ratesTable(posts[index].jsonData!.first.data,
                          context,
                          MediaQuery.of(context).size.width * 0.5, 21, 23
                      ),)
                  ),
                ),
                SizedBox(height: 10),
              ],
            ));
          }),
    );
  }

  //************************ Extra2 ************************
  extra2Widget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.13),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(child: Text(App_Localization.of(context).translate("rates").toUpperCase(),
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
                extra2Rates(count:1,posts:homeController.service,background: const Color(0xffffffff)),
                SizedBox(height: MediaQuery.of(context).size.width*0.04),
              ],
            ),
          ),
          App.footer(context,homeController),
          App.copyrights(context, 45, 21),
        ],
      ),
    );
  }
  extra2Rates({required int count, required List<Post> posts, required Color background}) {
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
                    height: 65,
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
                              fontSize: 21,
                              letterSpacing: 2
                          ),),
                          homeController.openServiceIndex.value==index ?
                          Icon(Icons.add , color: Colors.white,size: 21,) :
                          Icon(Icons.remove, color: Colors.white,size: 21,
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
                      width: MediaQuery.of(context).size.width * 0.5+20,
                      child: !(homeController.openServiceIndex.value == index)
                          ? Center()
                          :  Center(child: App.ratesTable(posts[index].jsonData!.first.data,
                          context,
                          MediaQuery.of(context).size.width * 0.5, 19, 21
                      ),)
                  ),
                ),
                SizedBox(height: 10),
              ],
            ));
          }),
    );
  }

  //************************ xlarge ************************
  xlargeWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.13),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(child: Text(App_Localization.of(context).translate("rates").toUpperCase(),
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
                xlargeRates(count:1,posts:homeController.service,background: const Color(0xffffffff)),
                SizedBox(height: MediaQuery.of(context).size.width*0.04),
              ],
            ),
          ),
          App.footer(context,homeController),
          App.copyrights(context, 40, 19),
        ],
      ),
    );
  }
  xlargeRates({required int count, required List<Post> posts, required Color background}) {
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
                              fontSize: 19,
                              letterSpacing: 2
                          ),),
                          homeController.openServiceIndex.value==index ?
                          Icon(Icons.add , color: Colors.white,size: 19,) :
                          Icon(Icons.remove, color: Colors.white,size: 19,
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
                      width: MediaQuery.of(context).size.width * 0.5+20,
                      child: !(homeController.openServiceIndex.value == index)
                          ? Center()
                          :  Center(child: App.ratesTable(posts[index].jsonData!.first.data,
                          context,
                          MediaQuery.of(context).size.width * 0.5, 17, 19
                      ),)
                  ),
                ),
                SizedBox(height: 10),
              ],
            ));
          }),
    );
  }

  //************************ xlarge2 ************************
  xlarge2Widget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.14),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(child: Text(App_Localization.of(context).translate("rates").toUpperCase(),
                            style: TextStyle(
                                color: App.primery,
                                fontSize: 55,
                                fontWeight: FontWeight.bold,
                                fontFamily: "FOUNDRYGRIDNIK",
                            ))),
                      ),
                    ),
                  ),
                ),
                xlarge2Rates(count:1,posts:homeController.service,background: const Color(0xffffffff)),
                SizedBox(height: MediaQuery.of(context).size.width*0.04),
              ],
            ),
          ),
          App.footer(context,homeController),
          App.copyrights(context, 35, 17),
        ],
      ),
    );
  }
  xlarge2Rates({required int count, required List<Post> posts, required Color background}) {
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
                    height: 55,
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
                              fontSize: 17,
                              letterSpacing: 2
                          ),),
                          homeController.openServiceIndex.value==index ?
                          Icon(Icons.add , color: Colors.white,size: 17,) :
                          Icon(Icons.remove, color: Colors.white,size: 17,
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
                      width: MediaQuery.of(context).size.width * 0.5+20,
                      child: !(homeController.openServiceIndex.value == index)
                          ? Center()
                          :  Center(child: App.ratesTable(posts[index].jsonData!.first.data,
                          context,
                          MediaQuery.of(context).size.width * 0.5, 15, 17
                      ),)
                  ),
                ),
                SizedBox(height: 10),
              ],
            ));
          }),
    );
  }

  //************************ large ************************
  largeWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.14),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(child: Text(App_Localization.of(context).translate("rates").toUpperCase(),
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
                largeRates(count:1,posts:homeController.service,background: const Color(0xffffffff)),
                SizedBox(height: MediaQuery.of(context).size.width*0.04),
              ],
            ),
          ),
          App.footer(context,homeController),
          App.copyrights(context, 30, 15),
        ],
      ),
    );
  }
  largeRates({required int count, required List<Post> posts, required Color background}) {
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
                    height: 40,
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
                              fontSize: 15,
                              letterSpacing: 2
                          ),),
                          homeController.openServiceIndex.value==index ?
                          Icon(Icons.add , color: Colors.white,size: 15,) :
                          Icon(Icons.remove, color: Colors.white,size: 15,
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
                      width: MediaQuery.of(context).size.width * 0.6+20,
                      child: !(homeController.openServiceIndex.value == index)
                          ? Center()
                          :  Center(child: App.ratesTable(posts[index].jsonData!.first.data,
                          context,
                          MediaQuery.of(context).size.width * 0.6, 15, 17
                      ),)
                  ),
                ),
                SizedBox(height: 10),
              ],
            ));
          }),
    );
  }

  //************************ large ************************
  large2Widget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.16),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(child: Text(App_Localization.of(context).translate("rates").toUpperCase(),
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
                large2Rates(count:1,posts:homeController.service,background: const Color(0xffffffff)),
                SizedBox(height: MediaQuery.of(context).size.width*0.04),
              ],
            ),
          ),
          App.footer(context,homeController),
          App.copyrights(context, 25, 12),
        ],
      ),
    );
  }
  large2Rates({required int count, required List<Post> posts, required Color background}) {
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
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(posts[index].title!, style: TextStyle(
                              color: Colors.white,
                              fontFamily: "POPPINS",
                              fontSize: 12,
                              letterSpacing: 2
                          ),),
                          homeController.openServiceIndex.value==index ?
                          Icon(Icons.add , color: Colors.white,size: 12,) :
                          Icon(Icons.remove, color: Colors.white,size: 12,
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
                      width: MediaQuery.of(context).size.width * 0.6+20,
                      child: !(homeController.openServiceIndex.value == index)
                          ? Center()
                          :  Center(child: App.ratesTable(posts[index].jsonData!.first.data,
                          context,
                          MediaQuery.of(context).size.width * 0.6, 10, 12
                      ),)
                  ),
                ),
                SizedBox(height: 10),
              ],
            ));
          }),
    );
  }

  //************************ large ************************
  bigWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.16),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(child: Text(App_Localization.of(context).translate("rates").toUpperCase(),
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
                bigRates(count:1,posts:homeController.service,background: const Color(0xffffffff)),
                SizedBox(height: MediaQuery.of(context).size.width*0.04),
              ],
            ),
          ),
          App.footer(context,homeController),
          App.copyrights(context, 20, 10),
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
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 30,
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
                              fontSize: 10,
                              letterSpacing: 2
                          ),),
                          homeController.openServiceIndex.value==index ?
                          Icon(Icons.add , color: Colors.white,size: 10,) :
                          Icon(Icons.remove, color: Colors.white,size: 10,
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
                      width: MediaQuery.of(context).size.width * 0.7+20,
                      child: !(homeController.openServiceIndex.value == index)
                          ? Center()
                          :  Center(child: App.ratesTable(posts[index].jsonData!.first.data,
                          context,
                          MediaQuery.of(context).size.width * 0.7, 8, 10
                      ),)
                  ),
                ),
                SizedBox(height: 10),
              ],
            ));
          }),
    );
  }


}
