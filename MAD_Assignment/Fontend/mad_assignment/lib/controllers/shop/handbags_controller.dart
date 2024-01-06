// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/models/shop/baseproduct_models.dart';
import 'package:mad_assignment/services/shop/handbags_service.dart';

class HandbagsController extends GetxController {
  var isLoading = true.obs;
  var handbagsList = <BaseProductModel>[].obs;
  fetchHandbags() async {
    try {
      isLoading(true);
      var handbagsData = await HandbagsService().fetchHandbagsData();
      handbagsList.addAll(handbagsData);
    } catch (e) {
      if (kDebugMode) {
        print("error fetching base product data:$e");
      }
    } finally {
      isLoading(false);
    }
  }
}
