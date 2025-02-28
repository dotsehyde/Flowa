import 'package:flowa/core/controller/app.controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavPage extends StatelessWidget {
  final StatefulNavigationShell child;
  const BottomNavPage({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child, // Render the current screen
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex: child.currentIndex,
        enableFeedback: true,
        onTap: (index) {
          if (index == child.currentIndex) {
            context.go(AppController.to.changeBottomNav(index));
          } else {
            child.goBranch(index);
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
