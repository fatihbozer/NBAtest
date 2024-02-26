import 'package:flutter/material.dart';
import 'package:nba_api/custombar.dart';
import 'package:nba_api/playerpage.dart';
import 'package:nba_api/teampage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Screens für die Bottom Navigation Bar
  final List<Widget> _screens = [
    TeamPage(),
    PlayerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
