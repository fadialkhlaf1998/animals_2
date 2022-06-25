// import 'package:animals/controller/shop_controller.dart';
// import 'package:animals/view/on_hover.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:animals/app_localization.dart';
// import 'package:animals/controller/home_controller.dart';
// import 'package:animals/helper/app.dart';
// import 'package:animals/model/post.dart';
// import 'package:zoom_widget/zoom_widget.dart';
//
// class Shop extends StatelessWidget {
//   final HomeController homeController = Get.find();
//
//   final ShopController shopController =Get.find();
//
//   final GlobalKey<ScaffoldState> myKey = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return Scaffold(
//         key: myKey,
//         endDrawer: App.myDrawer(context, homeController,myKey),
//         body: RefreshIndicator(
//           onRefresh: ()async{
//             Get.offAllNamed("/");
//           },
//           child: Stack(
//             children: [
//               Zoom(
//                 maxZoomWidth: MediaQuery.of(context).size.width,
//                 maxZoomHeight: MediaQuery.of(context).size.height,
//                 child: SafeArea(
//                   child: Stack(
//                     children: [
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width,
//                         height: MediaQuery.of(context).size.height,
//                         child:  MediaQuery.of(context).size.width>App.larg?lgWedgit(context)
//                             :MediaQuery.of(context).size.width>App.big?bgWedgit(context)
//                             :MediaQuery.of(context).size.width>App.mid?mdWedgit(context)
//                             :MediaQuery.of(context).size.width>App.small?smWedgit(context):xsmWedgit(context)
//
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(child: App.header(context, homeController,myKey)),
//               homeController.loading.value
//                   ? Positioned(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height,
//                     color: App.primery.withOpacity(0.5),
//                     child: const Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                   ))
//                   : const Center(),
//             ],
//           ),
//         ),
//       );
//     });
//   }
//
//   lgWedgit(BuildContext context){
//     return SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(height: MediaQuery.of(context).size.height*0.15,),
//               _body(context,50,15,13,20,18,16),
//               App.footer(context,homeController),
//             ],
//           ),
//         );
//   }
//   bgWedgit(BuildContext context){
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           SizedBox(height: MediaQuery.of(context).size.height*0.15,),
//           _body(context,50,10,9,20,16,14),
//           App.footer(context,homeController),
//         ],
//       ),
//     );
//   }
//   mdWedgit(BuildContext context){
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           SizedBox(height: MediaQuery.of(context).size.height*0.15,),
//           _body(context,50,8,7,16,14,12),
//           App.footer(context,homeController),
//         ],
//       ),
//     );
//   }
//   smWedgit(BuildContext context){
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           SizedBox(height: MediaQuery.of(context).size.height*0.15,),
//           _body(context,40,30,25,20,15,10),
//           App.footer(context,homeController),
//         ],
//       ),
//     );
//   }
//   xsmWedgit(BuildContext context){
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           SizedBox(height: MediaQuery.of(context).size.height*0.15,),
//           _body(context,30,12,10,20,15,10),
//           App.footer(context,homeController),
//         ],
//       ),
//     );
//   }
//
//
//   _body(BuildContext context,double shopSize,double h1,double h2,double h3,double h4,double h5){
//     return Container(
//       color: Colors.white,
//       child: Column(
//         children: [
//           SizedBox(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height*0.1,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width*0.3,
//                   height: MediaQuery.of(context).size.height*0.1,
//                   child: Center(child: Text(App_Localization.of(context).translate("shop"),style: TextStyle(color: App.green,fontSize:shopSize,fontWeight: FontWeight.bold),maxLines: 1)),
//                 ),
//               ],
//             ),
//           ),
//           details(context,h1,h2),
//           SizedBox(height: MediaQuery.of(context).size.width*0.03,),
//           productFiltter(context,h3,h4,h5),
//           // SizedBox(height: MediaQuery.of(context).size.width*0.05,)
//         ],
//       ),
//     );
//   }
//
//   //todo done
//   details(BuildContext context,double h1, double h2){
//     return MediaQuery.of(context).size.width>App.mid?bigDetails(context,h1,h2):smallDetails(context,h1,h2);
//   }
//   //todo done
//   bigDetails(BuildContext context,double h1, double h2){
//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.width*0.2,
//
//       child: Center(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
//           width: MediaQuery.of(context).size.width*0.7,
//           height: MediaQuery.of(context).size.width*0.15,
//           color: App.grey,
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.01),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.7/4,
//                       height: MediaQuery.of(context).size.width*0.05,
//                       child: FittedBox(
//                         child: SvgPicture.asset("assets/image/shop_1.svg"),
//                       ),
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.7/4,
//                       height: MediaQuery.of(context).size.width*0.05,
//                       child: FittedBox(
//                         child: SvgPicture.asset("assets/image/shop_2.svg"),
//                       ),
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.7/4,
//                       height: MediaQuery.of(context).size.width*0.05,
//                       child: FittedBox(
//                         child: SvgPicture.asset("assets/image/shop_3.svg"),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.7/4,
//                       height: MediaQuery.of(context).size.width*0.02,
//                       child: Center(child: Text(App_Localization.of(context).translate("shop_title_1"),style: TextStyle(fontSize: h1,color: App.lightOrang,fontWeight: FontWeight.bold),maxLines: 1,)),
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.7/4,
//                       height: MediaQuery.of(context).size.width*0.02,
//                       child: Center(child: Text(App_Localization.of(context).translate("shop_title_2"),style: TextStyle(fontSize: h1,color: App.lightOrang,fontWeight: FontWeight.bold),maxLines: 1,)),
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.7/4,
//                       height: MediaQuery.of(context).size.width*0.02,
//                       child: Center(child: Text(App_Localization.of(context).translate("shop_title_3"),style: TextStyle(fontSize: h1,color: App.lightOrang,fontWeight: FontWeight.bold),maxLines: 1,)),
//                     ),
//                   ],
//                 ),
//                 Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: [
//                    SizedBox(
//                      width: MediaQuery.of(context).size.width*0.7/4,
//                      height: MediaQuery.of(context).size.width*0.04,
//                      child: Center(child: Text(App_Localization.of(context).translate("shop_content_1"),style: TextStyle(fontSize: h2,color: App.auto),textAlign: TextAlign.center)),
//                    ),
//                    SizedBox(
//                      width: MediaQuery.of(context).size.width*0.7/4,
//                      height: MediaQuery.of(context).size.width*0.04,
//                      child: Center(child: Text(App_Localization.of(context).translate("shop_content_2"),style: TextStyle(fontSize: h2,color: App.auto),textAlign: TextAlign.center)),
//                    ),
//                    SizedBox(
//                      width: MediaQuery.of(context).size.width*0.7/4,
//                      height: MediaQuery.of(context).size.width*0.04,
//                      child: Center(child: Text(App_Localization.of(context).translate("shop_content_3"),style: TextStyle(fontSize: h2,color: App.auto),textAlign: TextAlign.center)),
//                    ),
//                  ],
//                )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   //todo done
//   smallDetails(BuildContext context,double h1, double h2){
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       color: App.grey,
//       child: Center(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
//           width: MediaQuery.of(context).size.width*0.7,
//           color: App.grey,
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.01),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.7,
//                       height: MediaQuery.of(context).size.width*0.35,
//                       child: FittedBox(
//                         child: SvgPicture.asset("assets/image/shop_1.svg"),
//                       ),
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.7,
//                       height: MediaQuery.of(context).size.width*0.15,
//                       child: Center(child: Text(App_Localization.of(context).translate("shop_title_1"),style: TextStyle(fontSize: h1,color: App.lightOrang,fontWeight: FontWeight.bold),maxLines: 1,)),
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.7,
//                       height: MediaQuery.of(context).size.width*0.2,
//                       child: Center(child: Text(App_Localization.of(context).translate("shop_content_1"),style: TextStyle(fontSize: h2,color: App.auto),textAlign: TextAlign.center)),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.7,
//                       height: MediaQuery.of(context).size.width*0.35,
//                       child: FittedBox(
//                         child: SvgPicture.asset("assets/image/shop_2.svg"),
//                       ),
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.7,
//                       height: MediaQuery.of(context).size.width*0.15,
//                       child: Center(child: Text(App_Localization.of(context).translate("shop_title_2"),style: TextStyle(fontSize: h1,color: App.lightOrang,fontWeight: FontWeight.bold),maxLines: 1,)),
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.7,
//                       height: MediaQuery.of(context).size.width*0.2,
//                       child: Center(child: Text(App_Localization.of(context).translate("shop_content_2"),style: TextStyle(fontSize: h2,color: App.auto),textAlign: TextAlign.center)),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.7,
//                       height: MediaQuery.of(context).size.width*0.35,
//                       child: FittedBox(
//                         child: SvgPicture.asset("assets/image/shop_3.svg"),
//                       ),
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.7,
//                       height: MediaQuery.of(context).size.width*0.15,
//                       child: Center(child: Text(App_Localization.of(context).translate("shop_title_3"),style: TextStyle(fontSize: h1,color: App.lightOrang,fontWeight: FontWeight.bold),maxLines: 1,)),
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.7,
//                       height: MediaQuery.of(context).size.width*0.2,
//                       child: Center(child: Text(App_Localization.of(context).translate("shop_content_3"),style: TextStyle(fontSize: h2,color: App.auto),textAlign: TextAlign.center)),
//                     ),
//                   ],
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   productFiltter(BuildContext context,double h3, double h4,double h5){
//     return MediaQuery.of(context).size.width>App.mid?productFiltterBig(context,h3,h4,h5):productFiltterSmall(context,h3,h4,h5);
//   }
//   productFiltterBig(BuildContext context,double h3, double h4,double h5){
//       return SizedBox(
//         width: MediaQuery.of(context).size.width,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: MediaQuery.of(context).size.width*0.25,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width*0.15,
//                     child: Text(App_Localization.of(context).translate("filter_by"),style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: h3),textAlign: TextAlign.start),
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.width*0.03/2,),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width*0.15,
//                     child: Divider(color: Colors.grey[600],height: 1,),
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.width*0.03/2,),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width*0.15,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width*0.1,
//                           child: Text(App_Localization.of(context).translate("collection"),style: TextStyle(color: Colors.grey[600],fontSize: h3),textAlign: TextAlign.start,maxLines: 1),
//                         ),
//                         GestureDetector(onTap: (){
//                           shopController.openCollection.value = !shopController.openCollection.value;
//                         },child: Icon(shopController.openCollection.value?Icons.remove:Icons.add,color: Colors.grey[600],))
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.width*0.03/2,),
//                   // SizedBox(
//                   //   width: MediaQuery.of(context).size.width*0.15,
//                   //   child: Divider(color: Colors.grey[600],height: 1,),
//                   // ),
//                   AnimatedContainer(
//                     duration: const Duration(milliseconds: 300),
//                     height: shopController.openCollection.value?(homeController.category.length+1)*MediaQuery.of(context).size.width*0.1/4:0,
//                     child: ScrollConfiguration(
//                       behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
//                       child: SingleChildScrollView(
//                         physics: const NeverScrollableScrollPhysics(),
//
//                         child: Column(
//                           children: [
//                             GestureDetector(
//                               onTap: (){
//                                 shopController.filterPost(-1);
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(vertical: 0),
//                                 child: SizedBox(
//                                   width: MediaQuery.of(context).size.width*0.1,
//                                   height: MediaQuery.of(context).size.width*0.1/4,
//                                   child: Text(App_Localization.of(context).translate("all"),style: TextStyle(color: shopController.selectedCategory.value==-1? Colors.black:Colors.grey[600],fontSize: h4),textAlign: TextAlign.start,maxLines: 1,),
//                                 ),
//                               ),
//                             ),
//                             Column(
//                               children: homeController.category.map((element) {
//                                 return GestureDetector(
//                                   onTap: (){
//                                     shopController.filterPost(element.id);
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 0),
//                                     child: SizedBox(
//                                       width: MediaQuery.of(context).size.width*0.1,
//                                       height: MediaQuery.of(context).size.width*0.1/4,
//                                       child: Text(element.title!,style: TextStyle(color: shopController.selectedCategory.value==element.id? Colors.black:Colors.grey[600],fontSize: h4),textAlign: TextAlign.start,maxLines: 1,),
//                                     ),
//                                   ),
//                                 );
//                               }).toList(),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   // SizedBox(height: MediaQuery.of(context).size.width*0.03/2,),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width*0.15,
//                     child: Divider(color: Colors.grey[600],height: 1,),
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.width*0.03/2,),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width*0.15,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width*0.1,
//                           child: Text(App_Localization.of(context).translate("price"),style: TextStyle(color: Colors.grey[600],fontSize: h3),textAlign: TextAlign.start,maxLines: 1,),
//                         ),
//                         GestureDetector(onTap: (){
//                           shopController.openPrice.value = !shopController.openPrice.value;
//                         },child: Icon(shopController.openPrice.value?Icons.remove:Icons.add,color: Colors.grey[600],))
//                       ],
//                     ),
//                   ),
//                   AnimatedContainer(
//                     width: MediaQuery.of(context).size.width*0.15,
//                     height: shopController.openPrice.value?70:0,
//                     duration: const Duration(milliseconds: 300),
//                     child: ScrollConfiguration(
//                       behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
//                       child: SingleChildScrollView(
//                         physics: const NeverScrollableScrollPhysics(),
//                         child: Column(
//                           children: [
//                             RangeSlider(
//                               min: 0,
//                               max: 5000,
//
//                               onChanged: (value){
//                                 shopController.minPrice.value = value.start;
//                                 shopController.maxPrice.value = value.end;
//                                 shopController.price.value = value;
//                                 shopController.priceLabel.value = RangeLabels("AED "+value.start.toStringAsFixed(2), "AED "+value.end.toStringAsFixed(2));
//                                 shopController.filterPost(shopController.selectedCategory.value);
//                               },
//                               values: shopController.price.value,
//                               // divisions: 50,
//                               labels: shopController.priceLabel.value,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Center(child: Text(shopController.priceLabel.value.start,style: TextStyle(color: Colors.grey[600],fontSize: h5-5),maxLines: 1,)),
//                                 Center(child: Text(shopController.priceLabel.value.end,style: TextStyle(color: Colors.grey[600],fontSize: h5-5),maxLines: 1,))
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   shopController.openPrice.value?const Center():SizedBox(height: MediaQuery.of(context).size.width*0.03/2,),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width*0.15,
//                     child: Divider(color: Colors.grey[600],height: 1,),
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.width*0.03/2,),
//                   shopController.openClearFilter.value?GestureDetector(
//                     onTap: (){
//                       shopController.clearFilter();
//                     },
//                     child: SizedBox(
//                       width: MediaQuery.of(context).size.width*0.12,
//                       child: Text(App_Localization.of(context).translate("clear_filter"),style: TextStyle(color: Colors.grey[600],fontSize: h4),textAlign: TextAlign.start,maxLines: 1,),
//                     ),
//                   ):const Center(),
//                 ],
//               ),
//             ),
//             SizedBox(
//               width: MediaQuery.of(context).size.width*0.7,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   _product(count:(MediaQuery.of(context).size.width*0.7/300).round(),ratio:4/5,posts:shopController.postsView,height:300,radius:0,circle:false,background: Colors.white,shadow: false,img_radius: null,op: 1,h3: h3,h4: h4,h5: h5),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//   }
//   productFiltterSmall(BuildContext context,double h3, double h4,double h5){
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       color: Colors.white,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             width: MediaQuery.of(context).size.width*0.9,
//             height: 300,
//             child: Center(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width*0.9,
//                     child: Text(App_Localization.of(context).translate("filter_by"),style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: h3),textAlign: TextAlign.start,maxLines: 1),
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.width*0.03/2,),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width*0.9,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width*0.9,
//                           child: Text(App_Localization.of(context).translate("collection"),style: TextStyle(color: Colors.grey[600],fontSize: h3),textAlign: TextAlign.start,maxLines: 1),
//                         ),
//
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.width*0.03/2,),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width*0.9,
//                     child: Wrap(
//                       children: [
//                         GestureDetector(
//                           onTap: (){
//                             shopController.filterPost(-1);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 5),
//                             child: SizedBox(
//                               height: 30,
//                               child: Text(App_Localization.of(context).translate("all"),style: TextStyle(color: shopController.selectedCategory.value==-1? Colors.black:Colors.grey[600],fontSize: h4),textAlign: TextAlign.start,maxLines: 1),
//                             ),
//                           ),
//                         ),
//                         Wrap(
//                           children: homeController.category.map((element) {
//                             return GestureDetector(
//                               onTap: (){
//                                 shopController.filterPost(element.id);
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 5),
//                                 child: SizedBox(
//                                   height: 30,
//                                   child: Text(element.title!,style: TextStyle(color: shopController.selectedCategory.value==element.id? Colors.black:Colors.grey[600],fontSize: h4),textAlign: TextAlign.start,maxLines: 1),
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.width*0.03/2,),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width*0.9,
//                     child: Divider(color: Colors.grey[600],height: 1,),
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.width*0.03/2,),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width*0.9,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               width: MediaQuery.of(context).size.width*0.9,
//                               child: Text(App_Localization.of(context).translate("price"),style: TextStyle(color: Colors.grey[600],fontSize: h3),textAlign: TextAlign.start,maxLines: 1,),
//                             ),
//
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                       width: MediaQuery.of(context).size.width*0.9,
//                         child:  Center(
//                           child: SizedBox(
//                             width: MediaQuery.of(context).size.width*0.9,
//                             height: 80,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 RangeSlider(
//                                   min: 0,
//                                   max: 5000,
//
//                                   onChanged: (value){
//                                     shopController.minPrice.value = value.start;
//                                     shopController.maxPrice.value = value.end;
//                                     shopController.price.value = value;
//                                     shopController.priceLabel.value = RangeLabels("AED "+value.start.toStringAsFixed(2), "AED "+value.end.toStringAsFixed(2));
//                                     shopController.filterPost(shopController.selectedCategory.value);
//                                   },
//                                   values: shopController.price.value,
//                                   // divisions: 50,
//                                   labels: shopController.priceLabel.value,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     SizedBox(
//                                       width: MediaQuery.of(context).size.width*0.3,
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           Text(shopController.priceLabel.value.start,style: TextStyle(color: Colors.grey[600],fontSize: h5),maxLines: 1,),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: MediaQuery.of(context).size.width*0.3,
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.end,
//                                         children: [
//                                           Text(shopController.priceLabel.value.end,style: TextStyle(color: Colors.grey[600],fontSize: h5),maxLines: 1),
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//
//                     ],
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.width*0.03/2,),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width*0.9,
//                     child: Divider(color: Colors.grey[600],height: 1,),
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.width*0.03/2,),
//                   shopController.openClearFilter.value?GestureDetector(
//                     onTap: (){
//                       shopController.clearFilter();
//                     },
//                     child: SizedBox(
//                       width: MediaQuery.of(context).size.width*0.9,
//                       child: Text(App_Localization.of(context).translate("clear_filter"),style: TextStyle(color: Colors.grey[600],fontSize: h3),textAlign: TextAlign.start,maxLines: 1,),
//                     ),
//                   ):const Center(),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             width: MediaQuery.of(context).size.width,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 _product(count:MediaQuery.of(context).size.width~/250,ratio:4/5,posts:shopController.postsView,height:250,radius:0,circle:false,background: Colors.white,shadow: false,img_radius: null,op: 1,h3: h3,h4: h4,h5: h5),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   _product(
//       {required int count,
//         required double ratio,
//         required List<Post> posts,
//         required double height,
//         // ignore: non_constant_identifier_names
//         required double? img_radius,
//         required double? radius,
//         required bool circle,
//         required Color background,
//         required bool shadow,
//         required int op,
//         required double h3,
//         required double h4,
//         required double h5 }){
//     return Container(
//       color: background,
//       child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: count,
//               mainAxisSpacing: 10,
//               crossAxisSpacing: 10,
//               childAspectRatio: ratio),
//           itemCount: posts.length,
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemBuilder: (context, index) {
//
//             return OnHover(builder: (isHover){
//               return GestureDetector(
//                 onTap: () {
//                   //homeController.doFunction(op, posts[index].id, context);
//                 },
//                 child: Container(
//                   margin: const EdgeInsets.only(bottom: 2),
//                   decoration: BoxDecoration(
//                     color: background,
//
//                   ),
//                   child: Column(
//                     children: [
//                       Expanded(
//                           flex: 3,
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 5),
//                             child: Stack(
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: img_radius == null
//                                           ? null
//                                           : BorderRadius.circular(img_radius),
//                                       shape: circle
//                                           ? BoxShape.circle
//                                           : BoxShape.rectangle,
//                                       color: isHover?Colors.white:App.grey,
//                                       image: DecorationImage(
//                                           image: NetworkImage(posts[index]
//                                               .image!
//                                               .replaceAll(
//                                               "localhost", "10.0.2.2")),
//                                           fit: BoxFit.fill)),
//                                 ),
//                                 //todo check
//                                 // Positioned(
//                                 //   bottom: 0,
//                                 //   child: FittedBox(
//                                 //     child: Container(
//                                 //       width:height/ratio,
//                                 //       height: height*3/7/5,
//                                 //       child: Column(
//                                 //         children: [
//                                 //           AnimatedContainer(
//                                 //             width:height/ratio,
//                                 //             height: isHover?height*3/7/5:0,
//                                 //             color: Colors.white.withOpacity(0.75),
//                                 //             duration: Duration(milliseconds: 300),
//                                 //             child: Center(child: Text(App_Localization.of(context).translate("quick_view"),style: TextStyle(color: Colors.black),),),
//                                 //           ),
//                                 //         ],
//                                 //       ),
//                                 //     ),
//                                 //   ),
//                                 // ),
//                                 posts[index].regularPrice!=null?Positioned(
//                                   top: 0,
//                                   left: 0,
//                                   child: Container(
//                                     width: height/ratio/4,
//                                     height: height*3/7/5,
//                                     color: Colors.red,
//                                     child: Center(child: Padding(
//                                       padding: const EdgeInsets.all(0.5),
//                                       child: Text(App_Localization.of(context).translate("sale"),style: TextStyle(color: Colors.white,fontSize: h4),maxLines: 1),
//                                     ),),
//                                   ),
//                                 ):const Center(),
//                               ],
//                             ),
//                           )),
//                       Expanded(
//                           flex: 2,
//                           child: SizedBox(
//                             width:height/ratio,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 // FittedBox(child: Text(posts[index].title!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),maxLines: 1,),),
//                                 SizedBox(
//                                     width:height/ratio,
//                                     child: Center(child: Text(posts[index].title!,style: TextStyle(fontSize: h3,fontWeight: FontWeight.w500,color: Colors.black),maxLines: 1))),
//                                 posts[index].regularPrice == null?SizedBox(
//                                     width:height/ratio,
//                                     child: Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].price!.toStringAsFixed(2),style: TextStyle(fontSize: h4,color: Colors.grey),maxLines: 1,),),
//                                 ):SizedBox(
//                                   width:height,
//                                   child: Center(child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       SizedBox(
//                                           width:height/3,
//                                           height: height/15,
//                                           child: Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].price!.toStringAsFixed(2),style: TextStyle(fontSize: h5+2,color: Colors.grey),maxLines: 1))),
//                                       // SizedBox(width: height/ratio/6,),
//                                       SizedBox(
//                                           width:height/3,
//                                           height: height/15,
//                                           child: Center(child: Text(App_Localization.of(context).translate("aed")+" "+posts[index].regularPrice!.toStringAsFixed(2),style: TextStyle(fontSize: h5,color: Colors.grey.withOpacity(0.5),decoration: TextDecoration.lineThrough),maxLines: 1,))),
//                                     ],
//                                   ),),
//                                 ),
//
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 5),
//                                   child: Container(
//                                     width: height/ratio,
//                                     height: height/8,
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         border: Border.all(color: Colors.black,width: 1)
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         FittedBox(
//                                           child: GestureDetector(onTap: (){
//                                             homeController.fake.value = !homeController.fake.value;
//                                             if(posts[index].cartCount.value>1){
//                                               posts[index].cartCount.value -- ;
//                                             }
//                                           },child: const Icon(Icons.remove,color: Colors.grey,)),
//                                         ),
//                                         Obx(() => Text(posts[index].cartCount.value.toString(),style: TextStyle(fontSize: h4,color: Colors.grey),maxLines: 1),),
//                                         FittedBox(
//                                           child: GestureDetector(onTap: (){
//                                             homeController.fake.value = !homeController.fake.value;
//                                             posts[index].cartCount.value ++ ;
//                                           },child: const Icon(Icons.add,color: Colors.grey,)),
//                                         ),
//
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 GestureDetector(
//                                   onTap: (){
//                                     homeController.fake.value = !homeController.fake.value;
//                                     homeController.cartController.addToCart(posts[index], posts[index].cartCount.value, context);
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(horizontal: 5),
//                                     child: Container(
//                                       width: height/ratio,
//                                       height: height/8,
//                                       decoration: BoxDecoration(
//                                           color: App.primery,
//                                           borderRadius: BorderRadius.circular(height/16)
//                                           // border: Border.all(color: Colors.black,width: 2)
//                                       ),
//                                       child: Center(
//                                         child: Text(
//                                           App_Localization.of(context).translate("add_to_cart"),
//                                           style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: h4),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ))
//
//                     ],
//                   ),
//                 ),
//               );
//             }
//             );
//           }),
//     );
//   }
// }
import 'package:animals/app_localization.dart';
import 'package:animals/controller/shop_controller.dart';
import 'package:animals/view/cart.dart';
import 'package:animals/view/on_hover.dart';
import 'package:animals/view/shopHeader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:zoom_widget/zoom_widget.dart';

class Shop extends StatelessWidget {

  final HomeController homeController = Get.find();
  final ShopController shopController =Get.find();
  final GlobalKey<ScaffoldState> myKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return shopController.btmNavBarIndex.value == 0 ? _shop(context) :
      shopController.btmNavBarIndex.value == 1 ? _shop(context) :
      shopController.btmNavBarIndex.value == 2 ? _shop(context) :
      shopController.btmNavBarIndex.value == 3 ?  _shop(context)  :
      shopController.btmNavBarIndex.value == 4 ?  _shop(context)  :
      shopController.btmNavBarIndex.value == 5 ?  _shop(context)  : Cart();
    });
  }

  _shop(BuildContext context) {
    return Scaffold(
      key: myKey,
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
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/image/Background.png")
                            )
                        ),
                        child: MediaQuery.of(context).size.width>App.extra ? extraShop(context) :
                        MediaQuery.of(context).size.width>App.larg?largeWidget(context)
                            :MediaQuery.of(context).size.width>App.big?bigWedgit(context)
                            :medWedgit(context)
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                right: 0,
                child: App.languageBarShop(context, shopController)
            ),
            homeController.loading.value
                ? Positioned(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: App.primery.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ))
                : const Center(),
          ],
        ),
      ),
    );
  }



  //************************ Extra ************************
  extraShop(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          controller: App.scrollController,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width*0.13),
              App.footer(context,homeController),
              App.copyrights(context, 50, 23),
            ],
          ),
        ),
        Positioned(child: ShopHeader()),
      ],
    );
  }

  ////////////////// large //////////////////
  largeWidget(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 40),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/image/shop-page.jpg")
                    )
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                //todo download from apple
                              },
                              child: Container(
                                  width: 150,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset("assets/image/apple-logo.png",width: 25,height: 25,color: Colors.white,),
                                        Text(App_Localization.of(context).translate("app_store"),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //todo download from google
                              },
                              child:  Container(
                                  width: 150,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset("assets/image/google-play.png",width: 25,height: 25,),
                                        Text(App_Localization.of(context).translate("app_store"),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Center(
                  child: Text(App_Localization.of(context).translate("download_our_app"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.4),
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
        ),
        // Positioned(child: App.header(context,homeController,myKey),),
        // Positioned(child: Header()),
        homeController.loading.value
            ? Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: App.primery.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ))
            : const Center()
      ],
    );
  }
  largeshopByBetsList(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.25),
        AnimatedSize(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: Container(
              child: !(shopController.btmNavBarIndex.value == 1)
                  ? Center()
                  :  Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.55,
                color: Color(0xfff5f5f5),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Column(
                          children: [
                            SizedBox(height: 40),
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: homeController.category.length,
                              itemBuilder: (context,index) {
                                return GestureDetector(
                                  onTap: () {
                                    shopController.selectedCategory.value = index;
                                    print(index);
                                  },
                                  child: Container(
                                    color: index.isOdd ?
                                    Colors.white : Colors.grey[200],
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(homeController.category[index].title.toString()),
                                          Icon(Icons.arrow_right,color: App.purple,)
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Column(
                          children: [
                            Container(
                              height: 40,
                              color: App.purple,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
        )
      ],
    );
  }
  largeBrandsList(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.25),
        AnimatedSize(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: Container(
              child: !(shopController.btmNavBarIndex.value == 2)
                  ? Center()
                  :  Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.55,
                  color: Color(0xfff5f5f5),
                  child: Column(
                    children: [
                      GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              // mainAxisSpacing: 20,
                              // crossAxisSpacing: 20,
                              childAspectRatio: 1.3
                          ),
                          itemCount: homeController.brand.length > 6 ? 6 : homeController.brand.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return OnHover(builder: (isHovered) {
                              return  GestureDetector(
                                onTap: () {
                                  //homeController.doFunction(op, posts[index].id, context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: isHovered ?
                                            App.primery : Colors.grey
                                        )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    homeController.brand[index].image!
                                                ),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                          }),
                      GestureDetector(
                          onTap: () {
                            //todo go to brand page
                          },
                          child: Text(App_Localization.of(context).translate("show_all_brands"),
                            style: TextStyle(
                                color: App.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),
                          )
                      )
                    ],
                  )
              )
          ),
        )
      ],
    );
  }

  ////////////////// Big //////////////////
  bigWedgit(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 40),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/image/shop-page.jpg")
                      )
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //todo download from apple
                                },
                                child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset("assets/image/apple-logo.png",width: 20,height: 20,color: Colors.white,),
                                          Text(App_Localization.of(context).translate("app_store"),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  //todo download from google
                                },
                                child:  Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset("assets/image/google-play.png",width: 20,height: 20,),
                                          Text(App_Localization.of(context).translate("app_store"),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Center(
                  child: Text(App_Localization.of(context).translate("download_our_app"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.4),
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
        ),
        // Positioned(child: App.header(context,homeController,myKey),),
        homeController.loading.value
            ? Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: App.primery.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ))
            : const Center()
      ],
    );
  }
  bigshopByBetsList(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.25),
        AnimatedSize(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: Container(
              child: !(shopController.btmNavBarIndex.value == 1)
                  ? Center()
                  :  Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.55,
                color: Color(0xfff5f5f5),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        // width: MediaQuery.of(context).size.width * 0.13,
                        child: Column(
                          children: [
                            SizedBox(height: 35),
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: homeController.category.length,
                              itemBuilder: (context,index) {
                                return GestureDetector(
                                  onTap: () {
                                    shopController.selectedCategory.value = index;
                                    print(index);
                                  },
                                  child: Container(
                                    color: index.isOdd ?
                                    Colors.white : Colors.grey[200],
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(homeController.category[index].title.toString(),
                                            style: TextStyle(
                                              fontSize: 13
                                            ),
                                          ),
                                          Icon(Icons.arrow_right,color: App.purple,size: 20,)
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 35,
                            color: App.purple,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
          ),
        )
      ],
    );
  }
  bigBrandsList(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.25),
        AnimatedSize(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: Container(
              child: !(shopController.btmNavBarIndex.value == 2)
                  ? Center()
                  :  Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.55,
                  color: Color(0xfff5f5f5),
                  child: Column(
                    children: [
                      GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              // mainAxisSpacing: 20,
                              // crossAxisSpacing: 20,
                              childAspectRatio: 1
                          ),
                          itemCount: homeController.brand.length > 6 ? 6 : homeController.brand.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return OnHover(builder: (isHovered) {
                              return  GestureDetector(
                                onTap: () {
                                  //todo go to brand page
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: isHovered ?
                                            App.primery : Colors.grey
                                        )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    homeController.brand[index].image!
                                                ),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                          }),
                      GestureDetector(
                          onTap: () {
                            //todo go to brand page
                          },
                          child: Text(App_Localization.of(context).translate("show_all_brands"),
                            style: TextStyle(
                                color: App.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                          )
                      ),
                    ],
                  )
              )
          ),
        )
      ],
    );
  }

  ////////////////// Medium //////////////////
  medWedgit(BuildContext context){
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 40),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/image/shop-page.jpg")
                      )
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //todo download from apple
                                },
                                child: Container(
                                    width: 90,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset("assets/image/apple-logo.png",width: 15,height: 15,color: Colors.white,),
                                          Text(App_Localization.of(context).translate("app_store"),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  //todo download from google
                                },
                                child:  Container(
                                    width: 90,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset("assets/image/google-play.png",width: 15,height: 15,),
                                          Text(App_Localization.of(context).translate("app_store"),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Center(
                  child: Text(App_Localization.of(context).translate("download_our_app"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.3),
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
        ),
        // Positioned(child: App.header(context,homeController,myKey),),
        homeController.loading.value
            ? Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: App.primery.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ))
            : const Center()
      ],
    );
  }
  medshopByBetsList(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.2),
        AnimatedSize(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: Container(
              child: !(shopController.btmNavBarIndex.value == 1)
                  ? Center()
                  :  Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.45,
                color: Color(0xfff5f5f5),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        // width: MediaQuery.of(context).size.width * 0.13,
                        child: Column(
                          children: [
                            SizedBox(height: 35),
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: homeController.category.length,
                              itemBuilder: (context,index) {
                                return GestureDetector(
                                  onTap: () {
                                    shopController.selectedCategory.value = index;
                                    print(index);
                                  },
                                  child: Container(
                                    color: index.isOdd ?
                                    Colors.white : Colors.grey[200],
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(homeController.category[index].title.toString(),
                                            style: TextStyle(
                                                fontSize: 12
                                            ),
                                          ),
                                          Icon(Icons.arrow_right,color: App.purple,size: 18,)
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 35,
                            color: App.purple,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
          ),
        )
      ],
    );
  }
  medBrandsList(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.2),
        AnimatedSize(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: Container(
              child: !(shopController.btmNavBarIndex.value == 2)
                  ? Center()
                  :  Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: Color(0xfff5f5f5),
                  child: Column(
                    children: [
                      GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              // mainAxisSpacing: 20,
                              // crossAxisSpacing: 20,
                              childAspectRatio: 1.1
                          ),
                          itemCount: homeController.brand.length > 6 ? 6 : homeController.brand.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return OnHover(builder: (isHovered) {
                              return  GestureDetector(
                                onTap: () {
                                  //todo go to brand page
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: isHovered ?
                                            App.primery : Colors.grey
                                        )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    homeController.brand[index].image!
                                                ),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                          }),
                      GestureDetector(
                          onTap: () {
                            //todo go to brand page
                          },
                          child: Text(App_Localization.of(context).translate("show_all_brands"),
                            style: TextStyle(
                                color: App.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                          )
                      ),
                    ],
                  )
              )
          ),
        )
      ],
    );
  }

}
