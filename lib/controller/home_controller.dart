// ignore_for_file: non_constant_identifier_names

import 'package:animals/controller/cart_contoller.dart';
import 'package:animals/controller/shop_controller.dart';
import 'package:animals/helper/store.dart';
import 'package:animals/model/login_info.dart';
import 'package:animals/model/start_up.dart';
import 'package:animals/view/custom_search_view.dart';
import 'package:animals/view/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animals/helper/api.dart';
import 'package:animals/model/post.dart';
import 'package:animals/view/no_internet.dart';

class HomeController extends GetxController {

  List<Post> banner = <Post>[];
  List<Post> brand = <Post>[];
  List<Post> service = <Post>[];
  List<Post> category = <Post>[];
  List<Post> product = <Post>[];
  List<Post> gallary = <Post>[];

  CartController cartController = Get.put(CartController());
  ShopController shopController = Get.put(ShopController());

  Post? aboutHomePage;
  Post? aboutPage;
  Rx<bool> loading = false.obs;
  Rx<bool> fake = false.obs;
  Rx<int> btmNavBarIndex = 0.obs;
  Rx<int> selder_selected = 0.obs;
  RxList<Post> products = <Post>[].obs;
  TextEditingController searchController = TextEditingController();
  var ready = false.obs;

  ///search Page
  var selectedPostFilter = 0.obs;

  ///rate Page
  var openServiceIndex = (-1).obs;

  ///services page
  var selectedServices = 0.obs;
  final scrollController = ScrollController();
  scrollDown() {
    scrollController.animateTo(
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
      scrollController.position.maxScrollExtent / 2,
    );
  }

  @override
  void onInit() {
    super.onInit();
    get_data();
  }

  goToShop(int id){
    loading.value=true;
    if(id == -1){
      shopController.posts = product;
      shopController.postsView.value = product;
      shopController.selectedCategory.value = id;
      Get.to(()=>Shop());
      loading.value=false;
    }else{
      API.getByParent1(id).then((value){
        shopController.posts = product;
        shopController.postsView.value = value;
        shopController.selectedCategory.value = id;
        Get.to(()=>Shop());
        loading.value=false;
      });
    }
  }


  login() async {
    LogInInfo? logInInfo = await Store.loadLogInInfo();
    API.is_active = await Store.isActive();
    if (logInInfo != null) {
      await API.login();
    }
    return;
  }

  get_data() {
    API.checkInternet().then((value) async {
      if (value) {
        API.getCompanyId().then((value) async {
          String code = await Store.loadDiscount();
          if(code!="non"){
            cartController.discount.value = await API.discountCode(code);
          }
          await login();
          StartUp? startUp = await API.startUp();
          if(startUp != null){

            banner = startUp.banners.posts;
            category = startUp.categories.posts;
            service = startUp.services.posts;
            product = startUp.products.posts;
            brand = startUp.brand.posts;
            gallary = startUp.gallary.posts;
            aboutHomePage = startUp.aboutHomePage.posts.first;
            aboutPage = startUp.aboutPage.posts.first;
            API.address = await Store.loadAddress();
            cartController.cart.value = await Store.loadCart();
            cartController.saveCart();
          }
          // wishListController.wishlist.value = await API.getWishlist();
          get_nave();
        });
      } else {
        Get.to(() => NoInternet())!.then((value) {
          get_data();
        });
      }
    }).catchError((err) {
      err.printError();
    });
  }

  get_nave() {
    category = category;
    banner = banner;
    service = service;
    product = product;
    brand = brand;
    aboutHomePage = aboutHomePage;
    aboutPage = aboutPage;
    gallary = gallary;
    ready.value=true;
    if (API.email.isNotEmpty && API.is_active == true) {
      // Get.offAll(() => Home());
      ready.value=true;
    } else if (API.email.isNotEmpty && API.is_active == false) {
      //Get.to(() => VerificationCode());
    } else {
      //Get.offAll(() => LogIn());
    }
  }

  search(BuildContext context,String query){
    if(query.isNotEmpty){
      loading.value = true;
      API.customSearch(query).then((value) {
        loading.value = false;
        if(value != null){
          Get.to(()=>CustomSearchView(value.products.posts,value.services.posts));
        }

      });
    }
  }


}
