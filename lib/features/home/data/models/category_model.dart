import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final int id;
  final String image;
  final String name;

  const CategoryModel(
      {required this.id, required this.image, required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
    );
  }

  @override
  List<Object?> get props => [id, image, name];
}
