import 'package:animals/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:animals/helper/app.dart';

class ImageShow extends StatelessWidget {
  Rx<int> index;
  HomeController homeController = Get.put(HomeController());
  ImageShow(this.index, {Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> myKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: myKey,
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
      ),
      body: Center(
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Obx( () {
              return Stack(
                children: [
                  RawKeyboardListener(
                    autofocus: true,
                    onKey: (key){
                      if (key.runtimeType == RawKeyDownEvent) {
                        //right
                        if(key.data.logicalKey == LogicalKeyboardKey.arrowRight){
                          if(index<homeController.gallary.length-1) {
                            index.value++;
                          }
                        }
                        //left
                        else if(key.data.logicalKey == LogicalKeyboardKey.arrowLeft){
                          if(index>0) {
                            index.value--;
                          }
                        }
                      }
                  },
                    focusNode: FocusNode(),
                    child: Container(
                      color: App.primery,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height -
                                (MediaQuery.of(context).size.height * 0.1),
                            child: PhotoView(
                              imageProvider:
                              NetworkImage(homeController.gallary[index.value].image!.replaceAll("localhost", "10.0.2.2")),
                              backgroundDecoration: const BoxDecoration(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Positioned(child: IconButton(icon: Icon(Icons.arrow_back_ios,color: App.primery,),onPressed: (){index.value++;}),),
                  Positioned(
                      left: 20,
                      top: MediaQuery.of(context).size.height*0.5,
                      child: index.value==0?const Center(): Container(
                        width: MediaQuery.of(context).size.width > App.larg ? 60 : 40,
                        height: MediaQuery.of(context).size.width > App.larg ? 60 : 40,
                        child: CircleAvatar(
                          backgroundColor: App.grey,
                          child: IconButton(icon: Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: const Icon(Icons.arrow_back_ios,color: App.primery,),
                          ),onPressed: (){index.value--;}),
                        ),
                      ),
                  ),
                  Positioned(
                    right: 20,
                    top: MediaQuery.of(context).size.height*0.5,
                    child: index.value==homeController.gallary.length-1?const Center():
                    Container(
                      width: MediaQuery.of(context).size.width > App.larg ? 60 : 40,
                      height: MediaQuery.of(context).size.width > App.larg ? 60 : 40,
                      child: CircleAvatar(
                        backgroundColor: App.grey,
                        child: IconButton(icon: const Icon(Icons.arrow_forward_ios,color: App.primery,),onPressed: (){index.value++;}),
                      ),
                    ),
                  ),
                ],
              );
            }
          ),
        )),
      ),
    );
  }
}
