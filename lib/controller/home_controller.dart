import 'dart:async';
import 'package:animals/controller/cart_contoller.dart';
import 'package:animals/controller/shop_controller.dart';
import 'package:animals/helper/app.dart';
import 'package:animals/helper/store.dart';
import 'package:animals/model/login_info.dart';
import 'package:animals/model/start_up.dart';
import 'package:animals/view/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animals/helper/api.dart';
import 'package:animals/model/post.dart';
import 'package:animals/view/no_internet.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {

  List<Post> banner = <Post>[];
  List<Post> brand = <Post>[];
  List<Post> service = <Post>[];
  List<Post> superCategory = <Post>[];
  List<Post> product = <Post>[];
  List<Post> gallary = <Post>[];
  List<Post> reviews = <Post>[];
  List<Post> events = <Post>[];
  List<Post> blogs = <Post>[];
  Post? aboutHomePage;
  Post? aboutPage;
  CartController cartController = Get.put(CartController());
  ShopController shopController = Get.put(ShopController());
  Rx<int> selectedCategory = 0.obs;
  Rx<int> locationSearch = 0.obs;


  ///footers
  TextEditingController subscribeEmail = TextEditingController();
  RxBool subscribe = false.obs;
  RxBool clickSubscribe = false.obs;
  late GoogleMapController googleMapController;
  final initialCameraPosition = CameraPosition(
    target: LatLng(App.latitude, App.longitude),
    zoom: 11.5,
  );
  Set<Marker> marker = Set();
  void onMapCreated(GoogleMapController controller)  async {
    marker.add(
        Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(App.latitude, App.longitude),
          visible: false
    ));
  }
  void openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/place/The+Barkley+Pet+Camp/@25.1774539,55.3645627,17z/data=!3m1!4b1!4m5!3m4!1s0x3e5f671870b004a3:0xd105f08f9c4285cc!8m2!3d25.1774539!4d55.3645627';
    await launchUrl(Uri.parse(googleUrl));
  }

  ///Book An Assessment Page
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController pet = TextEditingController();
  TextEditingController breed = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController certificate = TextEditingController();


  Rx<bool> loading = false.obs;
  Rx<bool> fake = false.obs;
  Rx<int> btmNavBarIndex = 0.obs;
  Rx<int> hoverIndex = (-1).obs;
  var ready = false.obs;
  var openCountry = false.obs;
  RxBool popUp = true.obs;
  Rx<bool> serviceHover = false.obs;
  Rx<bool> serviceHoverContainer = false.obs;
  Rx<bool> newsHover = false.obs;
  Rx<bool> newsHoverContainer = false.obs;
  Rx<int> selectedNews = 0.obs;

  ///review slider
  Rx<int> selectedSlider = 0.obs;
  var activeIndex = 0.obs;
  set_index(int selected){
    activeIndex.value=selected;
  }

  ///search Page
  TextEditingController searchController = TextEditingController();
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
      scrollController.position.maxScrollExtent / 2.5,

    );
  }
  scrollDown2() {
    scrollController.animateTo(
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
      scrollController.position.maxScrollExtent / 1.7,

    );
  }

  @override
  void onInit() {
    super.onInit();
    get_data();
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
            superCategory = startUp.super_category.posts;
            service = startUp.services.posts;
            brand = startUp.brand.posts;
            gallary = startUp.gallary.posts;
            reviews = startUp.reviews.posts;
            events = startUp.events.posts;
            blogs = startUp.blogs.posts;
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
    superCategory = superCategory;
    banner = banner;
    service = service;
    product = product;
    brand = brand;
    aboutHomePage = aboutHomePage;
    aboutPage = aboutPage;
    gallary = gallary;
    reviews = reviews;
    events = events;
    blogs = blogs;
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
          Get.to(()=>Search(value.products.posts,value.services.posts));
        }
      });
      searchController.clear();
    }
  }
  
  Subscribe(BuildContext context,String email) {
    clickSubscribe.value = true;
    if(email.isNotEmpty) {
      subscribe.value = true;
      API.subscribe(email).then((value) {
        if(value == true) {
          subscribe.value = true;
          // print(email);
        }
        Future.delayed(Duration(seconds: 3)).then((value) {
          subscribe.value = false;
          subscribeEmail.text = "";
          clickSubscribe.value = false;
        });
      });
    } else {
      Future.delayed(Duration(seconds: 3)).then((value) {
        clickSubscribe.value = false;
      });
    }

  }
  
}
