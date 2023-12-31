import 'dart:convert';
import 'connection.dart';

import 'package:mad_assignment/Models/refund_models.dart';
import 'package:http/http.dart' as http;

List<RefundModel> refundList = [];

Future<List<RefundModel>> fetchRefund() async {
  final response = await http.get(
    Uri.parse('$apiUrl/api/refund/'),
  );
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    refundList.clear();
    for (Map i in data) {
      refundList.add(RefundModel.fromJson(i.cast()));
    }
    return refundList;
  } else {
    throw Exception('Failed to load terms and conditions');
  }
}
