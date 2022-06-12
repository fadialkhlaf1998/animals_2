import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:animals/app_localization.dart';
import 'package:animals/helper/api.dart';
import 'package:animals/helper/app.dart';
import 'package:animals/model/customer_order.dart';
import 'package:animals/view/no_internet.dart';
import 'package:animals/view/order_items.dart';

class CustomerOrderController extends GetxController {
  var loading = false.obs;
  List<CustomerOrder> orders = <CustomerOrder>[];

  cancelOrder(int id, BuildContext context) {
    loading.value = true;
    API.checkInternet().then((net) async {
      if (net) {
        API.cancelOrder(id).then((value) {
          if (value) {
            API.customerOrder().then((new_orders) {
              orders = new_orders;
              loading.value = false;
            });
          } else {
            App.error_msg(
                context, App_Localization.of(context).translate("oops"));
          }
        });
      } else {
        Get.to(() => NoInternet())!.then((value) {
          cancelOrder(id, context);
        });
      }
    }).catchError((err) {
      loading.value = false;
      err.printError();
    });
  }

  viewOrder(int id, BuildContext context) {
    loading.value = true;
    API.checkInternet().then((net) async {
      if (net) {
        API.lineItems(id).then((posts) {
          loading.value = false;
          if (posts.isNotEmpty) {
            Get.to(() => OrderItems(posts));
          } else {
            App.error_msg(
                context, App_Localization.of(context).translate("oops"));
          }
        });
      } else {
        Get.to(() => NoInternet())!.then((value) {
          cancelOrder(id, context);
        });
      }
    }).catchError((err) {
      loading.value = false;
      err.printError();
    });
  }
}
