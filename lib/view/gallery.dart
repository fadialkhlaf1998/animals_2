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
                      :MediaQuery.of(context).size.width>App.mid?mdWegit(context)
                      :MediaQuery.of(context).size.width>App.small?smWegit(context):xsmWegit(context)
                ),
                Positioned(child: App.header(context, homeController,myKey)),
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
          SizedBox(height: MediaQuery.of(context).size.height*0.25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
            child: Column(
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
                        child: Center(child: Text(App_Localization.of(context).translate("gallery"),style: const TextStyle(color: App.lightOrang,fontSize:40,fontWeight: FontWeight.bold),maxLines: 1)),
                      ),

                    ],
                  ),
                ),
                GridView.custom(
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: [
                      //h*w
                      const QuiltedGridTile(2, 2),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                    ],
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childrenDelegate: SliverChildBuilderDelegate(
                          (context, index) => tile(index),
                      childCount: 10
                  ),
                ),

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
  bgWegit(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
            child: Column(
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
                        child: Center(child: Text(App_Localization.of(context).translate("gallery"),style: const TextStyle(color: App.lightOrang,fontSize:35,fontWeight: FontWeight.bold),maxLines: 1)),
                      ),

                    ],
                  ),
                ),
                GridView.custom(
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: [
                      //h*w
                      const QuiltedGridTile(2, 2),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                    ],
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  childrenDelegate: SliverChildBuilderDelegate(
                          (context, index) => tile(index),
                      childCount: 10
                  ),
                ),

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
  mdWegit(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
            child: Column(
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
                        child: Center(child: Text(App_Localization.of(context).translate("gallery"),style: const TextStyle(color: App.lightOrang,fontSize:30,fontWeight: FontWeight.bold),maxLines: 1)),
                      ),

                    ],
                  ),
                ),
                GridView.custom(
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: [
                      //h*w
                      const QuiltedGridTile(2, 2),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                    ],
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  childrenDelegate: SliverChildBuilderDelegate(
                          (context, index) => tile(index),
                      childCount: 10
                  ),
                ),

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
  smWegit(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
            child: Column(
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
                        child: Center(child: Text(App_Localization.of(context).translate("gallery"),style: const TextStyle(color: App.lightOrang,fontSize:25,fontWeight: FontWeight.bold),maxLines: 1)),
                      ),

                    ],
                  ),
                ),
                GridView.custom(
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: [
                      //h*w
                      const QuiltedGridTile(2, 2),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                    ],
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  childrenDelegate: SliverChildBuilderDelegate(
                          (context, index) => tile(index),
                      childCount: 10
                  ),
                ),

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
  xsmWegit(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
            child: Column(
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
                        child: Center(child: Text(App_Localization.of(context).translate("gallery"),style: const TextStyle(color: App.lightOrang,fontSize:20,fontWeight: FontWeight.bold),maxLines: 1)),
                      ),

                    ],
                  ),
                ),
                GridView.custom(
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: [
                      //h*w
                      const QuiltedGridTile(2, 2),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                    ],
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  childrenDelegate: SliverChildBuilderDelegate(
                          (context, index) => tile(index),
                      childCount: 10
                  ),
                ),

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
  tile (int index){
    return GestureDetector(
      onTap: (){
        Get.to(()=>ImageShow(index.obs));
      },
      child: Container(

                decoration: BoxDecoration(

                  image: DecorationImage(
                    image: NetworkImage(homeController.gallary[index].image!),
                    fit: BoxFit.fill
                  )
                ),

      ),
    );
  }
}