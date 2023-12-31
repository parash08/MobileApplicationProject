import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/api/terms&conditions_api.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

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
                          Get.toNamed('/checkout');
                          // Add functionality for "Check Out"
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
        child: ListView(
          children: [
            Container(
                child: Text(
              "Our Terms & Conditions",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              textAlign: TextAlign.center,
            )),

            Container(
              // Set width based on screen width
              height: 400, // Set height based on screen height
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 174, 207, 226),
                borderRadius: BorderRadius.circular(15),
              ),
              child: FutureBuilder(
                future:
                    fetchTermsConditions(), // Replace with your future data-fetching function
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return ListView.builder(
                        itemCount: termsList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              termsList[index].title.toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle:
                                Text(termsList[index].description.toString()),
                          );
                        },
                      );
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),

// ... (other parts of the code)

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
    );
  }
}
