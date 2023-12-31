import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fixed color instantiation
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Text("Shopingo",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Get.toNamed('/account');
                    },
                    icon: const Icon(Icons.account_box_rounded)),
                IconButton(
                  onPressed: () {
                    Get.toNamed('/whitelist');
                  },
                  icon: const Icon(Icons.favorite),
                ),
                IconButton(
                  onPressed: () {
                    Get.toNamed('/cart');
                  },
                  icon: const Icon(Icons.shopping_cart),
                ),
              ],
            )
          ],
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "Info & Links",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Get.toNamed('/refund');
                        },
                        icon: const Icon(Icons.policy_outlined),
                        label: const Text(
                          "Refund",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Get.toNamed('/terms');
                        },
                        icon: const Icon(Icons.run_circle_sharp),
                        label: const Text(
                          "Terms",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Add functionality for "My Orders"
                          Get.toNamed('/order');
                        },
                        icon: const Icon(Icons.shopping_basket),
                        label: const Text(
                          "My Orders",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Add functionality for "Check Out"
                          Get.toNamed('/checkout');
                        },
                        icon: const Icon(Icons.shopping_cart_checkout_outlined),
                        label: const Text(
                          "Check Out",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                )
              ];
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 200, 245, 245),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/logo.png',
                ),
              ), // Fixed CircleAvatar widget
            ),
            const ListTile(
              title: Text('Name'),
              leading: Icon(Icons.person),
            ),
            const ListTile(
              title: Text("Email"),
              leading: Icon(Icons.mail),
            ),
            const Divider(
              height: 0.2,
            ),
            ListTile(
              title: Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Home",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              leading: const Icon(Icons.home),
            ),
            ListTile(
              title: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Get.toNamed('/shop');
                      },
                      child: const Text(
                        "Shop",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              leading: const Icon(Icons.shop_2_rounded),
            ),
            ListTile(
              title: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Get.toNamed('/about');
                      },
                      child: const Text(
                        "About",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              leading: const Icon(Icons.contact_support_sharp),
            ),
            ListTile(
              title: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Get.toNamed('/enquiry');
                      },
                      child: const Text(
                        "Contact",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
              leading: const Icon(Icons.contact_emergency),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(hintText: "Search"),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            // Add search functionality here
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 213,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          print("click");
                        },
                        child: Image.network(
                            'https://www.thewowstyle.com/wp-content/uploads/2015/01/nature-images..jpg'),
                      ),
                      TextButton(
                        onPressed: () {
                          print("click");
                        },
                        child: Image.network(
                            'https://www.thewowstyle.com/wp-content/uploads/2015/01/nature-images..jpg'),
                      ),
                      TextButton(
                        onPressed: () {
                          print("click");
                        },
                        child: Image.network(
                            'https://www.thewowstyle.com/wp-content/uploads/2015/01/nature-images..jpg'),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("TRENDING PRODUCTS",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("MOST SELLING PRODUCTS OF THE MONTH",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Text(
                    "Follow Us",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    color: Colors.yellowAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.facebook_rounded),
                            label: const Text("")),
                        TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.auto_awesome_outlined),
                            label: const Text("")),
                      ],
                    )),
              ),
              SizedBox(
                  child: Container(
                      child: const Text(
                "Copyright 2023-ALL RIGHTS RESERVED",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ))),
            ],
          ),
        ),
      ),
    );
  }
}
