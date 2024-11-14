import 'package:equatable/equatable.dart';

import 'cart_item.dart';

class CartItemModel extends Equatable {
  final List<CartItem> cartItems;
  final num subTotal;
  final num total;

  const CartItemModel(
      {required this.cartItems, required this.subTotal, required this.total});

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        cartItems: (json['cart_items'] as List<dynamic>)
            .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        subTotal: json['sub_total'] as num,
        total: json['total'] as num,
      );

  Map<String, dynamic> toJson() => {
        'cart_items': cartItems.map((e) => e.toJson()).toList(),
        'sub_total': subTotal,
        'total': total,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [cartItems, subTotal, total];
}
