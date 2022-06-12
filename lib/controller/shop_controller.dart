import 'package:animals/helper/api.dart';
import 'package:animals/model/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopController extends GetxController{
  List<Post> posts = <Post>[];
  RxList<Post> postsView = <Post>[].obs;
  var openCollection = false.obs;
  var openPrice = false.obs;
  var openClearFilter = false.obs;
  Rx<int> selectedCategory = 0.obs;
  Rx<RangeLabels> priceLabel = const RangeLabels("AED 0.00", "AED 5000.00").obs;
  Rx<double> minPrice=0.0.obs,maxPrice=99999999999999999999.0.obs;
  Rx<RangeValues> price = const RangeValues(0, 5000).obs;
  Rx<int> btmNavBarIndex = 0.obs;
  var openCountry = false.obs;
  var openShopByPetIndex = (-1).obs;
  var openBrandIndex = (-1).obs;


  @override
  void onInit() async{
    posts = await API.getPostByPostType(27);
    postsView = List<Post>.from(posts).obs;
    selectedCategory.value = -1;
    super.onInit();
  }

  filterPost(int category){
    openClearFilter.value = true;
    selectedCategory.value = category;
    List<Post> temp = <Post>[];
    for(int i=0;i<posts.length;i++){
      if((category==-1||posts[i].parent1==category)&&posts[i].price!>=minPrice.value&&posts[i].price!<=maxPrice.value){
        temp.add(posts[i]);
      }
    }
    postsView = List<Post>.from(temp).obs;
    return ;
  }
  clearFilter(){
    openClearFilter.value = false;
    openPrice.value = false;
    openCollection.value = false;
    selectedCategory.value = -1;

    minPrice.value = 0.0;
    maxPrice.value = 5000.00;
    price.value = const RangeValues(0.0, 5000.0);
    priceLabel.value = const RangeLabels("AED 0.00", "AED 5000.00");

    postsView = List<Post>.from(posts).obs;
  }
}