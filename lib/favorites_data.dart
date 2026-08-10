class FavoritesData {
  static List<Map<String, dynamic>> favorites = [];

  static void addFavorite(Map<String, dynamic> product) {
    final alreadyExists = favorites.any(
      (item) => item["name"] == product["name"],
    );

    if (!alreadyExists) {
      favorites.add(product);
    }
  }

  static void removeFavorite(String name) {
    favorites.removeWhere(
      (item) => item["name"] == name,
    );
  }

  static bool isFavorite(String name) {
    return favorites.any(
      (item) => item["name"] == name,
    );
  }
}