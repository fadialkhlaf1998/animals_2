import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animals/app_localization.dart';
import 'package:animals/controller/cart_contoller.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/controller/wishlist_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:animals/model/post.dart';
import 'package:zoom_widget/zoom_widget.dart';

class ProductList extends StatelessWidget {
  HomeController homeController = Get.find();
  CartController cartController = Get.find();
  WishListController wishListController = Get.find();
  final GlobalKey<ScaffoldState> myKey = GlobalKey();
  List<Post> posts;

  ProductList(this.posts);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        key: myKey,
        endDrawer: App.myDrawer(context, homeController,myKey),
        appBar: AppBar(
          title: Text(App_Localization.of(context).translate("product_list")),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: ()async{
            Get.offAllNamed("/");
          },
          child: Stack(
            children: [

              Zoom(
                maxZoomWidth: MediaQuery.of(context).size.width,
                maxZoomHeight: MediaQuery.of(context).size.height,
                child: SafeArea(
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height*0.15,),
                              _body(context),
                              App.footer(context,homeController),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Positioned(child: App.header(context, homeController,myKey)),
              homeController.loading.value
                  ? Positioned(
                      child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: App.primery.withOpacity(0.5),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ))
                  : Center(),
            ],
          ),
        ),
      );
    });
  }
_body(BuildContext context){
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.1,
                  child: Center(child: AutoSizeText(App_Localization.of(context).translate("shop"),style: TextStyle(color: App.green,fontSize:50,fontWeight: FontWeight.bold),minFontSize:0,stepGranularity: 0.1,maxLines: 1)),
                ),

              ],
            ),
          ),
        ],
      ),
    );
}
}
