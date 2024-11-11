class FavoritesModel {
  final int id;
  final num price;
  final num oldPrice;
  final num discount;
  final String image;

  FavoritesModel(
      {required this.id,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.image});

  factory FavoritesModel.fromJson(Map<String, dynamic> json) {
    return FavoritesModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
    );
  }
}
