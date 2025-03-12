import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rate,
    required this.rateCount,
  });

  final String id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rate;
  final int rateCount;

  @override
  List<Object?> get props =>
      [id, title, price, description, category, image, rate, rateCount];
}
