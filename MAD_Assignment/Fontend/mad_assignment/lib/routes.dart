import 'package:get/get.dart';
import 'package:mad_assignment/pages/account.dart';
import 'package:mad_assignment/pages/cart.dart';
import 'package:mad_assignment/pages/checkout.dart';
import 'package:mad_assignment/pages/home.dart';
import 'package:mad_assignment/pages/about.dart';
import 'package:mad_assignment/pages/enquiry.dart';
import 'package:mad_assignment/pages/myorders.dart';
import 'package:mad_assignment/pages/refund.dart';
import 'package:mad_assignment/pages/shop.dart';
import 'package:mad_assignment/pages/terms_conditions.dart';
import 'package:mad_assignment/pages/register.dart';
import 'package:mad_assignment/pages/login.dart';
import 'package:mad_assignment/pages/whitelist.dart';

class Routes {
  static final route = [
    GetPage(name: '/register', page: () => const Register()),
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/about', page: () => AboutUs()),
    GetPage(name: '/enquiry', page: () => Enquiry()),
    GetPage(name: '/refund', page: () => RefundPolicy()),
    GetPage(name: '/terms', page: () => TermsConditions()),
    GetPage(name: '/shop', page: () => Shop()),
    GetPage(name: '/account', page: () => Account()),
    GetPage(name: '/order', page: () => Orders()),
    GetPage(name: '/checkout', page: () => checkOut()),
    GetPage(name: '/cart', page: () => Cart()),
    GetPage(name: '/whitelist', page: () => Whitelist()),
  ];
}
