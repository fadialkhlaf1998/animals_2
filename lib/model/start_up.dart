import 'package:animals/model/post.dart';
import 'dart:convert';

class StartUp {
  StartUp({
    required this.banners,
    required this.categories,
    required this.services,
    required this.products,
    required this.brand,
    required this.gallary,
    required this.aboutHomePage,
    required this.aboutPage,
  });

  PostList banners;
  PostList categories;
  PostList services;
  PostList products;
  PostList brand;
  PostList gallary;
  PostList aboutHomePage;
  PostList aboutPage;

  factory StartUp.fromJson(String str) => StartUp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StartUp.fromMap(Map<String, dynamic> json) => StartUp(
    banners: PostList.fromMap(json["banners"]),
    categories: PostList.fromMap(json["categories"]),
    services: PostList.fromMap(json["services"]),
    products: PostList.fromMap(json["products"]),
    brand: PostList.fromMap(json["brand"]),
    gallary: PostList.fromMap(json["gallary"]),
    aboutHomePage: PostList.fromMap(json["aboutHomePage"]),
    aboutPage: PostList.fromMap(json["aboutPage"]),
  );

  Map<String, dynamic> toMap() => {
    "banners": banners.toMap(),
    "categories": categories.toMap(),
    "services": services.toMap(),
    "products": products.toMap(),
    "brand": brand.toMap(),
    "gallary": gallary.toMap(),
    "aboutHomePage": aboutHomePage.toMap(),
    "aboutPage": aboutPage.toMap(),
  };
}

class PostList {
  PostList({
    required this.posts,
  });

  List<Post> posts;

  factory PostList.fromJson(String str) => PostList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostList.fromMap(Map<String, dynamic> json) => PostList(
    posts: List<Post>.from(json["posts"].map((x) => Post.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "posts": List<dynamic>.from(posts.map((x) => x.toMap())),
  };
}


