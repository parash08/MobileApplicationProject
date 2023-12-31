import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/routes.dart';

void main() {
  runApp(const Shopingo());
}

class Shopingo extends StatelessWidget {
  const Shopingo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      defaultTransition: Transition.native,
      getPages: Routes.route,
      debugShowCheckedModeBanner: false,
      title: 'Shopingo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
