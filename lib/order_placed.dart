
import 'package:flutter/material.dart';
import 'package:good_shoes/dashboard.dart';

class OrderPlacedPage extends StatelessWidget {
  const OrderPlacedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                // =========================================
                // SUCCESS ICON
                // =========================================

                Container(
                  height: 120,
                  width: 120,

                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    shape: BoxShape.circle,
                  ),

                  child: Icon(
                    Icons.check,
                    size: 70,
                    color: Colors.green.shade700,
                  ),
                ),

                const SizedBox(height: 30),

                // =========================================
                // TITLE
                // =========================================

                const Text(
                  "Order Placed!",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 15),

                // =========================================
                // MESSAGE
                // =========================================

                Text(
                  "Your order has been placed successfully.",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Thank you for shopping with us!",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade600,
                  ),
                ),

                const SizedBox(height: 40),

                // =========================================
                // CONTINUE SHOPPING
                // =========================================

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    onPressed: () {

                      // Clear payment/cart/order screens
                      // and return to dashboard.

                      Navigator.pushAndRemoveUntil(
                        context,

                        MaterialPageRoute(
                          builder: (context) =>
                              const dashboard(),
                        ),

                        (route) => false,
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,

                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30),
                      ),
                    ),

                    child: const Text(
                      "Continue Shopping",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
