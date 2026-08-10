import 'package:flutter/material.dart';
import 'favorites_data.dart';
import 'package:good_shoes/cart_page.dart';
import 'package:good_shoes/dashboard.dart';
import 'package:good_shoes/categories.dart';
import 'package:good_shoes/profile.dart';
import 'package:good_shoes/custom_nav_bar.dart'; // Import your custom nav bar

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  // Favorites is index 2
  final int _currentIndex = 2;

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

  // =====================================================
  // GO TO DASHBOARD (For Back Buttons)
  // =====================================================
  void goToDashboard() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const dashboard(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final favorites = FavoritesData.favorites;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        // Android back button - Always go to Dashboard
        goToDashboard();
      },
      child: Scaffold(
        backgroundColor: Colors.white,

        // =====================================================
        // APP BAR
        // =====================================================
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              goToDashboard();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "Favorites",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),

        // =====================================================
        // BODY
        // =====================================================
        body: favorites.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 70,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 15),
                    Text(
                      "No favorite products",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Add products to your favorites",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final product = favorites[index];

                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // =================================================
                        // FAVORITE BUTTON
                        // =================================================
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setState(() {
                                  FavoritesData.removeFavorite(
                                    product["name"],
                                  );
                                });
                              },
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 19,
                              ),
                            ),
                          ),
                        ),

                        // =================================================
                        // IMAGE
                        // =================================================
                        Expanded(
                          child: Center(
                            child: Image.asset(
                              product["image"],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(height: 5),

                        // =================================================
                        // NAME
                        // =================================================
                        Text(
                          product["name"],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        // =================================================
                        // PRICE
                        // =================================================
                        Text(
                          product["price"],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  );
                },
              ),

        // =====================================================
        // BOTTOM NAVIGATION BAR
        // =====================================================
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: _currentIndex,
          onItemTapped: _onNavTapped,
        ),
      ),
    );
  }
}