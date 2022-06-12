import 'package:animals/app_localization.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:animals/model/post.dart';
import 'package:animals/view/on_hover.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_widget/zoom_widget.dart';

class CustomSearchView extends StatelessWidget {
  final HomeController homeController = Get.find();
  final GlobalKey<ScaffoldState> myKey = GlobalKey();

  List<Post> products = <Post>[];
  List<Post> service = <Post>[];
  List<String> postTypes = <String>[];

  CustomSearchView(this.products, this.service);

  @override
  Widget build(BuildContext context) {
    postTypes = [App_Localization.of(context).translate("products"),
      App_Localization.of(context).translate("services")];
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
                Obx(() {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child:MediaQuery.of(context).size.width>App.larg?lgWidget(context)
                          :MediaQuery.of(context).size.width>App.big?bgWidget(context)
                          :MediaQuery.of(context).size.width>App.mid?mdWidget(context)
                          :MediaQuery.of(context).size.width>App.small?smWidget(context):xsmWidget(context),
                    );
                  }
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
          SizedBox(height: MediaQuery.of(context).size.height*0.15,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child:Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.width*0.1/4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(App_Localization.of(context).translate("search_results"),style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: App.lightOrang),)
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.width*0.1/4,),
                _posts(context,width: 150,height: 35,font: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1,vertical: MediaQuery.of(context).size.width*0.1/2),
                  child: homeController.selectedPostFilter.value==0
                      ?_product(count:(MediaQuery.of(context).size.width*0.7/200).round(),ratio:4/5,posts:products,height:200,radius:0,circle:false,background: Colors.white,shadow: false,img_radius: null,op: 1,h3: 20,h4: 15,h5: 12)
                      :_services(context,h1: 25,h2: 17,maxLine: 8)
                ),
              ],
            )
          ),
          App.footer(context,homeController),
        ],
      ),
    );
  }
  bgWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.15,),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child:Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.width*0.1/4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(App_Localization.of(context).translate("search_results"),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: App.lightOrang),)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width*0.1/4,),
                  _posts(context,width: 150,height: 35,font: 15),
                  Padding(

                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1,vertical: MediaQuery.of(context).size.width*0.1/2),
                      child: homeController.selectedPostFilter.value==0
                          ?_product(count:(MediaQuery.of(context).size.width*0.7/200).round(),ratio:4/5,posts:products,height:200,radius:0,circle:false,background: Colors.white,shadow: false,img_radius: null,op: 1,h3: 15,h4: 12,h5: 10)
                          :_services(context,h1: 20,h2: 13,maxLine: 8)
                  ),
                ],
              )
          ),
          App.footer(context,homeController),
        ],
      ),
    );
  }
  mdWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.15,),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child:Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.width*0.1/4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(App_Localization.of(context).translate("search_results"),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: App.lightOrang),)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width*0.1/4,),
                  _posts(context,width: 150,height: 35,font: 15),
                  Padding(

                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1,vertical: MediaQuery.of(context).size.width*0.1/2),
                      child: homeController.selectedPostFilter.value==0
                          ?_product(count:(MediaQuery.of(context).size.width*0.7/200).round(),ratio:4/5,posts:products,height:200,radius:0,circle:false,background: Colors.white,shadow: false,img_radius: null,op: 1,h3: 15,h4: 12,h5: 10)
                          :_services(context,h1: 17,h2: 13,maxLine: 6)
                  ),
                ],
              )
          ),
          App.footer(context,homeController),
        ],
      ),
    );
  }
  smWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1,),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child:Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.width*0.1/4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(App_Localization.of(context).translate("search_results"),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: App.lightOrang),)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width*0.1/4,),
                  _posts(context,width: 120,height: 30,font: 12),
                  Padding(

                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1,vertical: MediaQuery.of(context).size.width*0.1/2),
                      child: homeController.selectedPostFilter.value==0
                          ?_product(count:(MediaQuery.of(context).size.width*0.7/150).round(),ratio:4/5,posts:products,height:150,radius:0,circle:false,background: Colors.white,shadow: false,img_radius: null,op: 1,h3: 12,h4: 10,h5: 7)
                          :_services(context,h1: 15,h2: 10,maxLine: 5)
                  ),
                ],
              )
          ),
          App.footer(context,homeController),
        ],
      ),
    );
  }
  xsmWidget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1,),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child:Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.width*0.1/4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(App_Localization.of(context).translate("search_results"),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: App.lightOrang),)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width*0.1/4,),
                  _posts(context,width: 120,height: 30,font: 12),
                  Padding(

                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1,vertical: MediaQuery.of(context).size.width*0.1/2),
                      child: homeController.selectedPostFilter.value==0
                          ?_product(count:(MediaQuery.of(context).size.width*0.7/150).round(),ratio:4/5,posts:products,height:150,radius:0,circle:false,background: Colors.white,shadow: false,img_radius: null,op: 1,h3: 12,h4: 10,h5: 7)
                          :_services(context,h1: 12,h2: 8,maxLine: 3)
                  ),
                ],
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.03,),
          App.footer(context,homeController),
        ],
      ),
    );
  }
  _services(BuildContext context, {required double h1,required double h2,required int maxLine}){
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      child: ListView.builder(
          itemCount: service.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: h2),
              child: SizedBox(
                height: MediaQuery.of(context).size.width*0.8/5,
                child: Row(
                  children: [
                    Expanded(flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(service[index].image!)
                            )
                          ),
                        ),
                    ),
                    Expanded(flex: 3,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(service[index].title!,style: TextStyle(fontSize: h1,fontWeight: FontWeight.bold),),
                              Text(service[index].stringDescription!,style: TextStyle(fontSize: h2,color: Colors.grey),overflow: TextOverflow.ellipsis,maxLines: maxLine,),
                            ],
                          ),
                        ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
  _product(
      {required int count,
        required double ratio,
        required List<Post> posts,
        required double height,
        // ignore: non_constant_identifier_names
        required double? img_radius,
        required double? radius,
        required bool circle,
        required Color background,
        required bool shadow,
        required int op,
        required double h3,
        required double h4,
        required double h5 }){
    return Container(
      color: background,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: ratio),
          itemCount: posts.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {

            return OnHover(builder: (isHover){
              return GestureDetector(
                onTap: () {
                  //homeController.doFunction(op, posts[index].id, context);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  decoration: BoxDecoration(
                    color: background,

                  ),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: img_radius == null
                                          ? null
                                          : BorderRadius.circular(img_radius),
                                      shape: circle
                                          ? BoxShape.circle
                                          : BoxShape.rectangle,
                                      color: isHover?Colors.white:App.grey,
                                      image: DecorationImage(
                                          image: NetworkImage(posts[index]
                                              .image!
                                              .replaceAll(
                                              "localhost", "10.0.2.2")),
                                          fit: BoxFit.fill)),
                                ),
                                posts[index].regularPrice!=null?Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                    width: height/ratio/4,
                                    height: height*3/7/5,
                                    color: Colors.red,
                                    child: Center(child: Padding(
                                      padding: const EdgeInsets.all(0.5),
                                      child: Text(App_Localization.of(context).translate("sale"),style: TextStyle(color: Colors.white,fontSize: h4),maxLines: 1),
                                    ),),
                                  ),
                                ):const Center(),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: SizedBox(
                            width:height/ratio,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // FittedBox(child: Text(posts[index].title!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),maxLines: 1,),),
                                SizedBox(
                                    width:height/ratio,
                                    child: Center(child: Text(posts[index].title!,style: TextStyle(fontSize: h3,fontWeight: FontWeight.w500,color: Colors.black),maxLines: 1))),
                                posts[index].regularPrice == null?SizedBox(
                                  width:height/ratio,
                                  child: Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].price!.toStringAsFixed(2),style: TextStyle(fontSize: h4,color: Colors.grey),maxLines: 1,),),
                                ):SizedBox(
                                  width:height,
                                  child: Center(child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                          width:height/3,
                                          height: height/15,
                                          child: Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].price!.toStringAsFixed(2),style: TextStyle(fontSize: h5+2,color: Colors.grey),maxLines: 1))),
                                      // SizedBox(width: height/ratio/6,),
                                      SizedBox(
                                          width:height/3,
                                          height: height/15,
                                          child: Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].regularPrice!.toStringAsFixed(2),style: TextStyle(fontSize: h5,color: Colors.grey.withOpacity(0.5),decoration: TextDecoration.lineThrough),maxLines: 1,))),
                                    ],
                                  ),),
                                ),

                                GestureDetector(
                                  onTap: (){
                                    homeController.fake.value = !homeController.fake.value;
                                    homeController.cartController.addToCart(posts[index],1, context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Container(
                                      width: height/ratio,
                                      height: height/8,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                        // border: Border.all(color: Colors.black,width: 2)
                                      ),
                                      child: Center(
                                        child: Text(
                                          App_Localization.of(context).translate("add_to_cart"),
                                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: h4),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))

                    ],
                  ),
                ),
              );
            }
            );
          }),
    );
  }

  _posts(BuildContext context,{required double width,required double height,required double font}){
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: postTypes.length,
              itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                homeController.selectedPostFilter.value = index;
              },
              child: Container(
                width: width,
                height: height,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(postTypes[index]+" ("+ (index==0?products.length.toString():service.length.toString())+")",style: TextStyle(color: Colors.grey,fontSize: font),),
                    Container(
                      color: index == homeController.selectedPostFilter.value ?App.primery:Colors.grey,
                      width: width-5,
                      height: 2,
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

}
