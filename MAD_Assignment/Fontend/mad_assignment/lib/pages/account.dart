import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Account extends StatelessWidget {
  const Account({super.key});

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
                    onPressed: () {}, icon: Icon(Icons.account_box_rounded)),
                IconButton(
                  onPressed: () {
                    Get.toNamed('/whitelist');
                  },
                  icon: Icon(Icons.favorite),
                ),
                IconButton(
                  onPressed: () {
                    Get.toNamed('/cart');
                  },
                  icon: Icon(Icons.shopping_cart),
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
                        child: Text(
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
                        icon: Icon(Icons.policy_outlined),
                        label: Text(
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
                        icon: Icon(Icons.run_circle_sharp),
                        label: Text(
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
                        icon: Icon(Icons.shopping_basket),
                        label: Text(
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
                        icon: Icon(Icons.shopping_cart_checkout_outlined),
                        label: Text(
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
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 200, 245, 245),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/logo.png',
                    bundle: PlatformAssetBundle()),
              ), // Fixed CircleAvatar widget
            ),
            ListTile(
              title: Text('Name'),
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text("Email"),
              leading: Icon(Icons.mail),
            ),
            Divider(
              height: 0.2,
            ),
            ListTile(
              title: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Get.toNamed('/home');
                      },
                      child: Text(
                        "Home",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              leading: Icon(Icons.home),
            ),
            ListTile(
              title: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Get.toNamed('/shop');
                      },
                      child: Text(
                        "Shop",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              leading: Icon(Icons.shop_2_rounded),
            ),
            ListTile(
              title: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Get.toNamed('/about');
                      },
                      child: Text(
                        "About",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              leading: Icon(Icons.contact_support_sharp),
            ),
            ListTile(
              title: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Get.toNamed('/enquiry');
                      },
                      child: Text(
                        "Contact",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
              leading: Icon(Icons.contact_emergency),
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
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(hintText: "Search"),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.search),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("TRENDING PRODUCTS",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                child: Row(
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
                  child: Text(
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
                            icon: Icon(Icons.facebook_rounded),
                            label: Text("")),
                        TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.auto_awesome_outlined),
                            label: Text("")),
                      ],
                    )),
              ),
              SizedBox(
                  child: Container(
                      child: Text(
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
