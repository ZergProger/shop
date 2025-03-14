import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        description,
        category,
        image,
      ];
}
