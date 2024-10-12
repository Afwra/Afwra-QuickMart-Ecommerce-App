class BannerModel {
  final String image;

  BannerModel({required this.image});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      image: json['image'],
    );
  }
}
