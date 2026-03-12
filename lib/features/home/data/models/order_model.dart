class OrderModel {
  final String headerImage;
  final String profileImage;
  final String category;
  final String title;
  final String description;
  final String atmosphereTitle;
  final List<String> sliderImages;
  final String foodMenuTitle;
  final List<ProductModel> products;

  OrderModel({
    required this.headerImage,
    required this.profileImage,
    required this.category,
    required this.title,
    required this.description,
    required this.atmosphereTitle,
    required this.sliderImages,
    required this.foodMenuTitle,
    required this.products,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      headerImage: json['header_image'] ?? '',
      profileImage: json['profile_image'] ?? '',
      category: json['category'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      atmosphereTitle: json['atmosphere_title'] ?? '',
      sliderImages: List<String>.from(json['slider_images'] ?? []),
      foodMenuTitle: json['food_menu_title'] ?? '',
      products: (json['products'] as List? ?? [])
          .map((e) => ProductModel.fromJson(e))
          .toList(),
    );
  }
}

class ProductModel {
  final String name;
  final String image;
  final String description;
  final String price;
  final String category;
  final String preparationTime;
  final int servingSize;
  final String status;

  ProductModel({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.category,
    required this.preparationTime,
    required this.servingSize,
    required this.status,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      category: json['category'] ?? '',
      preparationTime: json['preparation_time'] ?? '',
      servingSize: json['serving_size'] ?? 1,
      status: json['status'] ?? '',
    );
  }
}
