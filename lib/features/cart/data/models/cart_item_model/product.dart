import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final num price;
  final num oldPrice;
  final num discount;
  final String image;
  final String name;
  final String description;
  final List<dynamic>? images;
  final bool inFavorites;
  final bool inCart;

  const Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int,
        price: json['price'] as num,
        oldPrice: json['old_price'] as num,
        discount: json['discount'] as num,
        image: json['image'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        images: json['images'] as List<dynamic>?,
        inFavorites: json['in_favorites'] as bool,
        inCart: json['in_cart'] as bool,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'old_price': oldPrice,
        'discount': discount,
        'image': image,
        'name': name,
        'description': description,
        'images': images,
        'in_favorites': inFavorites,
        'in_cart': inCart,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      price,
      oldPrice,
      discount,
      image,
      name,
      description,
      images,
      inFavorites,
      inCart,
    ];
  }
}
