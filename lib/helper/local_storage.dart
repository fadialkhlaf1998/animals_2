import 'package:universal_html/html.dart';

class LocalStorage {
  static final storage = window.localStorage;

  static void saveValue(String key,String value){
    storage[key] = value;
  }

  static String getValue(String key){
    return storage[key]??"non";
  }

  static void remove(String key){
    storage.remove(key);
  }
}