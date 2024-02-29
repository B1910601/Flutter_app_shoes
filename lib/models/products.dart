import 'package:flutter/material.dart';

class Product {
  final String? id;
  final String title;
  final String description;
  final double price;
  final String image;

  final ValueNotifier<bool> _isFavorite;

  Product({
    this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    isFavorite = false,
  }) : _isFavorite = ValueNotifier(
            isFavorite); // Lớp ValueNotifier được sử dụng để giám sát giá trị của thuộc tính isFavorite và thông báo cho các thành phần khác trong ứng dụng về bất kỳ thay đổi nào của nó.
  set isFavorite(bool newValue) {
    _isFavorite.value = newValue;
  }

  bool get isFavorite {
    return _isFavorite.value;
  }

  ValueNotifier<bool> get isFavoriteListenable {
    return _isFavorite;
  }

  Product copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
