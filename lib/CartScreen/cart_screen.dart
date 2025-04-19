import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../UiHelper/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);

    // 🟢 Total Calculation
    int totalItems = cart.cartItems.length;
    double totalPrice = cart.cartItems.fold(0, (sum, item) => sum + item['price'] * item['quantity']);
    double deliveryCharges = totalPrice > 1000 ? 0 : 199;
    double finalAmount = totalPrice + deliveryCharges;

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text("My Cart", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: cart.cartItems.isEmpty
          ? Center(
        child: Text(
          "Your cart is empty",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: cart.cartItems.length,
              itemBuilder: (context, index) {
                var product = cart.cartItems[index];

                return Container(
                  padding: EdgeInsets.only(right: 10, left: 10, top: 20, bottom: 20),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      /// 📸 Product Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          product['image'],
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 20),

                      /// 🏷️ Product Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['name'],
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "₹ ${product['price']}",
                              style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),

                      /// ➖ Quantity Modifier
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.grey),
                            onPressed: () {
                              cart.decreaseQuantity(index);
                            },
                          ),
                          Text(
                            product['quantity'].toString(),
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.grey),
                            onPressed: () {
                              cart.increaseQuantity(index);
                            },
                          ),
                        ],
                      ),

                      /// 🗑️ Delete Button
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          cart.removeFromCart(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // 🟢 Total Price Calculation Box
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 10)
              ],
            ),
            child: Column(
              children: [
                _buildPriceRow("Total Items:", "$totalItems"),
                _buildPriceRow("Total Price:", "₹ $totalPrice"),
                _buildPriceRow("Delivery Charges:", deliveryCharges == 0 ? "Free" : "₹ $deliveryCharges"),
                Divider(thickness: 2),
                _buildPriceRow("Final Amount:", "₹ $finalAmount", isBold: true),
                SizedBox(height: 10),

                /// 🔽 Checkout Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Proceeding to Checkout...")),
                      );
                    },
                    child: Text("Checkout", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🟢 Price Row Widget
  Widget _buildPriceRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
