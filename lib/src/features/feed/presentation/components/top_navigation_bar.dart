import 'package:flutter/material.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFF5F5),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(Icons.home, color: Colors.redAccent, size: 35),
          Icon(Icons.directions_run, color: Colors.black54, size: 35),
          Icon(Icons.notifications_none, color: Colors.black54, size: 35),
          Icon(Icons.chat_bubble_outline, color: Colors.black54, size: 35),
          Icon(Icons.menu, color: Colors.black54, size: 35),
        ],
      ),
    );
  }
}
