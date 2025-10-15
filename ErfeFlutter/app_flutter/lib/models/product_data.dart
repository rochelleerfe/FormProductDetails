// models/product_data.dart
import 'package:flutter/material.dart';

/// Data model for product registration form
class ProductData {
  final String name;
  final String serial;
  final double price;
  final String category;

  ProductData({
    required this.name,
    required this.serial,
    required this.price,
    required this.category,
  });

  /// Converts ProductData to a Map for easy display
  Map<String, dynamic> toMap() {
    return {
      'Product Name': name,
      'Serial Number': serial,
      'Price': '\$${price.toStringAsFixed(2)}',
      'Category': category,
    };
  }

  /// Creates ProductData from form controllers
  factory ProductData.fromControllers({
    required TextEditingController nameController,
    required TextEditingController serialController,
    required TextEditingController priceController,
    required String category,
  }) {
    return ProductData(
      name: nameController.text.trim(),
      serial: serialController.text.trim(),
      price: double.parse(priceController.text.trim()),
      category: category,
    );
  }
}