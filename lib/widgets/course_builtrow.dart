import 'package:flutter/material.dart';
import 'package:testapp/utils/constant.dart';

class CourseBuiltrow extends StatelessWidget {
  final String label;
  final String value;

  final Color labelColor;
  final Color valueColor;

  const CourseBuiltrow({
    super.key,

    required this.label,
    required this.value,

    this.labelColor = PRIME_BLACK,
    this.valueColor = PRIME_BLACK,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: labelColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(value, style: TextStyle(fontSize: 14, color: valueColor)),
      ],
    );
  }
}
