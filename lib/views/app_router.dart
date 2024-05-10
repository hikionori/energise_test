import 'package:energise_test/views/home/home_screen.dart';
import 'package:energise_test/views/ip_info/ip_info_screen.dart';
import 'package:energise_test/views/third/third_screen.dart';
import 'package:flutter/material.dart';

class AppRouter extends StatefulWidget {
  const AppRouter({super.key});

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  int _currentIndex = 0;

  final tabs = [const HomeScreen(), const IpInfoScreen(), const ThirdScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'IP Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.three_k),
            label: 'Third',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
