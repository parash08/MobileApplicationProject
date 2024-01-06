// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/models/shop/baseproduct_models.dart';
import 'package:mad_assignment/services/shop/watches_service.dart';

class WatchesController extends GetxController {
  var isLoading = true.obs;
  var watchesList = <BaseProductModel>[].obs;
  fetchWatches() async {
    try {
      isLoading(true);
      var watchesData = await WatchesService().fetchWatchesData();
      watchesList.addAll(watchesData);
    } catch (e) {
      if (kDebugMode) {
        print("error fetching base product data:$e");
      }
    } finally {
      isLoading(false);
    }
  }
}
