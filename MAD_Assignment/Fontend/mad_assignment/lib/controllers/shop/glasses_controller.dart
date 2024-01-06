// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/models/shop/baseproduct_models.dart';
import 'package:mad_assignment/services/shop/glasses_service.dart';

class GlassesController extends GetxController {
  var isLoading = true.obs;
  var glassesList = <BaseProductModel>[].obs;
  fetchGlasses() async {
    try {
      isLoading(true);
      var glassesData = await GlassesService().fetchGlassesData();
      glassesList.addAll(glassesData);
    } catch (e) {
      if (kDebugMode) {
        print("error fetching base product data:$e");
      }
    } finally {
      isLoading(false);
    }
  }
}
