import 'package:equatable/equatable.dart';

import 'rating.dart';

class ProductsModel extends Equatable {
  final int? id;
  final String title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  const ProductsModel({
    this.id,
    required this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json['id'] as int?,
        title: json['title'] as String,
        price: (json['price'] as num?)?.toDouble(),
        description: json['description'] as String?,
        category: json['category'] as String?,
        image: json['image'] as String?,
        rating: json['rating'] == null
            ? null
            : Rating.fromJson(json['rating'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'rating': rating?.toJson(),
      };

  ProductsModel copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) {
    return ProductsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      title,
      price,
      description,
      category,
      image,
      rating,
    ];
  }
}
