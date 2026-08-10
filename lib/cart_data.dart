class CartData {
  static final List<Map<String, dynamic>> cartItems = [];

  static void addToCart({
    required String name,
    required String image,
    required String price,
    int quantity = 1,
  }) {
    final existingIndex = cartItems.indexWhere(
      (item) => item["name"] == name,
    );

    if (existingIndex != -1) {
      cartItems[existingIndex]["quantity"] =
          (cartItems[existingIndex]["quantity"] ?? 1) + quantity;
    } else {
      cartItems.add({
        "name": name,
        "image": image,
        "price": price,
        "quantity": quantity,
      });
    }
  }

  static void removeFromCart(String name) {
    cartItems.removeWhere(
      (item) => item["name"] == name,
    );
  }

  static void increaseQuantity(String name) {
    final index = cartItems.indexWhere(
      (item) => item["name"] == name,
    );

    if (index != -1) {
      cartItems[index]["quantity"] =
          (cartItems[index]["quantity"] ?? 1) + 1;
    }
  }

  static void decreaseQuantity(String name) {
    final index = cartItems.indexWhere(
      (item) => item["name"] == name,
    );

    if (index != -1) {
      final quantity = cartItems[index]["quantity"] ?? 1;

      if (quantity > 1) {
        cartItems[index]["quantity"] = quantity - 1;
      } else {
        cartItems.removeAt(index);
      }
    }
  }

  static void clearCart() {
    cartItems.clear();
  }
}