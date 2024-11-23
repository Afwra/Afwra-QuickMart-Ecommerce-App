class ShippingModel {
  final String? name, city, region, details, notes;
  final num? lat, long;
  final int? id;

  ShippingModel({
    required this.id,
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    required this.notes,
    required this.lat,
    required this.long,
  });

  factory ShippingModel.fromJson(Map<String, dynamic> json) => ShippingModel(
        id: json['id'],
        name: json['name'],
        city: json['city'],
        region: json['region'],
        details: json['details'],
        notes: json['notes'],
        lat: json['latitude'],
        long: json['longitude'],
      );
}
