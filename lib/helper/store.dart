import 'package:animals/helper/api.dart';
import 'package:animals/main.dart';
import 'package:animals/model/address.dart';
import 'package:animals/model/line_item.dart';
import 'package:animals/model/login_info.dart';
import 'package:animals/model/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Store {

  static final storage = FlutterSecureStorage();
  static String languageCode = "en";


  static saveLanguage(String lang) async {
    await storage.write(key: "language", value: lang);
  }

  static changeLanguage(BuildContext context, String lang) {
    languageCode = lang;
    Locale locale = Locale(lang);
    MyApp.setLocale(context, locale);
    saveLanguage(lang);
  }

  static Future<String> loadLanguage() async {
    try {
      String lang = await storage.read(key: "language")??"en";
      languageCode = lang;
      return lang;
    } catch(e){
      return "en";
    }
  }

  static saveLogInInfo(String email, String password) async{
    LogInInfo loginInfo = LogInInfo(email: email, password: password);
    storage.write(key: "loginInfo", value:loginInfo.toJson());
  }

  static Future<LogInInfo?> loadLogInInfo() async {
    try{
      String loaded = await storage.read(key: "loginInfo")??"non";
      LogInInfo? loginInfo = loaded == "non"
          ? null
          : LogInInfo.fromJson(loaded);
      if (loginInfo != null) {
        API.email = loginInfo.email;
        API.password = loginInfo.password;
      }
      return loginInfo;
    }catch(e){
      return null;
    }

  }

  static Future<bool> isActive() async {
    try{
      String loaded = await storage.read(key: "active")??"false";
      if(loaded=="false"){
        return false;
      }
      return true;
    }catch(e){
      return false;
    }

  }

  static saveActive(bool val) async {
    storage.write(key: "active",value: val.toString());
  }

  static saveCart(List<LineItem> cart) async{
    LineItemDecoder lineItemDecoder = LineItemDecoder(cart: cart);
    storage.write(key: "cart",value: lineItemDecoder.toJson());
  }

  static Future<List<LineItem>> loadCart() async {
    try{
      String loaded = await storage.read(key: "cart")??"non";
      if (loaded != "non") {
        List<LineItem> cart = LineItemDecoder.fromJson(loaded).cart;
        List<int> ids = <int>[];
        for (int i = 0; i < cart.length; i++) {
          ids.add(cart[i].post.id);
        }

        List<Post> posts = await API.restoreCart(ids);
        for (int i = 0; i < cart.length; i++) {
          for (int j = 0; j < posts.length; j++) {
            if (posts[j].id == cart[i].post.id) {
              cart[i].post = posts[j];
            }
          }
        }
        return cart;
      } else {
        return <LineItem>[];
      }
    }catch(e){
      return <LineItem>[];
    }

  }

  static logout() async {
    await storage.delete(key: "active");
    await storage.delete(key: "loginInfo");
    API.is_active = false;
    API.email = "";
    API.password = "";
    API.customer_id = -1;
    // Get.to(() => LogIn());
  }

  static saveAddress(
      String email,
      String address1,
      String address2,
      String apartment,
      String phone,
      String country,
      String state,
      String phone_pref,
      String ISO_code) async {
    API.address = Address(
        email: email,
        address1: address1,
        address2: address2,
        apartment: apartment,
        phone: phone,
        country: country,
        state: state,
        phone_pref: phone_pref,
        ISO_code: ISO_code);
    await storage.write(key: "address", value: API.address!.toJson());
  }

  static Future<Address?> loadAddress() async {
    try{
      String data = await storage.read(key: "address")?? "non";
      if (data == "non") {
        return null;
      } else {
        return Address.fromJson(data);
      }
    }catch(e){
      return null;
    }

  }

  static saveDiscount(String val)async {
    await storage.write(key: "discount", value: val);
  }

  static Future<String> loadDiscount() async {
    try{
      String value = await storage.read(key: "discount") ?? "non";
      return value;
    }catch(e){
      return "non";
    }
  }

}