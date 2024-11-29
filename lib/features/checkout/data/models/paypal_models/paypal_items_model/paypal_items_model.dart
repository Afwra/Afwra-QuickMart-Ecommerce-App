import 'item.dart';

class PaypalItemsModel {
  List<Item>? items;

  PaypalItemsModel({this.items});

  factory PaypalItemsModel.fromJson(Map<String, dynamic> json) {
    return PaypalItemsModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
