import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:good_shoes/cart_data.dart';
import 'package:good_shoes/cart_page.dart';
import 'package:good_shoes/buy_now_page.dart';

class page extends StatefulWidget {
  final String name;
  final String image;
  final String price;

  const page({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  State<page> createState() => _PageState();
}

class _PageState extends State<page> {
  int selectedImage = 0;
  int selectedSize = 42;
  bool isFavorite = false;

  final List<String> sizes = [
    "40",
    "41",
    "42",
    "43",
    "44",
  ];

  // =========================================================
  // PRODUCT IMAGES
  // =========================================================

  List<String> get productImages {
    final productName = widget.name.toLowerCase();

    if (productName.contains("nike")) {
      return [
        "assets/Nikemain.png",
        "assets/Nike1.png",
        "assets/Nike2.png",
        "assets/Nike3.png",
      ];
    }

    if (productName.contains("new balance")) {
      return [
        "assets/nb.png",
        "assets/nb1.png",
        "assets/nb2.png",
        "assets/nb3.png",
      ];
    }

    if (productName.contains("adidas")) {
      return [
        "assets/adidas.png",
        "assets/adidas1.png",
        "assets/adidas2.png",
        "assets/adidas3.png",
      ];
    }

    if (productName.contains("puma")) {
      return [
        "assets/puma.png",
        "assets/puma1.png",
        "assets/puma2.png",
        "assets/puma3.png",
      ];
    }

    if (productName.contains("reebok")) {
      return [
        "assets/reebok.png",
        "assets/reebok1.png",
        "assets/reebok2.png",
        "assets/reebok3.png",
      ];
    }

    if (productName.contains("jordan")) {
      return [
        "assets/jordan.png",
        "assets/jordan1.png",
        "assets/jordan2.png",
      ];
    }

    return [
      widget.image,
      widget.image,
      widget.image,
    ];
  }

  // =========================================================
  // ADD TO CART
  // =========================================================

  void addProductToCart() {
    CartData.addToCart(
      name: widget.name,
      image: widget.image,
      price: widget.price,
      quantity: 1,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${widget.name} added to cart"),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  // =========================================================
  // OPEN CART
  // =========================================================

  void openCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CartPage(),
      ),
    );
  }

  // =========================================================
  // BUY NOW
  // =========================================================

  void buyNow() {
    // Add current product
    CartData.addToCart(
      name: widget.name,
      image: widget.image,
      price: widget.price,
      quantity: 1,
    );

    // Open cart
    openCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [

            // =================================================
            // TOP BAR
            // =================================================

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),

              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [

                  // BACK
                  Container(
                    height: 45,
                    width: 45,

                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),

                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  const Text(
                    "Product Details",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // FAVORITE
                  Container(
                    height: 45,
                    width: 45,

                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),

                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },

                      icon: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,

                        color: isFavorite
                            ? Colors.red
                            : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // =================================================
            // PRODUCT CONTENT
            // =================================================

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    // MAIN IMAGE
                    Padding(
                      padding: const EdgeInsets.all(15),

                      child: Hero(
                        tag: widget.name,

                        child: Container(
                          height: 330,
                          width: double.infinity,

                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius:
                                BorderRadius.circular(25),
                          ),

                          child: Image.asset(
                            productImages[selectedImage],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                    // IMAGE LIST
                    SizedBox(
                      height: 85,

                      child: ListView.builder(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),

                        scrollDirection:
                            Axis.horizontal,

                        itemCount:
                            productImages.length,

                        itemBuilder:
                            (context, index) {

                          final isSelected =
                              selectedImage == index;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedImage = index;
                              });
                            },

                            child: Container(
                              width: 80,

                              margin:
                                  const EdgeInsets.only(
                                right: 10,
                              ),

                              decoration:
                                  BoxDecoration(
                                color:
                                    Colors.grey.shade200,

                                borderRadius:
                                    BorderRadius.circular(
                                  15,
                                ),

                                border: Border.all(
                                  color: isSelected
                                      ? Colors.black
                                      : Colors.transparent,

                                  width: 2,
                                ),
                              ),

                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(
                                  13,
                                ),

                                child: Image.asset(
                                  productImages[index],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    // NAME
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),

                      child: Text(
                        widget.name,

                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    // PRICE
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),

                      child: Text(
                        widget.price,

                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // DESCRIPTION
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),

                      child: Text(
                        "Its simple and elegant shape makes it "
                        "perfect for those who like minimalist "
                        "and comfortable shoes. Designed for "
                        "everyday use with a modern look.",

                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          height: 1.5,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // SIZE
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(
                        horizontal: 15,
                      ),

                      child: Text(
                        "Select Size",

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      height: 50,

                      child: ListView.builder(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),

                        scrollDirection:
                            Axis.horizontal,

                        itemCount: sizes.length,

                        itemBuilder:
                            (context, index) {

                          final size =
                              int.parse(sizes[index]);

                          final selected =
                              selectedSize == size;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },

                            child: Container(
                              width: 50,

                              margin:
                                  const EdgeInsets.only(
                                right: 10,
                              ),

                              decoration:
                                  BoxDecoration(
                                color: selected
                                    ? Colors.black
                                    : Colors.grey.shade200,

                                borderRadius:
                                    BorderRadius.circular(
                                  15,
                                ),
                              ),

                              child: Center(
                                child: Text(
                                  sizes[index],

                                  style: TextStyle(
                                    color: selected
                                        ? Colors.white
                                        : Colors.black,

                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),

            // =================================================
            // BOTTOM BUTTONS
            // =================================================

            Padding(
              padding: const EdgeInsets.fromLTRB(
                15,
                8,
                15,
                15,
              ),

              child: Row(
                children: [

                  // CART ICON
                  Container(
                    height: 55,
                    width: 55,

                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),

                    child: IconButton(
                      onPressed: openCart,

                      icon: const FaIcon(
                        FontAwesomeIcons.cartShopping,
                        size: 21,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // ADD TO CART
                  Expanded(
                    child: SizedBox(
                      height: 55,

                      child: ElevatedButton(
                        onPressed:
                            addProductToCart,

                        style:
                            ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.grey.shade300,

                          foregroundColor:
                              Colors.black,

                          elevation: 0,

                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(
                              30,
                            ),
                          ),
                        ),

                        child: const FittedBox(
                          fit: BoxFit.scaleDown,

                          child: Row(
                            mainAxisSize:
                                MainAxisSize.min,

                            children: [

                              FaIcon(
                                FontAwesomeIcons
                                    .cartArrowDown,
                                size: 18,
                              ),

                              SizedBox(width: 6),

                              Text(
                                "Add to Cart",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // BUY NOW
                 Expanded( child: SizedBox( height: 55, child: ElevatedButton( onPressed: () { Navigator.push( context, MaterialPageRoute( builder: (context) => BuyNowPage( name: widget.name, image: widget.image, price: widget.price, quantity: 1, ), ), ); }, style: ElevatedButton.styleFrom( backgroundColor: Colors.black, foregroundColor: Colors.white, elevation: 0, shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30), ), ), child: const FittedBox( fit: BoxFit.scaleDown, child: Text( "Buy Now", style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold, ), ), ), ), ), ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}