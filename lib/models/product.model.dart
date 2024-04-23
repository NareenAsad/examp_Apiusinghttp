class Product {
  List<ProductElement> products;
  int total;
  int skip;
  int limit;

  Product({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      products: List<ProductElement>.from(
          json["products"].map((x) => ProductElement.fromJson(x))),
      total: json["total"],
      skip: json["skip"],
      limit: json["limit"],
    );
  }
}

class ProductElement {
  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  ProductElement({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory ProductElement.fromJson(Map<String, dynamic> json) {
    return ProductElement(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      price: json["price"],
      discountPercentage: json["discountPercentage"]?.toDouble() ?? 0,
      rating: json["rating"]?.toDouble() ?? 0,
      stock: json["stock"],
      brand: json["brand"],
      category: json["category"],
      thumbnail: json["thumbnail"],
      images: List<String>.from(json["images"].map((x) => x)),
    );
  }
}
