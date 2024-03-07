import 'package:allevents/screen/explore_screen.dart';
import 'package:allevents/screen/feed_screen.dart';
import 'package:allevents/screen/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Widget> _pages = [];
  int currentIndex = 0;

  @override
  void initState() {
    _pages = [
      const ExploreScreen(),
      const FeedScreen(),
      const ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
              color: Colors.grey,
            ),
            label: 'Explore',
            activeIcon: Icon(
              Icons.explore,
              color: Colors.blueAccent,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.rss_feed_outlined,
              color: Colors.grey,
            ),
            label: 'Feed',
            activeIcon: Icon(
              Icons.rss_feed_outlined,
              color: Colors.blueAccent,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            label: 'Profile',
            activeIcon: Icon(
              Icons.person,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
