import 'package:flutter/material.dart';
import 'package:testapp/utils/constant.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: PRIME_ORANGE, width: 2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: PRIMAY_BLACK),
          hintText: 'Search here',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
