import 'package:flutter/material.dart';

class BuiltRow extends StatelessWidget {
  final String label;
  final String value;

  final Color labelColor;
  final Color valueColor;
  final IconData? icon; // ✅ Add icon
  final Color? iconColor;

  const BuiltRow({
    super.key,
    this.icon,
    this.iconColor,
    required this.label,
    required this.value,

    this.labelColor = Colors.white,
    this.valueColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: iconColor, // Fallback to grey if null
              size: 20,
            ),
            const SizedBox(width: 6),
            Text(label, style: TextStyle(fontSize: 14, color: labelColor)),
          ],
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: valueColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
