import '../../domain/entities/product_entity.dart';

class ProductModel {
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

  ProductModel({
    required this.category,
    required this.productId,
    required this.gender,
    required this.name,
    required this.rate,
    required this.salesCount,
    required this.discountedPrice,
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
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(
      category: json['category'],
      productId: json['productId'],
      gender: json['gender'],
      name: json['name'],
      rate: json['rate'],
      salesCount: json['salesCount'],
      price: json['price'],
      discount: json['discount'],
      discountedPrice: json['discountedPrice'],
      ratings: json['ratings'],
      colors: json['colors'],
      sizes: json['sizes'],
      images: json['images'],
      description: json['description'],
      inStock: json['inStock'],
      inSale: json['inSale'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
  toJson() {
    return {
      'category': category,
      'productId': productId,
      'gender': gender,
      'name': name,
      'rate': rate,
      'salesCount': salesCount,
      'price': price,
      'discount': discount,
      'discountedPrice': discountedPrice,
      'ratings': ratings,
      'colors': colors,
      'sizes': sizes,
      'images': images,
      'description': description,
      'inStock': inStock,
      'inSale': inSale,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      category: entity.category,
      productId: entity.productId,
      gender: entity.gender,
      name: entity.name,
      rate: entity.rate,
      salesCount: entity.salesCount,
      price: entity.price,
      discount: entity.discount,
      ratings: entity.ratings,
      colors: entity.colors,
      sizes: entity.sizes,
      images: entity.images,
      description: entity.description,
      inStock: entity.inStock,
      inSale: entity.inSale,
      createdAt: entity.createdAt,
      discountedPrice: entity.discountedPrice,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      category: category,
      productId: productId,
      gender: gender,
      name: name,
      price: price,
      discount: discount,
      ratings: ratings,
      colors: colors,
      sizes: sizes,
      images: images,
      description: description,
      inStock: inStock,
      inSale: inSale,
      createdAt: createdAt,
      salesCount: salesCount,
      rate: rate,
    );
  }
}
