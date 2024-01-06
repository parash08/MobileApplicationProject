import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mad_assignment/controllers/shop/cloths_controller.dart';
import 'package:mad_assignment/controllers/shop/glasses_controller.dart';
import 'package:mad_assignment/controllers/shop/handbags_controller.dart';
import 'package:mad_assignment/controllers/shop/shoes_controller.dart';
import 'package:mad_assignment/controllers/shop/watches_controller.dart';
import 'package:mad_assignment/controllers/user/account_controller.dart';
import 'package:mad_assignment/controllers/shop/baseProductController.dart';
import 'package:mad_assignment/controllers/shop/cart_controller.dart';
import 'package:mad_assignment/controllers/shop/whitelist_controller.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  AccountController accountController = AccountController();
  BaseProductController baseProductController = BaseProductController();
  CartController cartController = CartController();
  WhitelistController whitelistController = WhitelistController();
  ClothsController clothsController = ClothsController();
  ShoesController shoesController = ShoesController();
  WatchesController watchesController = WatchesController();
  HandbagsController handbagsController = HandbagsController();
  GlassesController glassesController = GlassesController();
  var box = GetStorage();

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
                          // Get.toNamed('/checkout');
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
        child: FutureBuilder(
          future: accountController.fetchAccount(),
          builder: (context, snapshot) => ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 200, 245, 245),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/logo.png',
                      bundle: PlatformAssetBundle()),
                ), // Fixed CircleAvatar widget
              ),
              ListTile(
                title: Text(
                    "${accountController.accountList[0].firstName.toUpperCase()} ${accountController.accountList[0].lastName.toUpperCase()}"),
                leading: const Icon(Icons.person),
              ),
              ListTile(
                title: Text(accountController.accountList[0].email.toString()),
                leading: const Icon(Icons.mail),
              ),
              const Divider(
                height: 0.2,
              ),
              ListTile(
                title: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.toNamed('/home');
                        },
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
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 7, 182, 212),
                borderRadius: BorderRadius.circular(10)),
            height: Get.height * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Builder(
                builder: (context) {
                  return FutureBuilder(
                    future: baseProductController.fetchBaseProduct(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Display a loading indicator while data is being fetched
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // Handle error case
                        return Text('Error: ${snapshot.error}');
                      } else {
                        // Data has been successfully fetched
                        return ListView.builder(
                          scrollDirection: Axis
                              .horizontal, // Set the scroll direction to horizontal
                          itemCount:
                              baseProductController.baseProductList.length,
                          itemBuilder: (context, index) =>
                              SingleChildScrollView(
                            scrollDirection: Axis
                                .horizontal, // Also set the scroll direction for the row
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Get.toNamed('/checkout', parameters: {
                                          'product_id': baseProductController
                                              .baseProductList[index].id
                                              .toString(),
                                          'product_price': baseProductController
                                              .baseProductList[index].price
                                              .toString()
                                        });
                                      },
                                      child: Image.network(
                                        baseProductController
                                            .baseProductList[index].image
                                            .toString(),
                                        height: Get.height * 0.5,
                                        width: Get.width,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const Text(
                                        "   <<  Click Here & Get 10 % CashBack  >> ",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                            color: Color.fromARGB(
                                                255, 236, 253, 0)))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("TRENDING CLOTHS COLLECTION",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("MOST SELLING PRODUCTS OF THE MONTH",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: Get.height * .8,
            child: Expanded(
              child: FutureBuilder(
                  future: clothsController.fetchCloths(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); // Loading state
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}'); // Error state
                    } else {
                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: clothsController.clothsList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Get.toNamed('/checkout', parameters: {
                                        'product_id': baseProductController
                                            .baseProductList[index].id
                                            .toString(),
                                        'product_price': baseProductController
                                            .baseProductList[index].price
                                            .toString()
                                      });
                                    },
                                    child: Image.network(
                                      clothsController.clothsList[index].image
                                          .toString(),
                                      height: Get.height * 0.3,
                                      width: Get.width,
                                      fit: BoxFit.fill,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      clothsController.clothsList[index].name
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      maxLines: 2,
                                    ),
                                    Text(
                                        "Rs. ${clothsController.clothsList[index].price.toString()}",
                                        style: const TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16)),
                                    IconButton(
                                        onPressed: () {
                                          cartController.addCart(
                                              userId: accountController
                                                  .accountList[0].id
                                                  .toString(),
                                              productId: baseProductController
                                                  .baseProductList[index].id
                                                  .toString());
                                        },
                                        icon: const Icon(
                                            Icons.shopping_basket_rounded)),
                                    IconButton(
                                        onPressed: () {
                                          whitelistController.addWhitelist(
                                              userId: accountController
                                                  .accountList[0].id
                                                  .toString(),
                                              productId: baseProductController
                                                  .baseProductList[index].id
                                                  .toString());
                                        },
                                        icon: const Icon(Icons.favorite))
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("RECOMMEND  FOOTWARE PRODUCTS",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("OUR BEST PRODUCTS RECOMMENDED FOR YOU",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: Get.height * .8,
            child: Expanded(
              child: FutureBuilder(
                  future: shoesController.fetchShoes(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); // Loading state
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}'); // Error state
                    } else {
                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: shoesController.shoesList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Get.toNamed('/checkout', parameters: {
                                        'product_id': baseProductController
                                            .baseProductList[index].id
                                            .toString(),
                                        'product_price': baseProductController
                                            .baseProductList[index].price
                                            .toString()
                                      });
                                    },
                                    child: Image.network(
                                      shoesController.shoesList[index].image
                                          .toString(),
                                      height: Get.height * 0.3,
                                      width: Get.width,
                                      fit: BoxFit.fill,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      shoesController.shoesList[index].name
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      maxLines: 2,
                                    ),
                                    Text(
                                        "Rs. ${shoesController.shoesList[index].price.toString()}",
                                        style: const TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16)),
                                    IconButton(
                                        onPressed: () {
                                          cartController.addCart(
                                              userId: accountController
                                                  .accountList[0].id
                                                  .toString(),
                                              productId: baseProductController
                                                  .baseProductList[index].id
                                                  .toString());
                                        },
                                        icon: const Icon(
                                            Icons.shopping_basket_rounded)),
                                    IconButton(
                                        onPressed: () {
                                          whitelistController.addWhitelist(
                                              userId: accountController
                                                  .accountList[0].id
                                                  .toString(),
                                              productId: baseProductController
                                                  .baseProductList[index].id
                                                  .toString());
                                        },
                                        icon: const Icon(Icons.favorite))
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("RECOMMEND   WATCHES PRODUCTS",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("OUR BEST PRODUCTS RECOMMENDED FOR YOU",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: Get.height * .8,
            child: Expanded(
              child: FutureBuilder(
                  future: watchesController.fetchWatches(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); // Loading state
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}'); // Error state
                    } else {
                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: watchesController.watchesList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Get.toNamed('/checkout', parameters: {
                                        'product_id': baseProductController
                                            .baseProductList[index].id
                                            .toString(),
                                        'product_price': baseProductController
                                            .baseProductList[index].price
                                            .toString()
                                      });
                                    },
                                    child: Image.network(
                                      watchesController.watchesList[index].image
                                          .toString(),
                                      height: Get.height * 0.3,
                                      width: Get.width,
                                      fit: BoxFit.fill,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      watchesController.watchesList[index].name
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      maxLines: 2,
                                    ),
                                    Text(
                                        "Rs. ${watchesController.watchesList[index].price.toString()}",
                                        style: const TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16)),
                                    IconButton(
                                        onPressed: () {
                                          cartController.addCart(
                                              userId: accountController
                                                  .accountList[0].id
                                                  .toString(),
                                              productId: baseProductController
                                                  .baseProductList[index].id
                                                  .toString());
                                        },
                                        icon: const Icon(
                                            Icons.shopping_basket_rounded)),
                                    IconButton(
                                        onPressed: () {
                                          whitelistController.addWhitelist(
                                              userId: accountController
                                                  .accountList[0].id
                                                  .toString(),
                                              productId: baseProductController
                                                  .baseProductList[index].id
                                                  .toString());
                                        },
                                        icon: const Icon(Icons.favorite))
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("OURS BEST HANDBAGS PRODUCTS",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("OUR BEST HANDBAGS FOR YOU",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: Get.height * .8,
            child: Expanded(
              child: FutureBuilder(
                  future: handbagsController.fetchHandbags(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); // Loading state
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}'); // Error state
                    } else {
                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: handbagsController.handbagsList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Get.toNamed('/checkout', parameters: {
                                        'product_id': baseProductController
                                            .baseProductList[index].id
                                            .toString(),
                                        'product_price': baseProductController
                                            .baseProductList[index].price
                                            .toString()
                                      });
                                    },
                                    child: Image.network(
                                      handbagsController
                                          .handbagsList[index].image
                                          .toString(),
                                      height: Get.height * 0.3,
                                      width: Get.width,
                                      fit: BoxFit.fill,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      handbagsController
                                          .handbagsList[index].name
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      maxLines: 2,
                                    ),
                                    Text(
                                        "Rs. ${handbagsController.handbagsList[index].price.toString()}",
                                        style: const TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16)),
                                    IconButton(
                                        onPressed: () {
                                          cartController.addCart(
                                              userId: accountController
                                                  .accountList[0].id
                                                  .toString(),
                                              productId: baseProductController
                                                  .baseProductList[index].id
                                                  .toString());
                                        },
                                        icon: const Icon(
                                            Icons.shopping_basket_rounded)),
                                    IconButton(
                                        onPressed: () {
                                          whitelistController.addWhitelist(
                                              userId: accountController
                                                  .accountList[0].id
                                                  .toString(),
                                              productId: baseProductController
                                                  .baseProductList[index].id
                                                  .toString());
                                        },
                                        icon: const Icon(Icons.favorite))
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("RECOMMEND GLASSES PRODUCTS",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(" BEST SELLING GLASSES PRODUCTS",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: Get.height * .8,
            child: Expanded(
              child: FutureBuilder(
                  future: glassesController.fetchGlasses(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); // Loading state
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}'); // Error state
                    } else {
                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: glassesController.glassesList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Get.toNamed('/checkout', parameters: {
                                        'product_id': baseProductController
                                            .baseProductList[index].id
                                            .toString(),
                                        'product_price': baseProductController
                                            .baseProductList[index].price
                                            .toString()
                                      });
                                    },
                                    child: Image.network(
                                      glassesController.glassesList[index].image
                                          .toString(),
                                      height: Get.height * 0.3,
                                      width: Get.width,
                                      fit: BoxFit.fill,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      glassesController.glassesList[index].name
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      maxLines: 2,
                                    ),
                                    Text(
                                        "Rs. ${glassesController.glassesList[index].price.toString()}",
                                        style: const TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16)),
                                    IconButton(
                                        onPressed: () {
                                          cartController.addCart(
                                              userId: accountController
                                                  .accountList[0].id
                                                  .toString(),
                                              productId: baseProductController
                                                  .baseProductList[index].id
                                                  .toString());
                                        },
                                        icon: const Icon(
                                            Icons.shopping_basket_rounded)),
                                    IconButton(
                                        onPressed: () {
                                          whitelistController.addWhitelist(
                                              userId: accountController
                                                  .accountList[0].id
                                                  .toString(),
                                              productId: baseProductController
                                                  .baseProductList[index].id
                                                  .toString());
                                        },
                                        icon: const Icon(Icons.favorite))
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }),
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
          const SizedBox(
              child: Text(
            "Copyright 2023-ALL RIGHTS RESERVED",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );
  }
}
