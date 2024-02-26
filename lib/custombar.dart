import 'package:flutter/material.dart';

class CustomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: 'Teams',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Players',
        ),
      ],
    );
  }
}
