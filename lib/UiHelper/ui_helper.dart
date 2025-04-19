import 'package:flutter/material.dart';

class UiHelper {
  Widget customProductContainer({
    required String productName,
    required int productPrice,
    required String imagePath,
    required int id,
    required VoidCallback buyProduct,
    required VoidCallback addCart,
  }) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.all(5),
      constraints: BoxConstraints(maxWidth: 160, minHeight: 250), // ✅ Prevent overflow
      child: Column(
        mainAxisSize: MainAxisSize.min, // ✅ Overflow fix
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// 🖼️ Product Image
          Container(
            width: 130,
            height: 140, // ✅ Adjusted height to fix overflow
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),

          /// 🏷️ Product Name
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                productName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis, // ✅ Prevent text overflow
              ),
            ),
          ),

          /// 💰 Product Price
          SizedBox(height: 5),
          Text(
            "\u20B9 ${productPrice.toString()}",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),

          /// 🛒 Cart & Buy Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /// 🛒 Cart Button
              Container(
                width: 50,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue, width: 1),
                ),
                child: InkWell(
                  onTap: addCart,
                  child: Image.asset(
                    "assets/icons/cart.png",
                    width: 30,
                    height: 30,
                  ),
                ),
              ),

              /// 🛍️ Buy Now Button
              SizedBox(width: 20,),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: buyProduct,
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget customListTile({required String name, required IconData icon}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
    );
  }

  /// 📢 Snackbar Function
  void customScaffoldMessengerTextShow({
    required BuildContext context,
    required String text,
    Color? bgColor,
    Duration? duration,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 30, right: 20, left: 20),
        behavior: SnackBarBehavior.floating,
        backgroundColor: bgColor ?? Colors.black87,
        duration: duration ?? const Duration(seconds: 2),
        content: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
