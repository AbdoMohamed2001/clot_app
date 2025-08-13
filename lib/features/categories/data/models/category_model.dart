import 'package:clot_app/features/categories/domain/entities/category_entity.dart';

class CategoryModel {
  final String id;
  final String name;
  final String imageUrl;

  CategoryModel({required this.id, required this.name, required this.imageUrl});

  toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      imageUrl: json['imageUrl'],
      name: json['name'],
    );
  }
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      imageUrl: imageUrl,
    );
  }
}
