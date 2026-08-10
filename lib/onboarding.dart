
import 'package:flutter/material.dart';
import 'loginPage.dart';
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  int currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      "image": "assets/shoe1.png",
      "title": "Find Your Style",
      "description":
          "Discover the latest shoes from your favorite brands and find the perfect style for you.",
    },
    {
      "image": "assets/shoe2.png",
      "title": "Choose Your Favorite",
      "description":
          "Explore Nike, Adidas, Jordan, Puma, Reebok and New Balance shoes in one place.",
    },
    {
      "image": "assets/shoe3.png",
      "title": "Shop With Ease",
      "description":
          "Add your favorite shoes to the cart and enjoy a simple and easy shopping experience.",
    },
  ];

  void nextPage() {
    if (currentPage < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      goToLogin();
    }
  }

  void goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const login(),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [

            // ==============================
            // SKIP BUTTON
            // ==============================

            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  top: 15,
                ),
                child: TextButton(
                  onPressed: goToLogin,
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            // ==============================
            // PAGES
            // ==============================

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,

                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },

                itemBuilder: (context, index) {
                  final page = pages[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),

                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,

                      children: [

                        // ==========================
                        // SHOE IMAGE
                        // ==========================

                        Container(
                          height: 330,
                          width: double.infinity,

                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:
                                BorderRadius.circular(30),
                          ),

                          child: Padding(
                            padding:
                                const EdgeInsets.all(25),

                            child: Image.asset(
                              page["image"]!,
                              fit: BoxFit.contain,

                              errorBuilder:
                                  (context, error, stackTrace) {
                                return const Icon(
                                  Icons.image_not_supported,
                                  size: 80,
                                  color: Colors.grey,
                                );
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),

                        // ==========================
                        // TITLE
                        // ==========================

                        Text(
                          page["title"]!,

                          textAlign: TextAlign.center,

                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 15),

                        // ==========================
                        // DESCRIPTION
                        // ==========================

                        Text(
                          page["description"]!,

                          textAlign: TextAlign.center,

                          style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // ==============================
            // PAGE INDICATORS
            // ==============================

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: List.generate(
                pages.length,
                (index) {
                  final selected =
                      currentPage == index;

                  return AnimatedContainer(
                    duration:
                        const Duration(milliseconds: 300),

                    margin:
                        const EdgeInsets.symmetric(
                      horizontal: 4,
                    ),

                    height: 8,

                    width: selected ? 25 : 8,

                    decoration: BoxDecoration(
                      color: selected
                          ? Colors.black
                          : Colors.grey.shade300,

                      borderRadius:
                          BorderRadius.circular(10),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // ==============================
            // NEXT / GET STARTED BUTTON
            // ==============================

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),

              child: SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: nextPage,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,

                    elevation: 0,

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30),
                    ),
                  ),

                  child: Text(
                    currentPage == pages.length - 1
                        ? "Get Started"
                        : "Next",

                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
