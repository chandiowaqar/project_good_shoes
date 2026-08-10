import 'package:flutter/material.dart';
import 'package:good_shoes/brand_products.dart';
import 'package:good_shoes/cart_page.dart';
import 'package:good_shoes/dashboard.dart';
import 'package:good_shoes/favorites.dart';
import 'package:good_shoes/profile.dart';
import 'package:good_shoes/custom_nav_bar.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final int _currentIndex = 1;

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
    // =====================================================
    // POPSCOPE INTERCEPTS BACK BUTTON
    // =====================================================
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const dashboard()),
          (route) => false,
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              // Appbar back button also goes to dashboard
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const dashboard()),
                (route) => false,
              );
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "Categories",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: "Search categories...",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Shop by Brand",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _categoryCard(context, name: "Nike", image: "assets/nikelogo.png"),
                  _categoryCard(context, name: "Adidas", image: "assets/adidaslogo.png"),
                  _categoryCard(context, name: "Jordan", image: "assets/jordanlogo.png"),
                  _categoryCard(context, name: "Puma", image: "assets/pumalogo.png"),
                  _categoryCard(context, name: "Reebok", image: "assets/reeboklogo.png"),
                  _categoryCard(context, name: "New Balance", image: "assets/nblogo.png"),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: _currentIndex,
          onItemTapped: _onNavTapped,
        ),
      ),
    );
  }

  Widget _categoryCard(
    BuildContext context, {
    required String name,
    required String image,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BrandProductsPage(brand: name),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "View Products",
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}