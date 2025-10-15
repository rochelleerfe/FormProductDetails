import 'package:flutter/material.dart';

/// Data model for user registration form
class UserData {
  final String name;
  final String email;
  final String phone;

  UserData({
    required this.name,
    required this.email,
    required this.phone,
  });

  /// Converts UserData to a Map for easy display
  Map<String, dynamic> toMap() {
    return {
      'Full Name': name,
      'Email': email,
      'Phone Number': phone,
    };
  }

  /// Creates UserData from form controllers
  factory UserData.fromControllers({
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController phoneController,
  }) {
    return UserData(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
    );
  }
}