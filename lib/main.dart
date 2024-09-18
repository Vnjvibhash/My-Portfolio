import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:portfolio/pages/experience_screen.dart';
import 'package:portfolio/pages/home_screen.dart';
import 'package:portfolio/pages/profile_screen.dart';
import 'package:portfolio/pages/projects_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = <Widget>[
    const HomeScreen(),
    const ProjectsScreen(),
    const ExperienceScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color _iconColor(int index) {
    return _selectedIndex == index ? Colors.white : Colors.black54;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.redAccent,
        buttonBackgroundColor: Colors.redAccent,
        height: 60,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: _iconColor(0)),
          Icon(Icons.work, size: 30, color: _iconColor(1)),
          Icon(Icons.school, size: 30, color: _iconColor(2)),
          Icon(Icons.person, size: 30, color: _iconColor(3)),
        ],
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        onTap: _onItemTapped,
        index: _selectedIndex,
      ),
    );
  }
}
