import 'package:flutter/material.dart';
import 'package:good_shoes/dashboard.dart';
import 'favorites_data.dart';
import 'package:good_shoes/product_page.dart';

class BrandProductsPage extends StatefulWidget {
  final String brand;

  const BrandProductsPage({
    super.key,
    required this.brand,
  });

  @override
  State<BrandProductsPage> createState() =>
      _BrandProductsPageState();
}

class _BrandProductsPageState extends State<BrandProductsPage> {

  // =========================================================
  // PRODUCTS
  // =========================================================

  List<Map<String, String>> get products {
    switch (widget.brand.toLowerCase()) {
      case "nike":
        return [
          {
            "name": "Nike Air Huarache",
            "image": "assets/Nikemain.png",
            "price": "\$120",
          },
          {
            "name": "Nike Air Max",
            "image": "assets/Nike1.png",
            "price": "\$150",
          },
          {
            "name": "Nike Running",
            "image": "assets/Nike2.png",
            "price": "\$135",
          },
          {
            "name": "Nike Air",
            "image": "assets/Nike3.png",
            "price": "\$160",
          },
        ];

      case "adidas":
        return [
          {
            "name": "Adidas Sneaker",
            "image": "assets/adidas.png",
            "price": "\$250",
          },
          {
            "name": "Adidas Sport",
            "image": "assets/adidas1.png",
            "price": "\$220",
          },
          {
            "name": "Adidas Runner",
            "image": "assets/adidas2.png",
            "price": "\$200",
          },
          {
            "name": "Adidas Runner",
            "image": "assets/adidas3.png",
            "price": "\$200",
          },
        ];

      case "jordan":
        return [
          {
            "name": "Air Jordan",
            "image": "assets/jordan.png",
            "price": "\$279",
          },
          {
            "name": "Jordan Sport",
            "image": "assets/jordan2.png",
            "price": "\$280",
          },
          {
            "name": "Air Jordan 6",
            "image": "assets/jordan1.png",
            "price": "\$279",
          },
        ];

      case "puma":
        return [
          {
            "name": "Puma Speedcat",
            "image": "assets/puma.png",
            "price": "\$179",
          },
          {
            "name": "Puma Runner",
            "image": "assets/puma1.png",
            "price": "\$150",
          },
          {
            "name": "Puma Sport",
            "image": "assets/puma2.png",
            "price": "\$165",
          },
          {
            "name": "Puma High",
            "image": "assets/puma3.png",
            "price": "\$165",
          },
        ];

      case "reebok":
        return [
          {
            "name": "Reebok OG",
            "image": "assets/reebok.png",
            "price": "\$179",
          },
          {
            "name": "Reebok Classic",
            "image": "assets/reebok1.png",
            "price": "\$160",
          },
          {
            "name": "Reebok Runner",
            "image": "assets/reebok2.png",
            "price": "\$175",
          },
          {
            "name": "Reebok Sport",
            "image": "assets/reebok3.png",
            "price": "\$175",
          },
        ];

      case "new balance":
        return [
          {
            "name": "New Balance 550",
            "image": "assets/nb.png",
            "price": "\$190",
          },
          {
            "name": "New Balance Runner",
            "image": "assets/nb1.png",
            "price": "\$210",
          },
          {
            "name": "New Balance Sport",
            "image": "assets/nb2.png",
            "price": "\$200",
          },
          {
            "name": "New Balance OG",
            "image": "assets/nb3.png",
            "price": "\$200",
          },
        ];

      default:
        return [];
    }
  }

  // =========================================================
  // BUILD
  // =========================================================

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
            // Go directly to Dashboard
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const dashboard(),
              ),
              (route) => false,
            );
          },

          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),

        title: Text(
          "${widget.brand} Shoes",

          style: const TextStyle(
            color: Colors.black,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
      ),

      // =====================================================
      // BODY
      // =====================================================

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),

          child: GridView.builder(
            itemCount: products.length,

            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,

              crossAxisSpacing: 12,
              mainAxisSpacing: 12,

              childAspectRatio: 0.72,
            ),

            itemBuilder: (context, index) {
              final shoe = products[index];

              return productCard(
                name: shoe["name"]!,
                image: shoe["image"]!,
                price: shoe["price"]!,
              );
            },
          ),
        ),
      ),
    );
  }

  // =========================================================
  // PRODUCT CARD
  // =========================================================

  Widget productCard({
    required String name,
    required String image,
    required String price,
  }) {
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

            child: IconButton(
              onPressed: () {
                setState(() {
                  if (FavoritesData.isFavorite(name)) {
                    FavoritesData.removeFavorite(name);
                  } else {
                    FavoritesData.addFavorite({
                      "name": name,
                      "image": image,
                      "price": price,
                    });
                  }
                });
              },

              icon: Icon(
                FavoritesData.isFavorite(name)
                    ? Icons.favorite
                    : Icons.favorite_border,

                color: FavoritesData.isFavorite(name)
                    ? Colors.red
                    : Colors.black,

                size: 24,
              ),

              padding: EdgeInsets.zero,

              constraints: const BoxConstraints(),
            ),
          ),

          // =================================================
          // PRODUCT IMAGE
          // =================================================

          Expanded(
            child: GestureDetector(
              onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => page(
        name: name,
        image: image,
        price: price,
      ),
    ),
  );
},

              child: Center(
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          const SizedBox(height: 5),

          // =================================================
          // PRODUCT NAME
          // =================================================

          Text(
            name,

            maxLines: 1,
            overflow: TextOverflow.ellipsis,

            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          // =================================================
          // PRICE
          // =================================================

          Text(
            price,

            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}