import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/api/product_api.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

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
                    icon: Icon(Icons.account_box_rounded)),
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
                      onPressed: () {},
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
      body: Column(
        children: [
          Expanded(
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
                          PopupMenuButton(
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "CATEGORY",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Men's Cloths",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Men's Shoes",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Men's Watches",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Women's Handbags",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Women's Glasses",
                                          style: TextStyle(fontSize: 15),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: fetchProduct(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Image.network(
                              productList[index].image ?? '',
                              height: 100, // Adjust the height as needed
                              width: 100, // Adjust the width as needed
                              fit: BoxFit.cover, // Adjust the fit as needed
                            ),
                            Text(productList[index].name?.toString() ?? ''),
                          ],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                return Center(child: CircularProgressIndicator());
              },
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
    );
  }
}
