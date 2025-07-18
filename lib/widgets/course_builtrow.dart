import 'package:flutter/material.dart';

class CourseBuiltrow extends StatelessWidget {
  final String label;
  final String value;

  final Color labelColor;
  final Color valueColor;

  const CourseBuiltrow({
    super.key,

    required this.label,
    required this.value,

    this.labelColor = Colors.black,
    this.valueColor = Colors.black,
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
