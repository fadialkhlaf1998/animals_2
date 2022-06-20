// class test {
//
//
//   static header(BuildContext context,HomeController homeController,GlobalKey<ScaffoldState> globalKey) {
//     return MediaQuery.of(context).size.width>App.extra?extraHeader(context,homeController) :
//     MediaQuery.of(context).size.width>App.xLarge?xlargeHeader(context,homeController) :
//     MediaQuery.of(context).size.width>App.larg?largeHeader(context,homeController)
//         :MediaQuery.of(context).size.width>App.big?bigHeader(context,homeController)
//         :mediumHeader(context,homeController);
//   }
//   static extraHeader(BuildContext context,HomeController homeController){
//     return Container(
//         height: MediaQuery.of(context).size.width * 0.13,
//         width: MediaQuery.of(context).size.width,
//         color: Colors.white,
//         child: Column(
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: 55,
//               color: Colors.grey[900],
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(),
//                     Padding(
//                       padding: const EdgeInsets.all(5),
//                       child: Text(App_Localization.of(context).translate("free_pet_pick_up"),
//                           style: TextStyle(
//                               color: secondry,
//                               fontSize: 25,
//                               fontFamily: "FOUNDRYGRIDNIK"
//                           )),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         if(homeController.openCountry.value == false) {
//                           homeController.openCountry.value = true;
//                         } else {
//                           homeController.openCountry.value = false;
//                         }
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Image.asset("assets/image/Icon_AED.png",
//                             width: 50, height: 50,),
//                           homeController.openCountry.value == false ?
//                           Icon(Icons.arrow_drop_down,color: Colors.white,size: 40,) :
//                           Icon(Icons.arrow_drop_up,color: Colors.white,size: 40)
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: (){
//                     if( homeController.btmNavBarIndex.value == 0 ){
//                       scrollController.animateTo(
//                           scrollController.position.minScrollExtent,
//                           duration: Duration(milliseconds: 500),
//                           curve: Curves.ease);
//                     }else{
//                       homeController.btmNavBarIndex.value = 0 ;
//                     }
//                   },
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.2,
//                     child: Center(
//                       child: Container(
//                         width: MediaQuery.of(context).size.width * 0.13,
//                         height:  MediaQuery.of(context).size.width * 0.13 - 55,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             image: DecorationImage(
//                                 image: AssetImage("assets/image/logo.png"),
//                                 fit: BoxFit.cover
//                             )
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.5,
//                   height: MediaQuery.of(context).size.width * 0.13 - 55,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(height: MediaQuery.of(context).size.width * 0.02),
//                               Container(
//                                 width: MediaQuery.of(context).size.width * 0.4,
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Stack(
//                                       children: [
//                                         Container(
//                                           width: MediaQuery.of(context).size.width * 0.4,
//                                           height: 70,
//                                           decoration: BoxDecoration(
//                                               color: Colors.grey[200],
//                                               borderRadius: BorderRadius.circular(40)
//                                           ),
//                                           child: TextField(
//                                             onSubmitted: (query){
//                                               homeController.search(context, query);
//                                             },
//                                             style: TextStyle(
//                                                 fontSize: 25,
//                                                 fontFamily: "POPPINS"
//                                             ),
//                                             controller: homeController.searchController,
//                                             decoration: InputDecoration(
//                                               enabledBorder:const OutlineInputBorder(
//                                                 // width: 0.0 produces a thin "hairline" border
//                                                 borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
//                                               ),
//                                               focusedBorder: const OutlineInputBorder(
//                                                 // width: 0.0 produces a thin "hairline" border
//                                                 borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
//                                               ),
//                                               hintText: App_Localization.of(context).translate("search"),
//                                               hintStyle: TextStyle(
//                                                   color: Colors.grey[500],
//                                                   fontSize: 25,
//                                                   fontFamily: "POPPINS"
//                                               ),
//                                             ),
//                                             textAlignVertical: TextAlignVertical.bottom,
//                                           ),
//                                         ),
//                                         Positioned(
//                                           right: 0,
//                                           child: GestureDetector(
//                                               onTap: (){
//                                                 homeController.search(context, homeController.searchController.text);
//                                               },
//                                               child: OnHover(
//                                                 builder: (isHover){
//                                                   return Container(
//                                                     width: 90,
//                                                     height: 70,
//                                                     decoration: BoxDecoration(
//                                                         color: isHover?App.lightOrang:App.primery,
//                                                         borderRadius: BorderRadius.only(
//                                                             topRight: Radius.circular(40),
//                                                             bottomRight: Radius.circular(40))
//                                                     ),
//                                                     child: Icon(Icons.search,color: Colors.white,size: 50,),
//                                                   );
//                                                 },
//                                               )
//                                           ),
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.width * 0.01),
//                       Container(
//                         width: MediaQuery.of(context).size.width*0.35,
//                         child: Row(
//                           children: [
//                             Container(
//                               width: MediaQuery.of(context).size.width*0.35,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   titleHeader(context,0,"home",homeController,25),
//                                   titleHeader(context,1,"about",homeController,25),
//                                   titleHeader(context,2,"services",homeController,25),
//                                   titleHeader(context,3,"rates",homeController,25),
//                                   titleHeader(context,4,"gallery",homeController,25),
//                                   titleHeader(context,5,"news",homeController,25),
//                                   titleHeader(context,6,"contact_us",homeController,25),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.width * 0.01),
//                     ],
//                   ),
//                 ),
//                 SizedBox(width: 35,),
//                 Container(
//                   height: MediaQuery.of(context).size.width*0.13 - 55,
//                   width: MediaQuery.of(context).size.width * 0.2,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       GestureDetector(
//                         onTap: (){
//                           Get.to(() => Shop());
//                         },
//                         child: Container(
//                           width: MediaQuery.of(context).size.width * 0.1,
//                           color: purple,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 width: MediaQuery.of(context).size.width * 0.025,
//                                 height: MediaQuery.of(context).size.width * 0.025,
//                                 child: Image.asset("assets/image/Icon_GoToShop.png",
//                                 ),
//                               ),
//                               SizedBox(height: 20),
//                               Center(
//                                   child: Container(
//                                     width: MediaQuery.of(context).size.width * 0.1 / 2,
//                                     child: Text(App_Localization.of(context).translate("go_to_shop").toUpperCase(),
//                                       textAlign: TextAlign.center,
//                                       maxLines: 2,
//                                       style: TextStyle(
//                                           fontFamily: "POPPINS",
//                                           color: Colors.white ,
//                                           fontSize: 25,
//                                           fontWeight: FontWeight.bold,
//                                           height: 1.2
//                                       ),),
//                                   )
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: (){
//                           // homeController.btmNavBarIndex.value = 7;
//                         },
//                         child: Container(
//                             width: MediaQuery.of(context).size.width * 0.1,
//                             color: primery,
//                             child: Padding(
//                               padding: const EdgeInsets.all(10),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     width: MediaQuery.of(context).size.width * 0.025,
//                                     height: MediaQuery.of(context).size.width * 0.025,
//                                     child: Image.asset("assets/image/Icon_Boarding.png",
//                                     ),
//                                   ),
//                                   SizedBox(height: 20),
//                                   Center(
//                                       child: Container(
//                                         width: MediaQuery.of(context).size.width * 0.1/2,
//                                         child: Text(App_Localization.of(context).translate("book_a_boarding").toUpperCase(),
//                                           textAlign: TextAlign.center,
//                                           maxLines: 2,
//                                           style: TextStyle(
//                                               fontFamily: "POPPINS",
//                                               color: Colors.white ,
//                                               fontSize: 25,
//                                               fontWeight: FontWeight.bold,
//                                               height: 1.2
//                                           ),),
//                                       )
//                                   ),
//                                 ],
//                               ),
//                             )
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         )
//     );
//   }
//   static xlargeHeader(BuildContext context,HomeController homeController){
//     return Container(
//         height: MediaQuery.of(context).size.width * 0.12,
//         width: MediaQuery.of(context).size.width,
//         color: Colors.white,
//         child: Column(
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: 40,
//               color: Colors.grey[900],
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(),
//                     Padding(
//                       padding: const EdgeInsets.all(5),
//                       child: Text(App_Localization.of(context).translate("free_pet_pick_up"),
//                           style: TextStyle(
//                               color: secondry,
//                               fontSize: 20,
//                               fontFamily: "FOUNDRYGRIDNIK"
//                           )),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         if(homeController.openCountry.value == false) {
//                           homeController.openCountry.value = true;
//                         } else {
//                           homeController.openCountry.value = false;
//                         }
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Image.asset("assets/image/Icon_AED.png",
//                             width: 35, height: 35,),
//                           homeController.openCountry.value == false ?
//                           Icon(Icons.arrow_drop_down,color: Colors.white,size: 30,) :
//                           Icon(Icons.arrow_drop_up,color: Colors.white,size: 30)
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: (){
//                     if( homeController.btmNavBarIndex.value == 0 ){
//                       scrollController.animateTo(
//                           scrollController.position.minScrollExtent,
//                           duration: Duration(milliseconds: 500),
//                           curve: Curves.ease);
//                     }else{
//                       homeController.btmNavBarIndex.value = 0 ;
//                     }
//                   },
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.2,
//                     child: Center(
//                       child: Container(
//                         width: MediaQuery.of(context).size.width * 0.12,
//                         height:  MediaQuery.of(context).size.width * 0.12 - 40,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             image: DecorationImage(
//                                 image: AssetImage("assets/image/logo.png"),
//                                 fit: BoxFit.cover
//                             )
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.5,
//                   height: MediaQuery.of(context).size.width * 0.12 - 40,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(height: MediaQuery.of(context).size.width * 0.02),
//                               Container(
//                                 width: MediaQuery.of(context).size.width * 0.4,
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Stack(
//                                       children: [
//                                         Container(
//                                           width: MediaQuery.of(context).size.width * 0.4,
//                                           height: 60,
//                                           decoration: BoxDecoration(
//                                               color: Colors.grey[200],
//                                               borderRadius: BorderRadius.circular(40)
//                                           ),
//                                           child: TextField(
//                                             onSubmitted: (query){
//                                               homeController.search(context, query);
//                                             },
//                                             style: TextStyle(
//                                                 fontSize: 20,
//                                                 fontFamily: "POPPINS"
//                                             ),
//                                             controller: homeController.searchController,
//                                             decoration: InputDecoration(
//                                               enabledBorder:const OutlineInputBorder(
//                                                 // width: 0.0 produces a thin "hairline" border
//                                                 borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
//                                               ),
//                                               focusedBorder: const OutlineInputBorder(
//                                                 // width: 0.0 produces a thin "hairline" border
//                                                 borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
//                                               ),
//                                               hintText: App_Localization.of(context).translate("search"),
//                                               hintStyle: TextStyle(
//                                                   color: Colors.grey[500],
//                                                   fontSize: 20,
//                                                   fontFamily: "POPPINS"
//                                               ),
//                                             ),
//                                             textAlignVertical: TextAlignVertical.bottom,
//                                           ),
//                                         ),
//                                         Positioned(
//                                           right: 0,
//                                           child: GestureDetector(
//                                               onTap: (){
//                                                 homeController.search(context, homeController.searchController.text);
//                                               },
//                                               child: OnHover(
//                                                 builder: (isHover){
//                                                   return Container(
//                                                     width: 80,
//                                                     height: 60,
//                                                     decoration: BoxDecoration(
//                                                         color: isHover?App.lightOrang:App.primery,
//                                                         borderRadius: BorderRadius.only(
//                                                             topRight: Radius.circular(40),
//                                                             bottomRight: Radius.circular(40))
//                                                     ),
//                                                     child: Icon(Icons.search,color: Colors.white,size: 40,),
//                                                   );
//                                                 },
//                                               )
//                                           ),
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.width * 0.01),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.35,
//                         child: Row(
//                           children: [
//                             Container(
//                               width: MediaQuery.of(context).size.width*0.35,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   titleHeader(context,0,"home",homeController,20),
//                                   titleHeader(context,1,"about",homeController,20),
//                                   titleHeader(context,2,"services",homeController,20),
//                                   titleHeader(context,3,"rates",homeController,20),
//                                   titleHeader(context,4,"gallery",homeController,20),
//                                   titleHeader(context,5,"news",homeController,20),
//                                   titleHeader(context,6,"contact_us",homeController,20),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.width * 0.01),
//                     ],
//                   ),
//                 ),
//                 SizedBox(width: 35,),
//                 Container(
//                   height: MediaQuery.of(context).size.width*0.12 - 40,
//                   width: MediaQuery.of(context).size.width * 0.2,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       GestureDetector(
//                         onTap: (){
//                           Get.to(() => Shop());
//                         },
//                         child: Container(
//                           width: MediaQuery.of(context).size.width * 0.1,
//                           color: purple,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 width: MediaQuery.of(context).size.width * 0.025,
//                                 height: MediaQuery.of(context).size.width * 0.025,
//                                 child: Image.asset("assets/image/Icon_GoToShop.png",
//                                 ),
//                               ),
//                               SizedBox(height: 20),
//                               Center(
//                                   child: Container(
//                                     width: MediaQuery.of(context).size.width * 0.1 / 2,
//                                     child: Text(App_Localization.of(context).translate("go_to_shop").toUpperCase(),
//                                       textAlign: TextAlign.center,
//                                       maxLines: 2,
//                                       style: TextStyle(
//                                           fontFamily: "POPPINS",
//                                           color: Colors.white ,
//                                           fontSize: 21,
//                                           fontWeight: FontWeight.bold,
//                                           height: 1.2
//                                       ),),
//                                   )
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: (){
//                           // homeController.btmNavBarIndex.value = 7;
//                         },
//                         child: Container(
//                             width: MediaQuery.of(context).size.width * 0.1,
//                             color: primery,
//                             child: Padding(
//                               padding: const EdgeInsets.all(10),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     width: MediaQuery.of(context).size.width * 0.025,
//                                     height: MediaQuery.of(context).size.width * 0.025,
//                                     child: Image.asset("assets/image/Icon_Boarding.png",
//                                     ),
//                                   ),
//                                   SizedBox(height: 20),
//                                   Center(
//                                       child: Container(
//                                         width: MediaQuery.of(context).size.width * 0.1/2,
//                                         child: Text(App_Localization.of(context).translate("book_a_boarding").toUpperCase(),
//                                           textAlign: TextAlign.center,
//                                           maxLines: 2,
//                                           style: TextStyle(
//                                               fontFamily: "POPPINS",
//                                               color: Colors.white ,
//                                               fontSize: 21,
//                                               fontWeight: FontWeight.bold,
//                                               height: 1.2
//                                           ),),
//                                       )
//                                   ),
//                                 ],
//                               ),
//                             )
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         )
//     );
//   }
//   static largeHeader(BuildContext context,HomeController homeController){
//     return Container(
//         height: MediaQuery.of(context).size.width * 0.12,
//         width: MediaQuery.of(context).size.width,
//         color: Colors.white,
//         child: Column(
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: 35,
//               color: Colors.grey[900],
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(),
//                     Padding(
//                       padding: const EdgeInsets.all(5),
//                       child: Text(App_Localization.of(context).translate("free_pet_pick_up"),
//                           style: TextStyle(
//                               color: secondry,
//                               fontSize: 16,
//                               fontFamily: "FOUNDRYGRIDNIK"
//                           )),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         if(homeController.openCountry.value == false) {
//                           homeController.openCountry.value = true;
//                         } else {
//                           homeController.openCountry.value = false;
//                         }
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Image.asset("assets/image/Icon_AED.png",
//                             width: 30, height: 30,),
//                           homeController.openCountry.value == false ?
//                           Icon(Icons.arrow_drop_down,color: Colors.white,size: 25,) :
//                           Icon(Icons.arrow_drop_up,color: Colors.white,size: 25,)
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: (){
//                     if( homeController.btmNavBarIndex.value == 0 ){
//                       scrollController.animateTo(
//                           scrollController.position.minScrollExtent,
//                           duration: Duration(milliseconds: 500),
//                           curve: Curves.ease);
//                     }else{
//                       homeController.btmNavBarIndex.value = 0 ;
//                     }
//                   },
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.2,
//                     child: Center(
//                       child: Container(
//                         width: MediaQuery.of(context).size.width * 0.12,
//                         height:  MediaQuery.of(context).size.width * 0.12 - 35,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             image: DecorationImage(
//                                 image: AssetImage("assets/image/logo.png"),
//                                 fit: BoxFit.cover
//                             )
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.5,
//                   height: MediaQuery.of(context).size.width * 0.12 - 35,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(height: MediaQuery.of(context).size.width * 0.02),
//                               Container(
//                                 width: MediaQuery.of(context).size.width * 0.4,
//                                 height: 40,
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Stack(
//                                       children: [
//                                         Container(
//                                           width: MediaQuery.of(context).size.width * 0.4,
//                                           decoration: BoxDecoration(
//                                               color: Colors.grey[200],
//                                               borderRadius: BorderRadius.circular(20)
//                                           ),
//                                           child: TextField(
//                                             onSubmitted: (query){
//                                               homeController.search(context, query);
//                                             },
//                                             style: TextStyle(
//                                                 fontSize: 16,
//                                                 fontFamily: "POPPINS"
//                                             ),
//                                             controller: homeController.searchController,
//                                             decoration: InputDecoration(
//                                               enabledBorder:const OutlineInputBorder(
//                                                 // width: 0.0 produces a thin "hairline" border
//                                                 borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
//                                               ),
//                                               focusedBorder: const OutlineInputBorder(
//                                                 // width: 0.0 produces a thin "hairline" border
//                                                 borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
//                                               ),
//                                               hintText: App_Localization.of(context).translate("search"),
//                                               hintStyle: TextStyle(
//                                                   color: Colors.grey[500],
//                                                   fontSize: 16,
//                                                   fontFamily: "POPPINS"
//                                               ),
//                                             ),
//                                             textAlignVertical: TextAlignVertical.bottom,
//                                           ),
//                                         ),
//                                         Positioned(
//                                           right: 0,
//                                           child: GestureDetector(
//                                               onTap: (){
//                                                 homeController.search(context, homeController.searchController.text);
//                                               },
//                                               child: OnHover(
//                                                 builder: (isHover){
//                                                   return Container(
//                                                     height: 40,
//                                                     width: 45,
//                                                     decoration: BoxDecoration(
//                                                         color: isHover?App.lightOrang:App.primery,
//                                                         borderRadius: BorderRadius.only(
//                                                             topRight: Radius.circular(20),
//                                                             bottomRight: Radius.circular(20))
//                                                     ),
//                                                     child: Icon(Icons.search,color: Colors.white,),
//                                                   );
//                                                 },
//                                               )
//                                           ),
//
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.width * 0.01),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.35,
//                         child: Row(
//                           children: [
//                             Container(
//                               width: MediaQuery.of(context).size.width*0.35,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   titleHeader(context,0,"home",homeController,largeFontSize(MediaQuery.of(context).size.width)),
//                                   titleHeader(context,1,"about",homeController,largeFontSize(MediaQuery.of(context).size.width)),
//                                   titleHeader(context,2,"services",homeController,largeFontSize(MediaQuery.of(context).size.width)),
//                                   titleHeader(context,3,"rates",homeController,largeFontSize(MediaQuery.of(context).size.width)),
//                                   titleHeader(context,4,"gallery",homeController,largeFontSize(MediaQuery.of(context).size.width)),
//                                   titleHeader(context,5,"news",homeController,largeFontSize(MediaQuery.of(context).size.width)),
//                                   titleHeader(context,6,"contact_us",homeController,largeFontSize(MediaQuery.of(context).size.width)),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.width * 0.01),
//                     ],
//                   ),
//                 ),
//                 SizedBox(width: 35,),
//                 Container(
//                   height: MediaQuery.of(context).size.width*0.12 - 35,
//                   width: MediaQuery.of(context).size.width * 0.2,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       GestureDetector(
//                         onTap: (){
//                           Get.to(() => Shop());
//                         },
//                         child: Container(
//                           width: MediaQuery.of(context).size.width * 0.1,
//                           color: purple,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 width: MediaQuery.of(context).size.width * 0.025,
//                                 height: MediaQuery.of(context).size.width * 0.025,
//                                 child: Image.asset("assets/image/Icon_GoToShop.png",
//                                 ),
//                               ),
//                               SizedBox(height: 15),
//                               Center(
//                                   child: Container(
//                                     width: MediaQuery.of(context).size.width * 0.1 / 2,
//                                     child: Text(App_Localization.of(context).translate("go_to_shop").toUpperCase(),
//                                       textAlign: TextAlign.center,
//                                       maxLines: 2,
//                                       style: TextStyle(
//                                           color: Colors.white ,
//                                           fontSize: 17,
//                                           fontWeight: FontWeight.bold,
//                                           height: 1.2,
//                                           fontFamily: "POPPINS"
//                                       ),),
//                                   )
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: (){
//                           // homeController.btmNavBarIndex.value = 7;
//                         },
//                         child: Container(
//                             width: MediaQuery.of(context).size.width * 0.1,
//                             color: primery,
//                             child: Padding(
//                               padding: const EdgeInsets.all(10),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     width: MediaQuery.of(context).size.width * 0.025,
//                                     height: MediaQuery.of(context).size.width * 0.025,
//                                     child: Image.asset("assets/image/Icon_Boarding.png",
//                                     ),
//                                   ),
//                                   SizedBox(height: 15),
//                                   Center(
//                                       child: Container(
//                                         width: MediaQuery.of(context).size.width * 0.1/2,
//                                         child: Text(App_Localization.of(context).translate("book_a_boarding").toUpperCase(),
//                                           textAlign: TextAlign.center,
//                                           maxLines: 2,
//                                           style: TextStyle(
//                                               color: Colors.white ,
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.bold,
//                                               height: 1.2,
//                                               fontFamily: "POPPINS"
//                                           ),),
//                                       )
//                                   ),
//                                 ],
//                               ),
//                             )
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         )
//     );
//   }
//   static bigHeader(BuildContext context,HomeController homeController){
//     return Container(
//         height: MediaQuery.of(context).size.width * 0.13,
//         width: MediaQuery.of(context).size.width,
//         color: Colors.white,
//         child: Column(
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: 30,
//               color: Colors.grey[900],
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(),
//                     Padding(
//                       padding: const EdgeInsets.all(5),
//                       child: Text(App_Localization.of(context).translate("free_pet_pick_up"),
//                           style: TextStyle(color: secondry,
//                               fontSize: 12,
//                               fontFamily: "FOUNDRYGRIDNIK"
//                           )),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         if(homeController.openCountry.value == false) {
//                           homeController.openCountry.value = true;
//                         } else {
//                           homeController.openCountry.value = false;
//                         }
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Image.asset("assets/image/Icon_AED.png",
//                               width: 25, height: 25),
//                           homeController.openCountry.value == false ?
//                           Icon(Icons.arrow_drop_down,color: Colors.white,size: 20,) :
//                           Icon(Icons.arrow_drop_up,color: Colors.white,size: 20)
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: (){
//                     if( homeController.btmNavBarIndex.value == 0 ){
//                       scrollController.animateTo(
//                           scrollController.position.minScrollExtent,
//                           duration: Duration(milliseconds: 500),
//                           curve: Curves.ease);
//                     }else{
//                       homeController.btmNavBarIndex.value = 0 ;
//                     }
//                   },
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.2,
//                     child: Center(
//                       child: Container(
//                         width: MediaQuery.of(context).size.width * 0.13,
//                         height:  MediaQuery.of(context).size.width * 0.13 - 30,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             image: DecorationImage(
//                                 image: AssetImage("assets/image/logo.png"),
//                                 fit: BoxFit.cover
//                             )
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.5,
//                   height: MediaQuery.of(context).size.width * 0.13 - 30,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(height: MediaQuery.of(context).size.width * 0.02),
//                               Container(
//                                 width: MediaQuery.of(context).size.width * 0.45,
//                                 height: 35,
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Stack(
//                                       children: [
//                                         Container(
//                                           width: MediaQuery.of(context).size.width * 0.45,
//                                           decoration: BoxDecoration(
//                                               color: Colors.grey[200],
//                                               borderRadius: BorderRadius.circular(20)
//                                           ),
//                                           child: TextField(
//                                             onSubmitted: (query){
//                                               homeController.search(context, query);
//                                             },
//                                             style: TextStyle(
//                                                 fontSize: 12,
//                                                 fontFamily: "POPPINS"
//                                             ),
//                                             controller: homeController.searchController,
//                                             decoration: InputDecoration(
//                                               enabledBorder:const OutlineInputBorder(
//                                                 // width: 0.0 produces a thin "hairline" border
//                                                 borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
//                                               ),
//                                               focusedBorder: const OutlineInputBorder(
//                                                 // width: 0.0 produces a thin "hairline" border
//                                                 borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
//                                               ),
//                                               hintText: App_Localization.of(context).translate("search"),
//                                               hintStyle: TextStyle(
//                                                   color: Colors.grey[500],
//                                                   fontSize: 12,
//                                                   fontFamily: "POPPINS"
//                                               ),
//                                             ),
//                                             textAlignVertical: TextAlignVertical.bottom,
//                                           ),
//                                         ),
//                                         Positioned(
//                                           right: 0,
//                                           child: GestureDetector(
//                                               onTap: (){
//                                                 homeController.search(context, homeController.searchController.text);
//                                               },
//                                               child: OnHover(
//                                                 builder: (isHover){
//                                                   return Container(
//                                                     height: 35,
//                                                     width: 40,
//                                                     decoration: BoxDecoration(
//                                                         color: isHover?App.lightOrang:App.primery,
//                                                         borderRadius: BorderRadius.only(
//                                                             topRight: Radius.circular(20),
//                                                             bottomRight: Radius.circular(20))
//                                                     ),
//                                                     child: Icon(Icons.search,color: Colors.white,),
//                                                   );
//                                                 },
//                                               )
//                                           ),
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.width * 0.01),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.4,
//                         child: Row(
//                           children: [
//                             Container(
//                               width: MediaQuery.of(context).size.width*0.4,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   titleHeader(context,0,"home",homeController,12),
//                                   titleHeader(context,1,"about",homeController,12),
//                                   titleHeader(context,2,"services",homeController,12),
//                                   titleHeader(context,3,"rates",homeController,12),
//                                   titleHeader(context,4,"gallery",homeController,12),
//                                   titleHeader(context,5,"news",homeController,12),
//                                   titleHeader(context,6,"contact_us",homeController,12),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.width * 0.01),
//                     ],
//                   ),
//                 ),
//                 SizedBox(width: 10,),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.2,
//                   height: MediaQuery.of(context).size.width * 0.13 - 30,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       GestureDetector(
//                         onTap: (){
//                           Get.to(() => Shop());
//                         },
//                         child: Container(
//                             width: MediaQuery.of(context).size.width * 0.1,
//                             color: purple,
//                             child: Padding(
//                               padding: const EdgeInsets.all(10),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     width: MediaQuery.of(context).size.width * 0.025,
//                                     height: MediaQuery.of(context).size.width * 0.025,
//                                     child: Image.asset("assets/image/Icon_GoToShop.png",
//                                     ),
//                                   ),
//                                   SizedBox(height: 15,),
//                                   Center(
//                                       child: Container(
//                                         width: MediaQuery.of(context).size.width * 0.1 / 2,
//                                         child: Text(App_Localization.of(context).translate("go_to_shop").toUpperCase(),
//                                           textAlign: TextAlign.center,
//                                           maxLines: 2,
//                                           style: TextStyle(
//                                               color: Colors.white ,
//                                               fontSize: 13,
//                                               fontWeight: FontWeight.bold,
//                                               height: 1.2,
//                                               fontFamily: "POPPINS"
//                                           ),),
//                                       )
//                                   )
//                                 ],
//                               ),
//                             )
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: (){
//                           // homeController.btmNavBarIndex.value = 7;
//                         },
//                         child: Container(
//                             width: MediaQuery.of(context).size.width * 0.1,
//                             color: primery,
//                             child: Padding(
//                               padding: const EdgeInsets.all(10),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     width: MediaQuery.of(context).size.width * 0.025,
//                                     height: MediaQuery.of(context).size.width * 0.025,
//                                     child: Image.asset("assets/image/Icon_Boarding.png",
//                                     ),
//                                   ),
//                                   SizedBox(height: 15,),
//                                   Center(
//                                       child: Container(
//                                         width: MediaQuery.of(context).size.width * 0.12/2,
//                                         child: Text(App_Localization.of(context).translate("book_a_boarding").toUpperCase(),
//                                           textAlign: TextAlign.center,
//                                           maxLines: 2,
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 13,
//                                               fontWeight: FontWeight.bold,
//                                               height: 1.2,
//                                               fontFamily: "POPPINS"
//                                           ),),
//                                       )
//                                   ),
//                                 ],
//                               ),
//                             )
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         )
//     );
//   }
//   static mediumHeader(BuildContext context,HomeController homeController){
//     return Container(
//         height: MediaQuery.of(context).size.width * 0.15,
//         width: MediaQuery.of(context).size.width,
//         color: Colors.white,
//         child: Column(
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: 25,
//               color: Colors.grey[900],
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(),
//                     Padding(
//                       padding: const EdgeInsets.all(5),
//                       child: Text(App_Localization.of(context).translate("free_pet_pick_up"),
//                           style: TextStyle(color: secondry,
//                               fontSize: 10,
//                               fontFamily: "FOUNDRYGRIDNIK"
//                           )),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         if(homeController.openCountry.value == false) {
//                           homeController.openCountry.value = true;
//                         } else {
//                           homeController.openCountry.value = false;
//                         }
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Image.asset("assets/image/Icon_AED.png",
//                               width: 20, height: 20),
//                           homeController.openCountry.value == false ?
//                           Icon(Icons.arrow_drop_down,color: Colors.white,size: 15,) :
//                           Icon(Icons.arrow_drop_up,color: Colors.white,size: 15)
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: (){
//                     if( homeController.btmNavBarIndex.value == 0 ){
//                       scrollController.animateTo(
//                           scrollController.position.minScrollExtent,
//                           duration: Duration(milliseconds: 500),
//                           curve: Curves.ease);
//                     }else{
//                       homeController.btmNavBarIndex.value = 0 ;
//                     }
//                   },
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.2,
//                     child: Center(
//                       child: Container(
//                         width: MediaQuery.of(context).size.width * 0.15,
//                         height:  MediaQuery.of(context).size.width * 0.15 - 25,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             image: DecorationImage(
//                                 image: AssetImage("assets/image/logo.png"),
//                                 fit: BoxFit.cover
//                             )
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.5,
//                   height: MediaQuery.of(context).size.width * 0.15 - 25,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(height: MediaQuery.of(context).size.width * 0.02),
//                               Container(
//                                 width: MediaQuery.of(context).size.width * 0.45,
//                                 height: 30,
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Stack(
//                                       children: [
//                                         Container(
//                                           width: MediaQuery.of(context).size.width * 0.43,
//                                           decoration: BoxDecoration(
//                                               color: Colors.grey[200],
//                                               borderRadius: BorderRadius.circular(20)
//                                           ),
//                                           child: TextField(
//                                             onSubmitted: (query){
//                                               homeController.search(context, query);
//                                             },
//                                             style: TextStyle(
//                                                 fontSize: 10,
//                                                 fontFamily: "POPPINS"
//                                             ),
//                                             controller: homeController.searchController,
//                                             decoration: InputDecoration(
//                                               enabledBorder:const OutlineInputBorder(
//                                                 // width: 0.0 produces a thin "hairline" border
//                                                 borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
//                                               ),
//                                               focusedBorder: const OutlineInputBorder(
//                                                 // width: 0.0 produces a thin "hairline" border
//                                                 borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
//                                               ),
//                                               hintText: App_Localization.of(context).translate("search"),
//                                               hintStyle: TextStyle(
//                                                   color: Colors.grey[500],
//                                                   fontSize: 10,
//                                                   fontFamily: "POPPINS"
//                                               ),
//                                             ),
//                                             textAlignVertical: TextAlignVertical.bottom,
//                                           ),
//                                         ),
//                                         Positioned(
//                                           right: 0,
//                                           child: GestureDetector(
//                                               onTap: (){
//                                                 homeController.search(context, homeController.searchController.text);
//                                               },
//                                               child: OnHover(
//                                                 builder: (isHover){
//                                                   return Container(
//                                                     height: 30,
//                                                     width: 40,
//                                                     decoration: BoxDecoration(
//                                                         color: isHover?App.lightOrang:App.primery,
//                                                         borderRadius: BorderRadius.only(
//                                                             topRight: Radius.circular(20),
//                                                             bottomRight: Radius.circular(20))
//                                                     ),
//                                                     child: Icon(Icons.search,color: Colors.white,size: 20,),
//                                                   );
//                                                 },
//                                               )
//                                           ),
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 5),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.4,
//                         child: Row(
//                           children: [
//                             Container(
//                               width: MediaQuery.of(context).size.width*0.4,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   titleHeader(context,0,"home",homeController,9),
//                                   titleHeader(context,1,"about",homeController,9),
//                                   titleHeader(context,2,"services",homeController,9),
//                                   titleHeader(context,3,"rates",homeController,9),
//                                   titleHeader(context,4,"gallery",homeController,9),
//                                   titleHeader(context,5,"news",homeController,9),
//                                   titleHeader(context,6,"contact_us",homeController,9),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.22,
//                   height: MediaQuery.of(context).size.width * 0.15 - 25,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       GestureDetector(
//                         onTap: (){
//                           Get.to(() => Shop());
//                         },
//                         child: Container(
//                             width: MediaQuery.of(context).size.width * 0.22/2,
//                             color: purple,
//                             child: Padding(
//                               padding: const EdgeInsets.all(10),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     width: MediaQuery.of(context).size.width * 0.025,
//                                     height: MediaQuery.of(context).size.width * 0.025,
//                                     child: Image.asset("assets/image/Icon_GoToShop.png",
//                                     ),
//                                   ),
//                                   SizedBox(height: 10,),
//                                   Center(
//                                       child: Container(
//                                         width: MediaQuery.of(context).size.width * 0.1 / 2,
//                                         child: Text(App_Localization.of(context).translate("go_to_shop").toUpperCase(),
//                                           textAlign: TextAlign.center,
//                                           maxLines: 2,
//                                           style: TextStyle(
//                                               color: Colors.white ,
//                                               fontSize: 10,
//                                               fontWeight: FontWeight.bold,
//                                               height: 1.2,
//                                               fontFamily: "POPPINS"
//                                           ),),
//                                       )
//                                   )
//                                 ],
//                               ),
//                             )
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: (){
//                           // homeController.btmNavBarIndex.value = 7;
//                         },
//                         child: Container(
//                             width: MediaQuery.of(context).size.width * 0.22/2,
//                             color: primery,
//                             child: Padding(
//                               padding: const EdgeInsets.all(10),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     width: MediaQuery.of(context).size.width * 0.025,
//                                     height: MediaQuery.of(context).size.width * 0.025,
//                                     child: Image.asset("assets/image/Icon_Boarding.png",
//                                     ),
//                                   ),
//                                   SizedBox(height: 10,),
//                                   Center(
//                                       child: Container(
//                                         width: MediaQuery.of(context).size.width,
//                                         child: Text(App_Localization.of(context).translate("book_a_boarding").toUpperCase(),
//                                           textAlign: TextAlign.center,
//                                           maxLines: 2,
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 10,
//                                               fontWeight: FontWeight.bold,
//                                               height: 1.2,
//                                               fontFamily: "POPPINS"
//                                           ),),
//                                       )
//                                   ),
//                                 ],
//                               ),
//                             )
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         )
//     );
//   }
//   static titleHeader(BuildContext context,int index,String title,HomeController homeController,double font){
//     return GestureDetector(
//       onTap: (){
//         Get.back();
//         Get.back();
//         Get.back();
//         Get.back();
//         homeController.btmNavBarIndex.value = index;
//         // if(homeController.btmNavBarIndex.value == 5){
//         //   homeController.openNews.value = -1;
//         // }else{
//         //   homeController.openNews.value = 5;
//         // }
//       },
//       child: OnHover(builder: (isHovered){
//         return Container(
//           child: Center(child: Text(
//               App_Localization.of(context).translate(title).toUpperCase(),
//               style: TextStyle(
//                   color: index == homeController.btmNavBarIndex.value||isHovered ?App.primery: Colors.black,
//                   fontSize: font,
//                   fontFamily: "POPPINS",
//                   fontWeight: FontWeight.w500),maxLines: 1),
//           ),
//         );
//       }),
//     );
//   }
// }