import 'package:animals/app_localization.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:animals/view/image_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:zoom_widget/zoom_widget.dart';
class Gallery extends StatelessWidget {
  final HomeController homeController = Get.find();

  final GlobalKey<ScaffoldState> myKey = GlobalKey();

  Gallery({Key? key}) : super(key: key);

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
                  child: MediaQuery.of(context).size.width>App.larg?lgWegit(context)
                      :MediaQuery.of(context).size.width>App.big?bgWegit(context)
                      :mdWegit(context)
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

  lgWegit(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.12),
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 6/4
                ),
                scrollDirection: Axis.vertical,
                itemCount: homeController.gallary.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(()=>ImageShow(index.obs));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                homeController.gallary[index].image!
                              ),
                              fit: BoxFit.cover)),
                    )
                  );
                }),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.2),
          App.footer(context,homeController),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("© 2022 by The Barkley Pet Camp",
                    style: TextStyle(
                        fontFamily: "FOUNDRYGRIDNIK",
                        fontSize: App.largeFontSize(MediaQuery.of(context).size.width)
                        )),
              ],
            ),
          ),
        ],
      ),
    );
  }
  bgWegit(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.12),
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 6/4
                ),
                scrollDirection: Axis.vertical,
                itemCount: homeController.gallary.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Get.to(()=>ImageShow(index.obs));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    homeController.gallary[index].image!
                                ),
                                fit: BoxFit.cover)),
                      )
                  );
                }),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.2),
          App.footer(context,homeController),
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
      ),
    );
  }
  mdWegit(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.14),
          SizedBox(height: MediaQuery.of(context).size.width*0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 6/4
                ),
                scrollDirection: Axis.vertical,
                itemCount: homeController.gallary.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Get.to(()=>ImageShow(index.obs));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    homeController.gallary[index].image!
                                ),
                                fit: BoxFit.cover)),
                      )
                  );
                }),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.2),
          App.footer(context,homeController),
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
      ),
    );
  }

}