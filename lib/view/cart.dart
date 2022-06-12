import 'package:animals/controller/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animals/app_localization.dart';
import 'package:animals/controller/cart_contoller.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/helper/api.dart';
import 'package:animals/helper/app.dart';
import 'package:animals/model/line_item.dart';
import 'package:animals/model/post.dart';
import 'package:animals/view/checkout.dart';
import 'package:animals/view/login.dart';

class Cart extends StatelessWidget {
  final HomeController homeController = Get.find();
  final CartController cartController = Get.find();
  final ShopController shopController = Get.find();

  final GlobalKey<ScaffoldState> myKey = GlobalKey();

  Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        key: myKey,
        endDrawer: App.myDrawer(context, homeController,myKey),
        body: RefreshIndicator(
          onRefresh: ()async{
            Get.offAllNamed("/");
          },
          child: SafeArea(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: MediaQuery.of(context).size.width>App.larg?_lgWedget(context)
                        :MediaQuery.of(context).size.width>App.big?_bgWedget(context)
                        :MediaQuery.of(context).size.width>App.mid?_mdWedget(context)
                        :MediaQuery.of(context).size.width>App.small?_smWedget(context):_xsmWedget(context),
                  ),
                  Positioned(child: App.shopHeader(context,shopController, homeController,myKey)),
                  cartController.loading.value
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
              ),
            ),
          ),
        ),
      );
    });
  }
  _lgWedget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.15,),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cartController.fake.value?const Center():const Center(),
                const SizedBox(height: 5,),cartController.cart.isNotEmpty?lgCartList(cart:cartController.cart,width: MediaQuery.of(context).size.width*0.5,context: context):isEmpty(context),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    cartController.cart.isNotEmpty?SizedBox(
                      width: MediaQuery.of(context).size.width*0.18,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          SizedBox(
                            width:MediaQuery.of(context).size.width*0.18,
                            child: Text(App_Localization.of(context).translate("order_summery"),style: const TextStyle(color: App.green,fontWeight: FontWeight.bold,fontSize: 25),maxLines: 1),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width*0.18,
                            color: Colors.grey,
                            child: const Divider(color: Colors.grey,height: 1),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          linearDashed(context, App_Localization.of(context).translate("sub_total"),cartController.subTotal.value.toStringAsFixed(2),MediaQuery.of(context).size.width*0.18,15),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          linearDashed(context, App_Localization.of(context).translate("shipping"),"Free",MediaQuery.of(context).size.width*0.18,15),
                          cartController.discount.value==0?const Center():SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          cartController.discount.value==0?const Center():linearDashed(context, App_Localization.of(context).translate("discount"),cartController.discount.value.toStringAsFixed(2),MediaQuery.of(context).size.width*0.18,15),
                          cartController.discount.value==0?const Center():SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          cartController.discount.value==0?const Center():linearDashed(context, App_Localization.of(context).translate("coupon"),cartController.coupon.value.toStringAsFixed(2),MediaQuery.of(context).size.width*0.18,15),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01/2,),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width*0.18,
                            color: Colors.grey,
                            child: const Divider(color: Colors.grey,height: 1),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01/2,),
                          linearDashed(context, App_Localization.of(context).translate("total"),cartController.total.value.toStringAsFixed(2),MediaQuery.of(context).size.width*0.18,15),

                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          Container(
                            width: MediaQuery.of(context).size.width*0.18,
                            height: MediaQuery.of(context).size.width*0.18/6,
                            decoration: BoxDecoration(
                                color: App.primery,
                                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.18/6/2)
                            ),
                            child: Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width*0.18/3,
                                child: Center(child: Text(App_Localization.of(context).translate("checkout"),style: const TextStyle(color: Colors.white,fontSize: 20),softWrap: true)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ):const Center(),
                  ],
                )
              ],
            ),
          ),
          App.footer(context,homeController),
        ],
      ),
    );
  }
  _bgWedget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.15,),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cartController.fake.value?const Center():const Center(),
                const SizedBox(height: 5,),cartController.cart.isNotEmpty?bgCartList(cart:cartController.cart,width: MediaQuery.of(context).size.width*0.5,context: context):isEmpty(context),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    cartController.cart.isNotEmpty?SizedBox(
                      width: MediaQuery.of(context).size.width*0.18,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          SizedBox(
                            width:MediaQuery.of(context).size.width*0.18,
                            child: Text(App_Localization.of(context).translate("order_summery"),style: const TextStyle(color: App.green,fontWeight: FontWeight.bold,fontSize: 20),maxLines: 1),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width*0.18,
                            color: Colors.grey,
                            child: const Divider(color: Colors.grey,height: 1),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          linearDashed(context, App_Localization.of(context).translate("sub_total"),cartController.subTotal.value.toStringAsFixed(2),MediaQuery.of(context).size.width*0.18,13),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          linearDashed(context, App_Localization.of(context).translate("shipping"),"Free",MediaQuery.of(context).size.width*0.18,13),
                          cartController.discount.value==0?const Center():SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          cartController.discount.value==0?const Center():linearDashed(context, App_Localization.of(context).translate("discount"),cartController.discount.value.toStringAsFixed(2),MediaQuery.of(context).size.width*0.18,13),
                          cartController.discount.value==0?const Center():SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          cartController.discount.value==0?const Center():linearDashed(context, App_Localization.of(context).translate("coupon"),cartController.coupon.value.toStringAsFixed(2),MediaQuery.of(context).size.width*0.18,13),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01/2,),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width*0.18,
                            color: Colors.grey,
                            child: const Divider(color: Colors.grey,height: 1),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01/2,),
                          linearDashed(context, App_Localization.of(context).translate("total"),cartController.total.value.toStringAsFixed(2),MediaQuery.of(context).size.width*0.18,14),

                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          Container(
                            width: MediaQuery.of(context).size.width*0.18,
                            height: MediaQuery.of(context).size.width*0.18/6,
                            decoration: BoxDecoration(
                                color: App.primery,
                                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.18/6/2)
                            ),
                            child: Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width*0.18/3,
                                child: Center(child: Text(App_Localization.of(context).translate("checkout"),style: const TextStyle(color: Colors.white,fontSize: 14),softWrap: true)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ):const Center(),
                  ],
                )
              ],
            ),
          ),
          App.footer(context,homeController),
        ],
      ),
    );
  }
  _mdWedget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.15,),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cartController.fake.value?const Center():const Center(),
                const SizedBox(height: 5,),cartController.cart.isNotEmpty?mdCartList(cart:cartController.cart,width: MediaQuery.of(context).size.width*0.7,context: context):isEmpty(context),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    cartController.cart.isNotEmpty?SizedBox(
                      width: MediaQuery.of(context).size.width*0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          SizedBox(
                            width:MediaQuery.of(context).size.width*0.5,
                            child: Text(App_Localization.of(context).translate("order_summery"),style: const TextStyle(color: App.green,fontWeight: FontWeight.bold,fontSize: 15),maxLines: 1),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width*0.5,
                            color: Colors.grey,
                            child: const Divider(color: Colors.grey,height: 1),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          linearDashed(context, App_Localization.of(context).translate("sub_total"),cartController.subTotal.value.toStringAsFixed(2),MediaQuery.of(context).size.width*0.5,11),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          linearDashed(context, App_Localization.of(context).translate("shipping"),"Free",MediaQuery.of(context).size.width*0.5,11),
                          cartController.discount.value==0?const Center():SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          cartController.discount.value==0?const Center():linearDashed(context, App_Localization.of(context).translate("discount"),cartController.discount.value.toStringAsFixed(2),MediaQuery.of(context).size.width*0.5,11),
                          cartController.discount.value==0?const Center():SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          cartController.discount.value==0?const Center():linearDashed(context, App_Localization.of(context).translate("coupon"),cartController.coupon.value.toStringAsFixed(2),MediaQuery.of(context).size.width*0.5,11),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01/2,),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width*0.5,
                            color: Colors.grey,
                            child: const Divider(color: Colors.grey,height: 1),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01/2,),
                          linearDashed(context, App_Localization.of(context).translate("total"),cartController.total.value.toStringAsFixed(2),MediaQuery.of(context).size.width*0.5,12),

                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width*0.18,
                                height: MediaQuery.of(context).size.width*0.18/6,
                                decoration: BoxDecoration(
                                    color: App.primery,
                                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.18/6/2)
                                ),
                                child: Center(
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width*0.18/3,
                                    child: Center(child: Text(App_Localization.of(context).translate("checkout"),style: const TextStyle(color: Colors.white,fontSize: 10),softWrap: true)),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ):const Center(),
                  ],
                )
              ],
            ),
          ),
          App.footer(context,homeController),
        ],
      ),
    );
  }
  _smWedget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.15,),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cartController.fake.value?const Center():const Center(),
                const SizedBox(height: 5,),cartController.cart.isNotEmpty?smCartList(cart:cartController.cart,width: MediaQuery.of(context).size.width*0.7,context: context):isEmpty(context),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    cartController.cart.isNotEmpty?SizedBox(
                      width: MediaQuery.of(context).size.width*0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          SizedBox(
                            width:MediaQuery.of(context).size.width*0.5,
                            child: Text(App_Localization.of(context).translate("order_summery"),style: const TextStyle(color: App.green,fontWeight: FontWeight.bold,fontSize: 15),maxLines: 1),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width*0.5,
                            color: Colors.grey,
                            child: const Divider(color: Colors.grey,height: 1),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          linearDashed(context, App_Localization.of(context).translate("sub_total"),cartController.subTotal.value.toStringAsFixed(2),MediaQuery.of(context).size.width*0.5,11),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          linearDashed(context, App_Localization.of(context).translate("shipping"),"Free",MediaQuery.of(context).size.width*0.5,11),
                          cartController.discount.value==0?const Center():SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          cartController.discount.value==0?const Center():linearDashed(context, App_Localization.of(context).translate("discount"),cartController.discount.value.toStringAsFixed(2),MediaQuery.of(context).size.width*0.5,11),
                          cartController.discount.value==0?const Center():SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          cartController.discount.value==0?const Center():linearDashed(context, App_Localization.of(context).translate("coupon"),cartController.coupon.value.toStringAsFixed(2),MediaQuery.of(context).size.width*0.5,11),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01/2,),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width*0.5,
                            color: Colors.grey,
                            child: const Divider(color: Colors.grey,height: 1),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01/2,),
                          linearDashed(context, App_Localization.of(context).translate("total"),cartController.total.value.toStringAsFixed(2),MediaQuery.of(context).size.width*0.5,12),

                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width*0.18,
                                height: MediaQuery.of(context).size.width*0.18/6,
                                decoration: BoxDecoration(
                                    color: App.primery,
                                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.18/6/2)
                                ),
                                child: Center(
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width*0.18/3,
                                    child: Center(child: Text(App_Localization.of(context).translate("checkout"),style: const TextStyle(color: Colors.white,fontSize: 10),softWrap: true)),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ):const Center(),
                  ],
                )
              ],
            ),
          ),
          App.footer(context,homeController),
        ],
      ),
    );
  }
  _xsmWedget(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.15,),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cartController.fake.value?const Center():const Center(),
                const SizedBox(height: 5,),cartController.cart.isNotEmpty?xsmCartList(cart:cartController.cart,width: MediaQuery.of(context).size.width*0.7,context: context):isEmpty(context),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    cartController.cart.isNotEmpty?SizedBox(
                      width: MediaQuery.of(context).size.width*0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          SizedBox(
                            width:MediaQuery.of(context).size.width*0.7,
                            child: Text(App_Localization.of(context).translate("order_summery"),style: const TextStyle(color: App.green,fontWeight: FontWeight.bold,fontSize: 12),maxLines: 1),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width*0.7,
                            color: Colors.grey,
                            child: const Divider(color: Colors.grey,height: 1),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          linearDashed(context, App_Localization.of(context).translate("sub_total"),cartController.subTotal.value.toStringAsFixed(2),MediaQuery.of(context).size.width*0.7,11),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          linearDashed(context, App_Localization.of(context).translate("shipping"),"Free",MediaQuery.of(context).size.width*0.7,11),
                          cartController.discount.value==0?const Center():SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          cartController.discount.value==0?const Center():linearDashed(context, App_Localization.of(context).translate("discount"),cartController.discount.value.toStringAsFixed(2),MediaQuery.of(context).size.width*0.7,11),
                          cartController.discount.value==0?const Center():SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          cartController.discount.value==0?const Center():linearDashed(context, App_Localization.of(context).translate("coupon"),cartController.coupon.value.toStringAsFixed(2),MediaQuery.of(context).size.width*0.7,11),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01/2,),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width*0.7,
                            color: Colors.grey,
                            child: const Divider(color: Colors.grey,height: 1),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width*0.01/2,),
                          linearDashed(context, App_Localization.of(context).translate("total"),cartController.total.value.toStringAsFixed(2),MediaQuery.of(context).size.width*0.7,12),

                          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width*0.25,
                                height: MediaQuery.of(context).size.width*0.25/6,
                                decoration: BoxDecoration(
                                    color: App.primery,
                                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.18/6/2)
                                ),
                                child: Center(
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width*0.25/2,
                                    child: Center(child: Text(App_Localization.of(context).translate("checkout"),style: const TextStyle(color: Colors.white,fontSize: 9),softWrap: true)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                        ],
                      ),
                    ):const Center(),
                  ],
                )
              ],
            ),
          ),
          App.footer(context,homeController),
        ],
      ),
    );
  }
  discountTextField(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextField(
              onChanged: (query) {
                // checkoutController.fake.value = !checkoutController.fake.value;
              },
              controller: cartController.discountCode,
              decoration: InputDecoration(
                label: Text(
                  App_Localization.of(context).translate("discount_code"),
                  style: const TextStyle(fontSize: 13),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              cartController.activeDiscountCode(context);
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  App_Localization.of(context).translate("apply"),
                  style: const TextStyle(color: App.primery),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  lgCartList({required BuildContext context, required List<LineItem> cart, required double width}) {
    return SizedBox(
      width: width,
      child: Column(

        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          SizedBox(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(App_Localization.of(context).translate("my_cart"),style: const TextStyle(color: App.green,fontSize: 25,fontWeight: FontWeight.bold),maxLines: 1,),
                GestureDetector(
                  onTap: (){
                    homeController.btmNavBarIndex.value = 0;
                  },
                  child: Text(App_Localization.of(context).translate("contenue_shopping"),style: const TextStyle(color: App.primery,fontSize: 25),maxLines: 1,),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          Container(
            height: 1,
            width: width,
            color: Colors.grey,
            child: const Divider(color: Colors.grey,height: 1),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cart.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // homeController.doFunction(op, cart[index].post.id, context);
                  },
                  child: Container(
                    width: width,
                    height: width/3+10,
                    margin: const EdgeInsets.only(bottom: 2),

                    child: Column(
                      children: [
                        SizedBox(
                          width: width,
                          height: width/3,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all( MediaQuery.of(context).size.width*0.02),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black54),
                                          color: App.grey,
                                          image: DecorationImage(
                                              image: NetworkImage(cart[index]
                                                  .post
                                                  .image!
                                                  .replaceAll("localhost", "10.0.2.2")),
                                              fit: BoxFit.fill)),
                                    ),
                                  )),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(cart[index].post.title!.toString() +
                                              " " +
                                              App_Localization.of(context)
                                                  .translate("aed"),style: TextStyle(fontSize: 20,color: Colors.grey[700]),maxLines: 1,),

                                          GestureDetector(
                                            onTap: (){
                                              cartController.removeFromCart(index);
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color: Colors.grey[700],
                                            ),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(cart[index].post.price!.toString() +
                                              " " +
                                              App_Localization.of(context)
                                                  .translate("aed"),style: const TextStyle(fontSize: 20,color: Colors.grey),maxLines: 1,),
                                          Text(cart[index].price.toString() +
                                              " " +
                                              App_Localization.of(context)
                                                  .translate("aed"),style: TextStyle(fontSize: 20,color: Colors.grey[700]),maxLines: 1,),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: width/3/6,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black54),color: App.grey),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  FittedBox(
                                                    child: GestureDetector(
                                                      onTap: (){
                                                        cartController.decrease(cart[index].post, -1, context);
                                                      },
                                                      child: const Icon(
                                                        Icons.remove,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                                                  Text(
                                                    cart[index].count.toString(),
                                                    style: const TextStyle(color: Colors.black54,fontSize: 30),
                                                    maxLines: 1,
                                                  ),
                                                  SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                                                  FittedBox(
                                                    child: GestureDetector(
                                                      onTap: (){
                                                        cartController.increase(cart[index].post, 1, context);
                                                      },
                                                      child: const Icon(
                                                        Icons.add,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          )


                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          width: width,
                          child: const Divider(color: Colors.grey,height: 1),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
  bgCartList({required BuildContext context, required List<LineItem> cart, required double width}) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          SizedBox(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(App_Localization.of(context).translate("my_cart"),style: const TextStyle(color: App.green,fontSize: 20,fontWeight: FontWeight.bold),maxLines: 1,),
                GestureDetector(
                  onTap: (){
                    homeController.btmNavBarIndex.value = 0;
                  },
                  child: Text(App_Localization.of(context).translate("contenue_shopping"),style: const TextStyle(color: App.primery,fontSize: 20),maxLines: 1,),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          Container(
            height: 1,
            width: width,
            color: Colors.grey,
            child: const Divider(color: Colors.grey,height: 1),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cart.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // homeController.doFunction(op, cart[index].post.id, context);
                  },
                  child: Container(
                    width: width,
                    height: width/3+10,
                    margin: const EdgeInsets.only(bottom: 2),

                    child: Column(
                      children: [
                        SizedBox(
                          width: width,
                          height: width/3,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all( MediaQuery.of(context).size.width*0.02),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black54),
                                          color: App.grey,
                                          image: DecorationImage(
                                              image: NetworkImage(cart[index]
                                                  .post
                                                  .image!
                                                  .replaceAll("localhost", "10.0.2.2")),
                                              fit: BoxFit.fill)),
                                    ),
                                  )),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: width/6,
                                            child: Text(cart[index].post.title!.toString() +
                                                " " +
                                                App_Localization.of(context)
                                                    .translate("aed"),style: TextStyle(fontSize: 16,color: Colors.grey[700]),maxLines: 1,),
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              cartController.removeFromCart(index);
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color: Colors.grey[700],
                                            ),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(cart[index].post.price!.toString() +
                                              " " +
                                              App_Localization.of(context)
                                                  .translate("aed"),style: const TextStyle(fontSize: 16,color: Colors.grey),maxLines: 1,),
                                          Text(cart[index].price.toString() +
                                              " " +
                                              App_Localization.of(context)
                                                  .translate("aed"),style: TextStyle(fontSize: 16,color: Colors.grey[700]),maxLines: 1,),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: width/3/6,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black54),color: App.grey),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  FittedBox(
                                                    child: GestureDetector(
                                                      onTap: (){
                                                        cartController.decrease(cart[index].post, -1, context);
                                                      },
                                                      child: const Icon(
                                                        Icons.remove,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                                                  Text(
                                                    cart[index].count.toString(),
                                                    style: const TextStyle(color: Colors.black54,fontSize: 20),
                                                    maxLines: 1,
                                                  ),
                                                  SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                                                  FittedBox(
                                                    child: GestureDetector(
                                                      onTap: (){
                                                        cartController.increase(cart[index].post, 1, context);
                                                      },
                                                      child: const Icon(
                                                        Icons.add,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          )


                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          width: width,
                          child: const Divider(color: Colors.grey,height: 1),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
  mdCartList({required BuildContext context, required List<LineItem> cart, required double width}) {
    return SizedBox(
      width: width,
      child: Column(

        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          SizedBox(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(App_Localization.of(context).translate("my_cart"),style: const TextStyle(color: App.green,fontSize: 15,fontWeight: FontWeight.bold),maxLines: 1,),
                GestureDetector(
                  onTap: (){
                    homeController.btmNavBarIndex.value = 0;
                  },
                  child: Text(App_Localization.of(context).translate("contenue_shopping"),style: const TextStyle(color: App.primery,fontSize: 15),maxLines: 1,),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          Container(
            height: 1,
            width: width,
            color: Colors.grey,
            child: const Divider(color: Colors.grey,height: 1),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cart.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // homeController.doFunction(op, cart[index].post.id, context);
                  },
                  child: Container(
                    width: width,
                    height: width/3+10,
                    margin: const EdgeInsets.only(bottom: 2),

                    child: Column(
                      children: [
                        SizedBox(
                          width: width,
                          height: width/3,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all( MediaQuery.of(context).size.width*0.02),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black54),
                                          color: App.grey,
                                          image: DecorationImage(
                                              image: NetworkImage(cart[index]
                                                  .post
                                                  .image!
                                                  .replaceAll("localhost", "10.0.2.2")),
                                              fit: BoxFit.fill)),
                                    ),
                                  )),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: width/6,
                                            child: Text(cart[index].post.title!.toString() +
                                                " " +
                                                App_Localization.of(context)
                                                    .translate("aed"),style: TextStyle(fontSize: 16,color: Colors.grey[700]),maxLines: 1,),
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              cartController.removeFromCart(index);
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color: Colors.grey[700],
                                            ),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(cart[index].post.price!.toString() +
                                              " " +
                                              App_Localization.of(context)
                                                  .translate("aed"),style: const TextStyle(fontSize: 16,color: Colors.grey),maxLines: 1,),
                                          Text(cart[index].price.toString() +
                                              " " +
                                              App_Localization.of(context)
                                                  .translate("aed"),style: TextStyle(fontSize: 16,color: Colors.grey[700]),maxLines: 1,),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: width/3/6,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black54),color: App.grey),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  FittedBox(
                                                    child: GestureDetector(
                                                      onTap: (){
                                                        cartController.decrease(cart[index].post, -1, context);
                                                      },
                                                      child: const Icon(
                                                        Icons.remove,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                                                  Text(
                                                    cart[index].count.toString(),
                                                    style: const TextStyle(color: Colors.black54,fontSize: 20),
                                                    maxLines: 1,
                                                  ),
                                                  SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                                                  FittedBox(
                                                    child: GestureDetector(
                                                      onTap: (){
                                                        cartController.increase(cart[index].post, 1, context);
                                                      },
                                                      child: const Icon(
                                                        Icons.add,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          )


                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          width: width,
                          child: const Divider(color: Colors.grey,height: 1),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
  smCartList({required BuildContext context, required List<LineItem> cart, required double width}) {
    return SizedBox(
      width: width,
      child: Column(

        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          SizedBox(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(App_Localization.of(context).translate("my_cart"),style: const TextStyle(color: App.green,fontSize: 15,fontWeight: FontWeight.bold),maxLines: 1,),
                GestureDetector(
                  onTap: (){
                    homeController.btmNavBarIndex.value = 0;
                  },
                  child: Text(App_Localization.of(context).translate("contenue_shopping"),style: const TextStyle(color: App.primery,fontSize: 15),maxLines: 1,),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          Container(
            height: 1,
            width: width,
            color: Colors.grey,
            child: const Divider(color: Colors.grey,height: 1),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cart.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // homeController.doFunction(op, cart[index].post.id, context);
                  },
                  child: Container(
                    width: width,
                    height: width/3+10,
                    margin: const EdgeInsets.only(bottom: 2),

                    child: Column(
                      children: [
                        SizedBox(
                          width: width,
                          height: width/3,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all( MediaQuery.of(context).size.width*0.02),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black54),
                                          color: App.grey,
                                          image: DecorationImage(
                                              image: NetworkImage(cart[index]
                                                  .post
                                                  .image!
                                                  .replaceAll("localhost", "10.0.2.2")),
                                              fit: BoxFit.fill)),
                                    ),
                                  )),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: width/6,
                                            child: Text(cart[index].post.title!.toString() +
                                                " " +
                                                App_Localization.of(context)
                                                    .translate("aed"),style: TextStyle(fontSize: 16,color: Colors.grey[700]),maxLines: 1,),
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              cartController.removeFromCart(index);
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color: Colors.grey[700],
                                            ),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(cart[index].post.price!.toString() +
                                              " " +
                                              App_Localization.of(context)
                                                  .translate("aed"),style: const TextStyle(fontSize: 16,color: Colors.grey),maxLines: 1,),
                                          Text(cart[index].price.toString() +
                                              " " +
                                              App_Localization.of(context)
                                                  .translate("aed"),style: TextStyle(fontSize: 16,color: Colors.grey[700]),maxLines: 1,),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: width/3/6,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black54),color: App.grey),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  FittedBox(
                                                    child: GestureDetector(
                                                      onTap: (){
                                                        cartController.decrease(cart[index].post, -1, context);
                                                      },
                                                      child: const Icon(
                                                        Icons.remove,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                                                  Text(
                                                    cart[index].count.toString(),
                                                    style: const TextStyle(color: Colors.black54,fontSize: 20),
                                                    maxLines: 1,
                                                  ),
                                                  SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                                                  FittedBox(
                                                    child: GestureDetector(
                                                      onTap: (){
                                                        cartController.increase(cart[index].post, 1, context);
                                                      },
                                                      child: const Icon(
                                                        Icons.add,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          )


                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          width: width,
                          child: const Divider(color: Colors.grey,height: 1),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
  xsmCartList({required BuildContext context, required List<LineItem> cart, required double width}) {
    return SizedBox(
      width: width,
      child: Column(

        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          SizedBox(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(App_Localization.of(context).translate("my_cart"),style: const TextStyle(color: App.green,fontSize: 12,fontWeight: FontWeight.bold),maxLines: 1,),
                GestureDetector(
                  onTap: (){
                    homeController.btmNavBarIndex.value = 0;
                  },
                  child: Text(App_Localization.of(context).translate("contenue_shopping"),style: const TextStyle(color: App.primery,fontSize: 12),maxLines: 1,),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          Container(
            height: 1,
            width: width,
            color: Colors.grey,
            child: const Divider(color: Colors.grey,height: 1),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cart.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // homeController.doFunction(op, cart[index].post.id, context);
                  },
                  child: Container(
                    width: width,
                    height: width/3+10,
                    margin: const EdgeInsets.only(bottom: 2),

                    child: Column(
                      children: [
                        SizedBox(
                          width: width,
                          height: width/3,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all( MediaQuery.of(context).size.width*0.02),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black54),
                                          color: App.grey,
                                          image: DecorationImage(
                                              image: NetworkImage(cart[index]
                                                  .post
                                                  .image!
                                                  .replaceAll("localhost", "10.0.2.2")),
                                              fit: BoxFit.fill)),
                                    ),
                                  )),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(cart[index].post.title!.toString() +
                                              " " +
                                              App_Localization.of(context)
                                                  .translate("aed"),style: TextStyle(fontSize: 10,color: Colors.grey[700]),maxLines: 1,),
                                          GestureDetector(
                                            onTap: (){
                                              cartController.removeFromCart(index);
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color: Colors.grey[700],
                                              size: 15,
                                            ),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(cart[index].post.price!.toString() +
                                              " " +
                                              App_Localization.of(context)
                                                  .translate("aed"),style: const TextStyle(fontSize: 10,color: Colors.grey),maxLines: 1,),
                                          Text(cart[index].price.toString() +
                                              " " +
                                              App_Localization.of(context)
                                                  .translate("aed"),style: TextStyle(fontSize: 10,color: Colors.grey[700]),maxLines: 1,),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: width/3/6,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black54),color: App.grey),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  FittedBox(
                                                    child: GestureDetector(
                                                      onTap: (){
                                                        cartController.decrease(cart[index].post, -1, context);
                                                      },
                                                      child: const Icon(
                                                        Icons.remove,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                                                  Text(
                                                    cart[index].count.toString(),
                                                    style: const TextStyle(color: Colors.black54,fontSize: 10),
                                                    maxLines: 1,
                                                  ),
                                                  SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                                                  FittedBox(
                                                    child: GestureDetector(
                                                      onTap: (){
                                                        cartController.increase(cart[index].post, 1, context);
                                                      },
                                                      child: const Icon(
                                                        Icons.add,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          )


                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          width: width,
                          child: const Divider(color: Colors.grey,height: 1),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
  cartList({required BuildContext context, required List<LineItem> cart, required double width}) {
    return SizedBox(
      width: width,
      child: Column(

        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          SizedBox(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width/5,
                  child: Text(App_Localization.of(context).translate("my_cart"),style: const TextStyle(color: App.green,fontSize: 100,fontWeight: FontWeight.bold),maxLines: 1),
                ),
                GestureDetector(
                  onTap: (){
                    homeController.btmNavBarIndex.value = 0;
                  },
                  child: SizedBox(
                    width: width/5,
                    child: Text(App_Localization.of(context).translate("contenue_shopping"),style: const TextStyle(color: App.primery,fontSize: 50),maxLines: 1,),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          SizedBox(
            height: 10,
            width: width,
            child: const Divider(color: Colors.grey,height: 1),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cart.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // homeController.doFunction(op, cart[index].post.id, context);
                  },
                  child: Container(
                    width: width,
                    height: width/3+10,
                    margin: const EdgeInsets.only(bottom: 2),

                    child: Column(
                      children: [
                        SizedBox(
                          width: width,
                          height: width/3,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all( MediaQuery.of(context).size.width*0.02),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black54),
                                          color: App.grey,
                                          image: DecorationImage(
                                              image: NetworkImage(cart[index]
                                                  .post
                                                  .image!
                                                  .replaceAll("localhost", "10.0.2.2")),
                                              fit: BoxFit.fill)),
                                    ),
                                  )),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: width/2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: width/6,
                                              child: Text(cart[index].post.title!.toString() +
                                                  " " +
                                                  App_Localization.of(context)
                                                      .translate("aed"),style: TextStyle(fontSize: 200,color: Colors.grey[700]),maxLines: 1,),
                                            ),
                                            SizedBox(
                                              width: width/6,
                                              child: Text(cart[index].price.toString() +
                                                  " " +
                                                  App_Localization.of(context)
                                                      .translate("aed"),style: TextStyle(fontSize: 200,color: Colors.grey[700]),maxLines: 1,),
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                                cartController.removeFromCart(index);
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                color: Colors.grey[700],
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: width/8,
                                        child: Text(cart[index].post.price!.toString() +
                                            " " +
                                            App_Localization.of(context)
                                                .translate("aed"),style: const TextStyle(fontSize: 100,color: Colors.grey),maxLines: 1,),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          increaseDecrease(context, cart[index].post,
                                              cart[index].count,width),

                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          width: width,
                          child: const Divider(color: Colors.grey,height: 1),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
  bgSummery(BuildContext context,double width){
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          SizedBox(
            width:width,
            child: Text(App_Localization.of(context).translate("order_summery"),style: const TextStyle(color: App.green,fontWeight: FontWeight.bold,fontSize: 100),maxLines: 1,),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          SizedBox(
            height: 10,
            width: width,
            child: const Divider(color: Colors.grey,height: 1),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          linearDashed(context, App_Localization.of(context).translate("sub_total"),cartController.subTotal.value.toStringAsFixed(2),width,15),
          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          linearDashed(context, App_Localization.of(context).translate("shipping"),"Free",width,15),
          cartController.discount.value==0?const Center():SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          cartController.discount.value==0?const Center():linearDashed(context, App_Localization.of(context).translate("discount"),cartController.discount.value.toStringAsFixed(2),width,15),
          cartController.discount.value==0?const Center():SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          cartController.discount.value==0?const Center():linearDashed(context, App_Localization.of(context).translate("coupon"),cartController.coupon.value.toStringAsFixed(2),width,15),
          SizedBox(height: MediaQuery.of(context).size.width*0.01/2,),
          SizedBox(
            height: 10,
            width: width,
            child: const Divider(color: Colors.grey,height: 1),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01/2,),
          linearDashed(context, App_Localization.of(context).translate("total"),cartController.total.value.toStringAsFixed(2),width,15),

          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          Container(
            
            width: width,
            height: width/6,
            decoration: BoxDecoration(
              color: App.primery,
              borderRadius: BorderRadius.circular(width/6/2)
            ),
            child: Center(
              child: SizedBox(
                width: width/3,
                child: Center(child: Text(App_Localization.of(context).translate("checkout"),style: const TextStyle(color: Colors.white,fontSize: 50),softWrap: true,maxLines: 1)),
              ),
            ),
          )
        ],
      ),
    );
  }
  smSummery(BuildContext context,double width){
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          SizedBox(
            width:width,
            child: Text(App_Localization.of(context).translate("order_summery"),style: const TextStyle(color: App.green,fontWeight: FontWeight.bold,fontSize: 100),maxLines: 1,),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          SizedBox(
            height: 10,
            width: width,
            child: const Divider(color: Colors.grey,height: 1),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          linearDashed(context, App_Localization.of(context).translate("sub_total"),cartController.subTotal.value.toStringAsFixed(2),width,15),
          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          linearDashed(context, App_Localization.of(context).translate("shipping"),"Free",width,15),
          cartController.discount.value==0?const Center():SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          cartController.discount.value==0?const Center():linearDashed(context, App_Localization.of(context).translate("discount"),cartController.discount.value.toStringAsFixed(2),width,15),
          cartController.discount.value==0?const Center():SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          cartController.discount.value==0?const Center():linearDashed(context, App_Localization.of(context).translate("coupon"),cartController.coupon.value.toStringAsFixed(2),width,15),
          SizedBox(height: MediaQuery.of(context).size.width*0.01/2,),
          SizedBox(
            height: 10,
            width: width,
            child: const Divider(color: Colors.grey,height: 1),
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.01/2,),
          linearDashed(context, App_Localization.of(context).translate("total"),cartController.total.value.toStringAsFixed(2),width,15),

          SizedBox(height: MediaQuery.of(context).size.width*0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(

                width: width/2,
                height: width/2/6,
                decoration: BoxDecoration(
                    color: App.primery,
                    borderRadius: BorderRadius.circular(width/6/2)
                ),
                child: Center(
                  child: SizedBox(
                    width: width/2/3,
                    child: Center(child: Text(App_Localization.of(context).translate("checkout"),style: const TextStyle(color: Colors.white,fontSize: 50),softWrap: true,)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  increaseDecrease(BuildContext context, Post post, int count,double width) {
    return Container(
      height: width/3/6,
      width: width/6,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),color: App.grey),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FittedBox(
              child: GestureDetector(
                onTap: (){
                  cartController.decrease(post, -1, context);
                },
                child: const Icon(
                  Icons.remove,
                  color: Colors.black54,
                ),
              ),
            ),

            SizedBox(
              width: width/3/6/2,
              child: Text(
                count.toString(),
                style: const TextStyle(color: Colors.black54,fontSize: 100),
                maxLines: 1,
              ),
            ),

            FittedBox(
              child: GestureDetector(
                onTap: (){
                  cartController.increase(post, 1, context);
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.black54,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  linearDashed(BuildContext context, String first, String last,double width,double font) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width/3,
            child: Text(first,style: TextStyle(fontSize: font),),
          ),

          SizedBox(
            width: width/3,
            child: Align(alignment: Alignment.bottomRight,child: Text(last,style: TextStyle(fontSize: font),),),
          ),
        ],
      ),
    );
  }

  isEmpty(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.7,
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width*0.5,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.remove_shopping_cart_outlined,
                  color: App.primery,
                  size: font(context)*2,
                ),
                Text(
                  App_Localization.of(context).translate("dont_have_order"),
                  style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize:font(context) ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      App_Localization.of(context).translate("order_no_data"),
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.normal,fontSize:font(context)),
                    ),
                    GestureDetector(
                        onTap: () {
                          homeController.btmNavBarIndex.value = 0;
                        },
                        child: Text(
                          App_Localization.of(context).translate("start_shopping"),
                          style: TextStyle(
                              color: App.primery, fontWeight: FontWeight.bold,fontSize:font(context)),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  double font(BuildContext context){
    if(MediaQuery.of(context).size.width>App.larg){
      return 25;
    }else if(MediaQuery.of(context).size.width>App.big){
      return 20;
    }else if(MediaQuery.of(context).size.width>App.mid){
      return 15;
    }else if(MediaQuery.of(context).size.width>App.small){
      return 10;
    }
    return 8;
  }
  checkOutBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (API.customer == null) {
          Get.to(() => LogIn());
        } else {
          if (cartController.cart.isEmpty) {
            App.sucss_msg(
                context, App_Localization.of(context).translate("cart_empty"));
          } else {
            Get.to(() => Checkout());
          }
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 40,
        decoration: BoxDecoration(
            color: App.primery, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(App_Localization.of(context).translate("checkout"),
              style: const TextStyle(
                  color: App.secondry,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
