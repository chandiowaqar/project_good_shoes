import 'dart:ui';
import 'package:flutter/material.dart';
import 'favorites.dart';
import 'favorites_data.dart';
import 'package:good_shoes/cart_page.dart';
import 'package:good_shoes/categories.dart';
import 'package:good_shoes/product_page.dart';
import 'package:good_shoes/brand_products.dart';
import 'package:good_shoes/profile.dart';
import 'package:good_shoes/custom_nav_bar.dart'; 
import 'package:good_shoes/custom_drawer.dart'; 

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  // Home is index 0
  final int _currentIndex = 0;

  // =====================================================
  // SEAMLESS NAVIGATION BAR LOGIC
  // =====================================================
  void _onNavTapped(int index) {
    if (index == _currentIndex) return;

    Widget nextScreen;
    if (index == 0) {
      nextScreen = const dashboard();
    } else if (index == 1) {
      nextScreen = const CategoriesPage();
    } else if (index == 2) {
      nextScreen = const FavoritesPage();
    } else if (index == 3) {
      nextScreen = const CartPage();
    } else if (index == 4) {
      nextScreen = const ProfilePage();
    } else {
      return;
    }

    // Instant swap without sliding animation
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => nextScreen,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // =====================================================
      // CUSTOM DRAWER (Slides from the right)
      // =====================================================
      endDrawer: const CustomDrawer(),

      // =====================================================
      // APP BAR
      // =====================================================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        
        // Logo on the left
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: AssetImage("assets/logo.png"),
              fit: BoxFit.cover,
            ),
            color: Colors.grey.shade200,
          ),
        ),
        
        title: const Center(
          child: Text(
            "Good Shoes",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.black,
            ),
          ),
        ),
        
        // Menu button on the right (Replaced the Avatar)
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                padding: const EdgeInsets.only(right: 12),
                icon: const Icon(
                  Icons.menu, // Hamburger menu icon
                  color: Colors.black,
                  size: 32,
                ),
                onPressed: () {
                  // Opens the endDrawer from the right side
                  Scaffold.of(context).openEndDrawer(); 
                },
              );
            }
          ),
        ],
      ),

      // =====================================================
      // BODY
      // =====================================================
      body: SafeArea(
        child: Column(
          children: [
            // =================================================
            // FIXED SEARCH BAR
            // =================================================
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12, top: 8),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.black54),
                  hintText: 'Search items...',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // =================================================
            // SCROLLABLE AREA 
            // =================================================
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  // BANNER
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        image: const DecorationImage(
                          image: AssetImage("assets/banner.jpg"),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // BRANDS ROW
                  SizedBox(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      children: [
                        _buildBrandButton(context, "Adidas", "assets/adidaslogo.png"),
                        _buildBrandButton(context, "Jordan", "assets/jordanlogo.png"),
                        _buildBrandButton(context, "Nike", "assets/nikelogo.png"),
                        _buildBrandButton(context, "Puma", "assets/pumalogo.png"),
                        _buildBrandButton(context, "Reebok", "assets/reeboklogo.png"),
                        _buildBrandButton(context, "New Balance", "assets/nblogo.png"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  // NEW ARRIVAL TITLE
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "New Arrival",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  // PRODUCTS GRID
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12, bottom: 20),
                    child: GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.848, 
                      ),
                      children: const [
                        ProductCard(name: "Nike Air Huarache", image: "assets/Nikemain.png", price: "\$120"),
                        ProductCard(name: "Adidas Sneaker", image: "assets/adidas.png", price: "\$250"),
                        ProductCard(name: "Air Jordan", image: "assets/jordan.png", price: "\$279"),
                        ProductCard(name: "Speedcat OG", image: "assets/puma.png", price: "\$179"),
                        ProductCard(name: "Reebok OG", image: "assets/reebok.png", price: "\$179"),
                        ProductCard(name: "New Balance", image: "assets/nb.png", price: "\$179"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // =====================================================
      // BOTTOM NAVIGATION BAR
      // =====================================================
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _currentIndex,
        onItemTapped: _onNavTapped,
      ),
    ); 
  }

  // Helper method for the Brands row
  Widget _buildBrandButton(BuildContext context, String brandName, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BrandProductsPage(brand: brandName)),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade100,
          elevation: 0,
          minimumSize: const Size(80, 80),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: Image.asset(imagePath, width: 55, height: 55, fit: BoxFit.contain),
      ),
    );
  }
}

// =====================================================
// REUSABLE PRODUCT CARD WIDGET
// =====================================================
class ProductCard extends StatefulWidget {
  final String name;
  final String image;
  final String price;

  const ProductCard({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final Color favoriteColor = Colors.red;
  final Color buyButtonColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100, 
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    if (FavoritesData.isFavorite(widget.name)) {
                      FavoritesData.removeFavorite(widget.name);
                    } else {
                      FavoritesData.addFavorite({
                        "name": widget.name,
                        "image": widget.image,
                        "price": widget.price,
                      });
                    }
                  });
                },
                icon: Icon(
                  FavoritesData.isFavorite(widget.name) ? Icons.favorite : Icons.favorite_border,
                  color: FavoritesData.isFavorite(widget.name) ? favoriteColor : Colors.black54,
                  size: 16,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover, 
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis, 
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.price,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => page(
                        name: widget.name,
                        image: widget.image,
                        price: widget.price,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: buyButtonColor, 
                  foregroundColor: Colors.white,
                  minimumSize: const Size(50, 28),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("Buy", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}