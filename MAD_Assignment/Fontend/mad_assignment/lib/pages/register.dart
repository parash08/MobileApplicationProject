import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mad_assignment/api/register_api.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _validationMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 244, 245, 248),
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    // ... Your existing code ...

                    ClipOval(
                      child: Container(
                        width: 100, // Set the desired width
                        height: 100, // Set the desired height
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors
                              .white, // You can set the background color of the oval
                        ),
                        child: Image.asset('assets/logo.png'),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: const Text(
                        "SignUp",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),

                    buildTextField("First Name", _firstNameController),
                    buildTextField("Last Name", _lastNameController),
                    buildTextField("Email", _emailController),
                    buildTextField("Mobile Number", _phoneNumberController),
                    buildTextField("Country", _countryController),
                    buildTextField("City", _cityController),
                    buildTextField("Password", _passwordController,
                        isPassword: true),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Perform validation
                  if (!validateFields()) {
                    setState(() {
                      _validationMessage = 'Please fill in all fields.';
                    });
                  } else {
                    try {
                      registerUser(
                          _firstNameController.text,
                          _lastNameController.text,
                          _emailController.text,
                          _phoneNumberController.text,
                          _countryController.text,
                          _cityController.text,
                          _passwordController.text,
                          context);
                      // Navigating to a named route
                      // Get.toNamed( '/login');

                      // Do any additional actions after registration
                    } catch (e) {
                      print('Error during registration: $e');
                      // Handle registration error
                      // Navigating back
                      Navigator.pop(context);
                    }
                  }
                },
                child: Text("Submit"),
              ),
              SizedBox(height: 10),
              Text(
                _validationMessage,
                style: TextStyle(color: Colors.red),
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed("/login");
                  },
                  child: Text("Have an account? Login")),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }

  bool validateFields() {
    return _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty &&
        _countryController.text.isNotEmpty &&
        _cityController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }
}
