import 'package:flutter/material.dart';

class CategoryRadioGroup extends StatefulWidget {
  final ValueChanged<String> onCategoryChanged;
  final String? initialCategory;

  const CategoryRadioGroup({
    Key? key,
    required this.onCategoryChanged,
    this.initialCategory,
  }) : super(key: key);

  @override
  State<CategoryRadioGroup> createState() => _CategoryRadioGroupState();
}

class _CategoryRadioGroupState extends State<CategoryRadioGroup> {
  String? _selectedCategory;

  final List<String> categories = [
    'Electronics',
    'Furniture',
    'Clothing',
  ];

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.initialCategory;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Category *',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ...categories.map((category) {
          return RadioListTile<String>(
            title: Text(category),
            value: category,
            groupValue: _selectedCategory,
            onChanged: (String? value) {
              setState(() {
                _selectedCategory = value;
              });
              widget.onCategoryChanged(value ?? '');
            },
            contentPadding: EdgeInsets.zero,
            dense: true,
          );
        }),
        if (_selectedCategory == null)
          const Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Text(
              'Please select a category',
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}