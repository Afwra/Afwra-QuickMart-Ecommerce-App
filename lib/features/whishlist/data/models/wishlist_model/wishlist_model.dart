import 'package:equatable/equatable.dart';

import 'product.dart';

class WishlistModel extends Equatable {
  final int id;
  final Product product;

  const WishlistModel({required this.id, required this.product});

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
        id: json['id'] as int,
        product: Product.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product.toJson(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, product];
}
