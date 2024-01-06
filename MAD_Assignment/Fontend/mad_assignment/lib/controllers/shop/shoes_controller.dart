// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/models/shop/baseproduct_models.dart';
import 'package:mad_assignment/services/shop/shoes_service.dart';

class ShoesController extends GetxController {
  var isLoading = true.obs;
  var shoesList = <BaseProductModel>[].obs;
  fetchShoes() async {
    try {
      isLoading(true);
      var shoesData = await ShoesService().fetchShoesData();
      shoesList.addAll(shoesData);
    } catch (e) {
      if (kDebugMode) {
        print("error fetching base product data:$e");
      }
    } finally {
      isLoading(false);
    }
  }
}
