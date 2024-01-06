import 'package:flutter/foundation.dart';
import 'package:mad_assignment/models/shop/baseproduct_models.dart';
import 'package:http/http.dart' as http;
import 'package:mad_assignment/services/connection.dart';

class GlassesService {
  Future<List<BaseProductModel>> fetchGlassesData() async {
    var response = await http.get(
      Uri.parse("${url}api/shop/glasses/"),
    );
    if (response.statusCode == 200) {
      return baseProductModelFromJson(response.body);
    } else {
      if (kDebugMode) {
        print("network error");
      }
      throw Exception("nework error");
    }
  }
}
