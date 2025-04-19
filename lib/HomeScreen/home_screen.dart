import 'package:aqua_express_cloth/CartScreen/cart_screen.dart';
import 'package:aqua_express_cloth/DrawerFile/drawer_option.dart';
import 'package:aqua_express_cloth/DrawerFile/side_menu_bar.dart';
import 'package:aqua_express_cloth/UiHelper/ui_helper.dart';
import 'package:aqua_express_cloth/UiHelper/cart_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final ScrollController scrollController;
  const HomeScreen({super.key, required this.scrollController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List sliderImageList = [
    {"id": 1, "image_path": "assets/images/slid1.jpg"},
    {"id": 2, "image_path": "assets/images/slid2.jpg"},
    {"id": 3, "image_path": "assets/images/slid3.jpg"},
  ];
  int currentIndex = 0;

  List<Map<String, dynamic>> products = [
    {
      "id": 1,
      "name": "Water Sets",
      "price": 99,
      "image": "assets/images/cart1.jpg",
    },
    {
      "id": 2,
      "name": "Mineral Water",
      "price": 20,
      "image": "assets/images/cart2.jpg",
    },
    {
      "id": 3,
      "name": "Water Cane",
      "price": 199,
      "image": "assets/images/cart3.jpg",
    },
    {
      "id": 4,
      "name": "Cold Drink",
      "price": 149,
      "image": "assets/images/cart4.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);

    return Scaffold(
      endDrawer:SideMenuBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue, size: 35),
        backgroundColor: Colors.blue.shade100,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: Image.asset("assets/images/playstore.png"),
            ),
            SizedBox(width: 20),
            Text(
              "Aqua Express",
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: "roboto",
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue.shade100,
      body: SingleChildScrollView(
        controller: widget.scrollController,
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  CarouselSlider(
                    items:
                        sliderImageList.map((path) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              path["image_path"],
                              fit: BoxFit.fill,
                            ),
                          );
                        }).toList(),
                    options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: true,
                      aspectRatio: 2,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Our Products",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              "Choose your Products",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),

            Container(
              margin: EdgeInsets.only(bottom: 30,right: 5,left: 5),

              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.77,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  var product = products[index];
                  return UiHelper().customProductContainer(
                    productName: product["name"],
                    productPrice: product["price"],
                    imagePath: product["image"],
                    id: product["id"],
                    addCart: () {
                      cart.addToCart(product);
                      UiHelper().customScaffoldMessengerTextShow(
                        context: context,
                        text: "${product["name"]} added to cart",
                        bgColor: Colors.green,
                        duration: Duration(seconds: 1),
                      );
                    },
                    buyProduct: () {
                      cart.addToCart(product);
                      UiHelper().customScaffoldMessengerTextShow(
                        context: context,
                        text: "${product["name"]} added to cart",
                        bgColor: Colors.green,
                        duration: Duration(seconds: 1),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartScreen()),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
