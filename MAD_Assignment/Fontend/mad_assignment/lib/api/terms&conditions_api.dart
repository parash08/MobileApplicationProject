import 'dart:convert';
import 'connection.dart';

import 'package:mad_assignment/Models/terms_conditions_model.dart';
import 'package:http/http.dart' as http;

List<TermsConditionsModel> termsList = [];

Future<List<TermsConditionsModel>> fetchTermsConditions() async {
  final response = await http.get(
    Uri.parse('$apiUrl/api/terms/'),
  );
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    termsList.clear();
    for (Map i in data) {
      termsList.add(TermsConditionsModel.fromJson(i.cast()));
    }
    return termsList;
  } else {
    throw Exception('Failed to load products');
  }
}
