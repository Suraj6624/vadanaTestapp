import 'package:flutter/material.dart';
import 'package:testapp/utils/constant.dart';

class Builtrowandelevation extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final Color labelColor;
  final Widget trailing;

  const Builtrowandelevation({
    super.key,
    required this.icon,
    required this.label,
    required this.trailing,
    required this.iconColor,
    this.labelColor = PRIME_BLACK,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: 6),
            Text(label, style: TextStyle(fontSize: 14, color: labelColor)),
          ],
        ),
        trailing,
      ],
    );
  }
}
