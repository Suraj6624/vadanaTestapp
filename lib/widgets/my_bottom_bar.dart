import 'package:flutter/material.dart';
import 'package:testapp/screens/note.dart';
import 'package:testapp/screens/student_dashboard.dart';
import 'package:testapp/screens/adca.dart';
import 'package:testapp/screens/payment.dart';

import 'package:testapp/utils/constant.dart';

import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

class MyBottomBar extends StatelessWidget {
  final int currentIndex;

  const MyBottomBar({super.key, required this.currentIndex});

  // Screens list remains the same.+
  static final List<Widget> _screens = [
    StudentDashboard(),
    Adca(),
    Payment(),
    Notes(),
  ];

  void _jumpTo(BuildContext context, int index) {
    if (index == currentIndex) return; // Already on this tab
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _screens[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Define list of icons corresponding to tabs
    const icons = [
      MdiIcons.home,
      Icons.menu_book,
      Icons.currency_rupee,
      Icons.notifications,
    ];

    return Container(
      height: 60, // fixed height similar to BottomNavigationBar
      decoration: BoxDecoration(
        color: PRIME_BLUE, // your preferred background color
        boxShadow: [BoxShadow(color: PRIME_BLACK, blurRadius: 4)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          final isSelected = index == currentIndex;
          return Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _jumpTo(context, index),
              child: Icon(
                icons[index],
                color: isSelected ? PRIME_WHITE : PRIME_BLACK.withOpacity(0.5),
                size: 24,
              ),
            ),
          );
        }),
      ),
    );
  }
}
