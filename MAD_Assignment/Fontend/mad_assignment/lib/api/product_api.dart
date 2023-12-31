import 'dart:convert';

import 'connection.dart';

import 'package:mad_assignment/Models/product_models.dart';
import 'package:http/http.dart' as http;

List<ProductModel> productList = [];
Future<List<ProductModel>> fetchProduct() async {
  final response = await http.get(Uri.parse('${apiUrl}api/shop/product/'),
      headers: {'Content-Type': 'application/json'});
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    productList.clear();
    for (Map i in data) {
      productList.add(ProductModel.fromJson(i.cast()));
    }
    return productList;
  } else {
    throw Exception('Failed to load products');
  }
}
