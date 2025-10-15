import 'package:flutter/material.dart';
import '../widgets/form_fields.dart';
import '../widgets/category_radio_group.dart';
import '../widgets/result_dialog.dart';
import '../models/product_data.dart';

class ProductFormScreen extends StatefulWidget {
  const ProductFormScreen({super.key});

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _serialController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _selectedCategory;

  @override
  void dispose() {
    _nameController.dispose();
    _serialController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a product name';
    }
    return null;
  }

  String? _validateSerial(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a serial number';
    }
    return null;
  }

  String? _validatePrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a price';
    }

    final price = double.tryParse(value.trim());
    if (price == null) {
      return 'Please enter a valid number';
    }

    if (price <= 0) {
      return 'Price must be greater than 0';
    }

    return null;
  }

  bool _validateForm() {
    if (!_formKey.currentState!.validate()) {
      return false;
    }

    if (_selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a category'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    return true;
  }

  void _submitForm() {
    if (_validateForm()) {
      final productData = ProductData.fromControllers(
        nameController: _nameController,
        serialController: _serialController,
        priceController: _priceController,
        category: _selectedCategory!,
      );

      showDialog(
        context: context,
        builder: (context) => ResultDialog(
          title: 'Product Registered Successfully!',
          data: productData.toMap(),
          onClose: () {
            Navigator.of(context).pop();
            _clearForm();
          },
        ),
      );
    }
  }

  void _clearForm() {
    _formKey.currentState!.reset();
    setState(() {
      _selectedCategory = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Registration',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white), // Changed font size and weight
        ),
        backgroundColor: Colors.deepPurple, // Changed from green to deep purple
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextFormField(
                  controller: _nameController,
                  labelText: 'Product Name',
                  hintText: 'Enter product name',
                  validator: _validateName,
                ),
                const SizedBox(height: 16),

                CustomTextFormField(
                  controller: _serialController,
                  labelText: 'Serial Number',
                  hintText: 'Enter serial number',
                  validator: _validateSerial,
                ),
                const SizedBox(height: 16),

                CustomTextFormField(
                  controller: _priceController,
                  labelText: 'Price',
                  hintText: 'Enter price (e.g., 99.99)',
                  keyboardType: TextInputType.number,
                  validator: _validatePrice,
                ),
                const SizedBox(height: 16),

                CategoryRadioGroup(
                  onCategoryChanged: (category) {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  initialCategory: _selectedCategory,
                ),
                const SizedBox(height: 32),

                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange, // Changed from blue to deep orange
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Increased font size and added bold
                  ),
                  child: const Text('Register Product'),
                ),
                const SizedBox(height: 16),

                OutlinedButton(
                  onPressed: _clearForm,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(fontSize: 18), // Increased font size for the clear button
                  ),
                  child: const Text('Clear Form'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
