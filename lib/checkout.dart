import 'package:flutter/material.dart';
import 'order_placed.dart';

class CheckoutPage extends StatefulWidget {
  final List<Map<String, dynamic>> products;

  const CheckoutPage({
    super.key,
    required this.products,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();

  // Address
  final TextEditingController addressController =
      TextEditingController();

  // Card details
  final TextEditingController cardNumberController =
      TextEditingController();

  final TextEditingController cardHolderController =
      TextEditingController();

  final TextEditingController expiryController =
      TextEditingController();

  final TextEditingController cvvController =
      TextEditingController();

  String selectedPayment = "Cash on Delivery";

  double get totalAmount {
    double total = 0;

    for (final product in widget.products) {
      final price = double.tryParse(
            product["price"]
                .toString()
                .replaceAll("\$", "")
                .replaceAll(",", ""),
          ) ??
          0;

      final quantity = product["quantity"] ?? 1;

      total += price * quantity;
    }

    return total;
  }

  @override
  void dispose() {
    addressController.dispose();
    cardNumberController.dispose();
    cardHolderController.dispose();
    expiryController.dispose();
    cvvController.dispose();

    super.dispose();
  }

  // =========================================================
  // PLACE ORDER
  // =========================================================

  void placeOrder() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const OrderPlacedPage(),
      ),
    );
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
          "Checkout",
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
        child: Form(
          key: _formKey,

          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // =================================================
                // DELIVERY ADDRESS
                // =================================================

                const Text(
                  "Delivery Address",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: addressController,
                  maxLines: 3,

                  decoration: InputDecoration(
                    hintText: "Enter your delivery address",

                    prefixIcon: const Icon(
                      Icons.location_on_outlined,
                      color: Colors.black,
                    ),

                    filled: true,
                    fillColor: Colors.grey.shade100,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),

                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return "Delivery address is required";
                    }

                    if (value.trim().length < 10) {
                      return "Please enter a complete address";
                    }

                    return null;
                  },
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

                const SizedBox(height: 12),

                ...widget.products.map(
                  (product) {
                    final quantity =
                        product["quantity"] ?? 1;

                    return Container(
                      margin:
                          const EdgeInsets.only(bottom: 10),

                      padding:
                          const EdgeInsets.all(10),

                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                            BorderRadius.circular(15),
                      ),

                      child: Row(
                        children: [
                          // IMAGE
                          Container(
                            height: 75,
                            width: 75,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(12),
                            ),

                            child: Image.asset(
                              product["image"],
                              fit: BoxFit.contain,
                            ),
                          ),

                          const SizedBox(width: 12),

                          // DETAILS
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              children: [
                                Text(
                                  product["name"],
                                  maxLines: 1,
                                  overflow:
                                      TextOverflow.ellipsis,

                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  product["price"],
                                  style: const TextStyle(
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 3),

                                Text(
                                  "Quantity: $quantity",
                                  style: TextStyle(
                                    color:
                                        Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 15),

                // =================================================
                // PAYMENT METHOD
                // =================================================

                const Text(
                  "Payment Method",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius:
                        BorderRadius.circular(15),
                  ),

                  child: Column(
                    children: [
                      // CASH
                      RadioListTile<String>(
                        value: "Cash on Delivery",
                        groupValue: selectedPayment,

                        onChanged: (value) {
                          setState(() {
                            selectedPayment = value!;
                          });
                        },

                        title: const Text(
                          "Cash on Delivery",
                        ),

                        secondary: const Icon(
                          Icons.money,
                        ),
                      ),

                      // CARD
                      RadioListTile<String>(
                        value: "Card",
                        groupValue: selectedPayment,

                        onChanged: (value) {
                          setState(() {
                            selectedPayment = value!;
                          });
                        },

                        title: const Text(
                          "Credit / Debit Card",
                        ),

                        secondary: const Icon(
                          Icons.credit_card,
                        ),
                      ),
                    ],
                  ),
                ),

                // =================================================
                // CARD DETAILS
                // =================================================

                if (selectedPayment == "Card") ...[
                  const SizedBox(height: 20),

                  const Text(
                    "Card Details",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // CARD HOLDER
                  TextFormField(
                    controller: cardHolderController,

                    textCapitalization:
                        TextCapitalization.words,

                    decoration: InputDecoration(
                      labelText: "Card Holder Name",
                      hintText: "Enter name on card",

                      prefixIcon: const Icon(
                        Icons.person_outline,
                      ),

                      filled: true,
                      fillColor: Colors.grey.shade100,

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),

                    validator: (value) {
                      if (selectedPayment != "Card") {
                        return null;
                      }

                      if (value == null ||
                          value.trim().isEmpty) {
                        return "Card holder name is required";
                      }

                      if (value.trim().length < 3) {
                        return "Enter a valid name";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  // CARD NUMBER
                  TextFormField(
                    controller: cardNumberController,

                    keyboardType:
                        TextInputType.number,

                    maxLength: 16,

                    decoration: InputDecoration(
                      labelText: "Card Number",
                      hintText: "Enter 16 digit card number",

                      prefixIcon: const Icon(
                        Icons.credit_card,
                      ),

                      counterText: "",

                      filled: true,
                      fillColor: Colors.grey.shade100,

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),

                    validator: (value) {
                      if (selectedPayment != "Card") {
                        return null;
                      }

                      if (value == null ||
                          value.trim().isEmpty) {
                        return "Card number is required";
                      }

                      final cardNumber =
                          value.replaceAll(" ", "");

                      if (cardNumber.length != 16) {
                        return "Card number must be 16 digits";
                      }

                      if (!RegExp(
                        r'^[0-9]+$',
                      ).hasMatch(cardNumber)) {
                        return "Enter numbers only";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  // EXPIRY + CVV
                  Row(
                    children: [
                      // EXPIRY
                      Expanded(
                        child: TextFormField(
                          controller:
                              expiryController,

                          keyboardType:
                              TextInputType.number,

                          maxLength: 5,

                          decoration:
                              InputDecoration(
                            labelText: "Expiry",
                            hintText: "MM/YY",

                            prefixIcon:
                                const Icon(
                              Icons.date_range,
                            ),

                            counterText: "",

                            filled: true,
                            fillColor:
                                Colors.grey.shade100,

                            border:
                                OutlineInputBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(15),
                              borderSide:
                                  BorderSide.none,
                            ),
                          ),

                          validator: (value) {
                            if (selectedPayment !=
                                "Card") {
                              return null;
                            }

                            if (value == null ||
                                value.trim().isEmpty) {
                              return "Required";
                            }

                            if (!RegExp(
                              r'^(0[1-9]|1[0-2])\/\d{2}$',
                            ).hasMatch(value.trim())) {
                              return "Use MM/YY";
                            }

                            return null;
                          },
                        ),
                      ),

                      const SizedBox(width: 12),

                      // CVV
                      Expanded(
                        child: TextFormField(
                          controller:
                              cvvController,

                          keyboardType:
                              TextInputType.number,

                          obscureText: true,

                          maxLength: 3,

                          decoration:
                              InputDecoration(
                            labelText: "CVV",
                            hintText: "123",

                            prefixIcon:
                                const Icon(
                              Icons.lock_outline,
                            ),

                            counterText: "",

                            filled: true,
                            fillColor:
                                Colors.grey.shade100,

                            border:
                                OutlineInputBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(15),
                              borderSide:
                                  BorderSide.none,
                            ),
                          ),

                          validator: (value) {
                            if (selectedPayment !=
                                "Card") {
                              return null;
                            }

                            if (value == null ||
                                value.trim().isEmpty) {
                              return "Required";
                            }

                            if (!RegExp(
                              r'^\d{3}$',
                            ).hasMatch(value.trim())) {
                              return "3 digits";
                            }

                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ],

                const SizedBox(height: 25),

                // =================================================
                // TOTAL
                // =================================================

                Container(
                  padding: const EdgeInsets.all(18),

                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius:
                        BorderRadius.circular(18),
                  ),

                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                    children: [
                      const Text(
                        "Total Amount",

                        style: TextStyle(
                          fontSize: 19,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      Text(
                        "\$${totalAmount.toStringAsFixed(0)}",

                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // =================================================
                // PLACE ORDER
                // =================================================

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    onPressed: placeOrder,

                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30),
                      ),
                    ),

                    child: const Text(
                      "Place Order",

                      style: TextStyle(
                        fontSize: 17,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}