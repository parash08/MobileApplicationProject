import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'connection.dart';

void sendEnquiry(String firstName, lastName, email, message, context) async {
  // Replace with your API endpoint
  final response = await http.post(
    Uri.parse('${apiUrl}api/enquiry/'),
    body: {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'message': message
    },
  );

  if (response.statusCode == 200) {
    // Successful registration, handle the response accordingly
    Navigator.pushNamed(context, '/home');
    print('User registered successfully');
  } else {
    // Registration failed, handle the error
    print('Error during registration: ${response.statusCode}');
  }
}
