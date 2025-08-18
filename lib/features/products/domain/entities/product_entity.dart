class ProductEntity {
  final String category;
  final String productId;
  final String gender;
  final Map<String, dynamic> name;
  final Map<String, dynamic> description;
  final num rate;
  final num salesCount;
  final num price;
  final num discount;
  final num discountedPrice;
  final List ratings;
  final List colors;
  final List sizes;
  final List images;
  final bool inStock;
  final bool inSale;
  final DateTime createdAt;

  ProductEntity({
    required this.category,
    required this.productId,
    required this.gender,
    required this.name,
    this.rate = 0,
    this.salesCount = 0,
    required this.price,
    required this.discount,
    required this.ratings,
    required this.colors,
    required this.sizes,
    required this.images,
    required this.description,
    required this.inStock,
    required this.inSale,
    required this.createdAt,
  }) : discountedPrice = price - (price * discount / 100);
}
