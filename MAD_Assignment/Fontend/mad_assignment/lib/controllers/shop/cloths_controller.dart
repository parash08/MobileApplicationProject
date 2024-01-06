// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/models/shop/baseproduct_models.dart';
import 'package:mad_assignment/services/shop/cloths_service.dart';

class ClothsController extends GetxController {
  var isLoading = true.obs;
  var clothsList = <BaseProductModel>[].obs;
  fetchCloths() async {
    try {
      isLoading(true);
      var clothsData = await ClothsService().fetchClothsData();
      clothsList.addAll(clothsData);
    } catch (e) {
      if (kDebugMode) {
        print("error fetching base product data:$e");
      }
    } finally {
      isLoading(false);
    }
  }
}
