import 'package:equatable/equatable.dart';

import 'product.dart';

class CartItem extends Equatable {
  final int id;
  final int quantity;
  final Product product;

  const CartItem(
      {required this.id, required this.quantity, required this.product});

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json['id'] as int,
        quantity: json['quantity'] as int,
        product: Product.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
        'product': product.toJson(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, quantity, product];
}
