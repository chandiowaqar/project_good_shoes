import 'checkout.dart';
import 'package:flutter/material.dart';
class BuyNowPage extends StatefulWidget {
  final String name;
  final String image;
  final String price;
  final int quantity;

  const BuyNowPage({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });

  @override
  State<BuyNowPage> createState() => _BuyNowPageState();
}

class _BuyNowPageState extends State<BuyNowPage> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

  double get priceValue {
    return double.tryParse(
          widget.price.replaceAll('\$', '').trim(),
        ) ??
        0;
  }

  double get totalPrice {
    return priceValue * quantity;
  }

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // =====================================================
      // APP BAR
      // =====================================================

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),

        title: const Text(
          "Buy Now",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
      ),

      // =====================================================
      // BODY
      // =====================================================

      body: SafeArea(
        child: Column(
          children: [

            // =================================================
            // PRODUCT
            // =================================================

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(15),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    // PRODUCT CARD

                    Container(
                      padding: const EdgeInsets.all(12),

                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                            BorderRadius.circular(20),
                      ),

                      child: Row(
                        children: [

                          // IMAGE

                          Container(
                            height: 110,
                            width: 110,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(15),
                            ),

                            child: Image.asset(
                              widget.image,
                              fit: BoxFit.contain,
                            ),
                          ),

                          const SizedBox(width: 15),

                          // DETAILS

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              children: [

                                Text(
                                  widget.name,

                                  maxLines: 2,

                                  overflow:
                                      TextOverflow.ellipsis,

                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                Text(
                                  widget.price,

                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 12),

                                // QUANTITY

                                Row(
                                  children: [

                                    IconButton(
                                      onPressed:
                                          decreaseQuantity,

                                      padding:
                                          EdgeInsets.zero,

                                      constraints:
                                          const BoxConstraints(),

                                      icon: const Icon(
                                        Icons
                                            .remove_circle_outline,
                                      ),
                                    ),

                                    Padding(
                                      padding:
                                          const EdgeInsets
                                              .symmetric(
                                        horizontal: 12,
                                      ),

                                      child: Text(
                                        "$quantity",

                                        style:
                                            const TextStyle(
                                          fontSize: 16,
                                          fontWeight:
                                              FontWeight.bold,
                                        ),
                                      ),
                                    ),

                                    IconButton(
                                      onPressed:
                                          increaseQuantity,

                                      padding:
                                          EdgeInsets.zero,

                                      constraints:
                                          const BoxConstraints(),

                                      icon: const Icon(
                                        Icons
                                            .add_circle_outline,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // =================================================
                    // ORDER SUMMARY
                    // =================================================

                    const Text(
                      "Order Summary",

                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Container(
                      padding: const EdgeInsets.all(18),

                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius:
                            BorderRadius.circular(18),
                      ),

                      child: Column(
                        children: [

                          // PRODUCT PRICE

                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,

                            children: [

                              const Text(
                                "Product",

                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),

                              Text(
                                "\$${priceValue.toStringAsFixed(0)}",

                                style: const TextStyle(
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          // QUANTITY

                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,

                            children: [

                              const Text(
                                "Quantity",

                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),

                              Text(
                                "$quantity",

                                style: const TextStyle(
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          // DELIVERY

                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,

                            children: [

                              const Text(
                                "Delivery",

                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),

                              const Text(
                                "Free",

                                style: TextStyle(
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          const Divider(
                            height: 25,
                          ),

                          // TOTAL

                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,

                            children: [

                              const Text(
                                "Total",

                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),

                              Text(
                                "\$${totalPrice.toStringAsFixed(0)}",

                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // =================================================
            // BOTTOM BUTTON
            // =================================================

            Container(
              padding: const EdgeInsets.fromLTRB(
                15,
                12,
                15,
                15,
              ),

              decoration: const BoxDecoration(
                color: Colors.white,

                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  ),
                ],
              ),

              child:  SizedBox(
  width: double.infinity,
  height: 55,
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CheckoutPage(
            products: [
              {
                "name": widget.name,
                "image": widget.image,
                "price": widget.price,
                "quantity": widget.quantity,
              },
            ],
          ),
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: const Text(
      "Proceed to Checkout",
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),
         ) ],
        ),
      ),
    );
  }
}
