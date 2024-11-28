import 'package:equatable/equatable.dart';

class Link extends Equatable {
  final dynamic persistentToken;

  const Link({this.persistentToken});

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        persistentToken: json['persistent_token'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'persistent_token': persistentToken,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [persistentToken];
}
