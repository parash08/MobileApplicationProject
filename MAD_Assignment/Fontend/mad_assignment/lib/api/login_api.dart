import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mad_assignment/api/connection.dart';

Future<void> login(context, email, password) async {
  final response = await http.post(
    Uri.parse("${apiUrl}api/login/"),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 202) {
    // Parse the response body as JSON
    final Map<String, dynamic> responseBody = jsonDecode(response.body);

    // Check if the response contains the authentication token
    if (responseBody.containsKey('token')) {
      // Get the token from the response

      // Navigate to the home screen or perform other actions
      Navigator.pushNamed(context, '/home');
    } else {
      // Handle the case where the token is not present in the response
      Navigator.pop(context);
    }
  } else {
    // Login failed, handle the error
    // You can show an error message or perform other actions here
    Navigator.pop(context);
  }
}
