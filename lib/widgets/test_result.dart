import 'package:flutter/material.dart';
import 'package:testapp/screens/result.dart';

class TestBuiltrow extends StatelessWidget {
  final String label;
  final String value;

  final Color labelColor;
  final Color valueColor;

  const TestBuiltrow({
    super.key,

    required this.label,
    required this.value,

    this.labelColor = Colors.black,
    this.valueColor = Colors.white,
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
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Result()),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              value,
              style: TextStyle(fontSize: 14, color: valueColor),
            ),
          ),
        ),
      ],
    );
  }
}
