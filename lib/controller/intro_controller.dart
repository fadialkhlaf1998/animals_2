import 'package:animals/view/cart.dart';
import 'package:animals/view/shop.dart';
import 'package:get/get.dart';
import 'package:animals/controller/cart_contoller.dart';
import 'package:animals/controller/home_controller.dart';
import 'package:animals/controller/wishlist_controller.dart';
import 'package:animals/helper/api.dart';
import 'package:animals/helper/store.dart';
import 'package:animals/model/login_info.dart';
import 'package:animals/model/post.dart';
import 'package:animals/view/home.dart';
import 'package:animals/view/login.dart';
import 'package:animals/view/no_internet.dart';
import 'package:animals/view/verification_code.dart';

class IntroController extends GetxController {
  // List<List<Post>> main_posts = [<Post>[]];
  List<Post> banner = <Post>[];
  List<Post> brand = <Post>[];
  List<Post> category = <Post>[];
  List<Post> service = <Post>[];
  List<Post> product = <Post>[];
  List<Post> gallary = <Post>[];
  List<Post> reviews = <Post>[];
  List<Post> events = <Post>[];
  List<Post> blogs = <Post>[];
  Post? aboutHomePage;
  Post? aboutPage;
  HomeController homeController = Get.put(HomeController());
  CartController cartController = Get.put(CartController());
  WishListController wishListController = Get.put(WishListController());
  var ready = false.obs;
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
        // main_posts.clear();
        API.getCompanyId().then((value) async {
          await login();
          // for (int i = 0; i < API.main_parents.length; i++) {
          //   var newList = await API.getPostByPostType(API.main_parents[i]);
          //   main_posts.add(newList);
          // }
          banner = await API.getPostByPostType(29);
          banner = await API.getPostByPostType(29);
          category = await API.getPostByPostType(26);
          service = await API.getPostByPostType(28);
          product = await API.getPostByPostType(27);
          brand = await API.getPostByPostType(30);
          gallary = await API.getPostByPostType(33);
          aboutHomePage = await API.getPostInfo(83);
          aboutPage = await API.getPostInfo(84);
          // List<Post> temp = await API.getPostByPostType(27);
          // Get.to(()=>Cart());
          // banner = await API.getPostByPostType(13);
          // category = await API.getPostByPostType(15);
          API.address = await Store.loadAddress();
          cartController.cart.value = await Store.loadCart();
          cartController.saveCart();
          wishListController.wishlist.value = await API.getWishlist();
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
    homeController.category = category;
    homeController.banner = banner;
    homeController.service = service;
    homeController.product = product;
    homeController.brand = brand;
    homeController.aboutHomePage = aboutHomePage;
    homeController.aboutPage = aboutPage;
    homeController.gallary = gallary;
    homeController.reviews = reviews;
    homeController.events = events;
    homeController.blogs = blogs;
    // Get.to(() => Home());
    ready.value=true;
    print('ready');
    if (API.email.isNotEmpty && API.is_active == true) {
      // Get.offAll(() => Home());
      ready.value=true;
    } else if (API.email.isNotEmpty && API.is_active == false) {
      //Get.to(() => VerificationCode());
    } else {
      //Get.offAll(() => LogIn());
    }
  }
}
