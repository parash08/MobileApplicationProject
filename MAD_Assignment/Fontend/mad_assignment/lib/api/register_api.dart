import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'connection.dart';

void registerUser(String firstName, lastName, email, phoneNumber, country, city,
    password, context) async {
  // Replace with your API endpoint
  final response = await http.post(
    Uri.parse('${apiUrl}api/register/'),
    body: {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_number': phoneNumber,
      'country': country,
      'city': city,
      'password': password,
      'password2': password
    },
  );

  if (response.statusCode == 200) {
    // Successful registration, handle the response accordingly
    Navigator.pushNamed(context, '/login');
    print('User registered successfully');
  } else {
    // Registration failed, handle the error
    print('Error during registration: ${response.statusCode}');
    Navigator.pop(context);
  }
}
