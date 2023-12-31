import 'dart:convert';
import 'package:mad_assignment/Models/about_models.dart';
import 'package:http/http.dart' as http;
import 'connection.dart';

List<AboutModel> aboutList = [];

Future<List<AboutModel>> fetchAbout() async {
  final response = await http.get(
    Uri.parse(
        '$apiUrl/api/about/'), // Assuming '/about/' endpoint for about information
  );
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    aboutList.clear();
    for (Map i in data) {
      aboutList.add(AboutModel.fromJson(i.cast()));
    }
    return aboutList;
  } else {
    throw Exception('Failed to load about information');
  }
}
