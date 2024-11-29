class StripeCustomerModel {
  final String name, email, id;

  StripeCustomerModel(
      {required this.name, required this.email, required this.id});

  factory StripeCustomerModel.fromJson(Map<String, dynamic> json) {
    return StripeCustomerModel(
      name: json['name'],
      email: json['email'],
      id: json['id'],
    );
  }
}
