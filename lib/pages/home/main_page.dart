// ignore_for_file: dead_code, unused_import
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndelok/pages/home/explore_page.dart';
import 'package:ndelok/pages/home/home_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  Widget bodyPage() {
    switch (_currentIndex) {
      case 0:
        return HomePage();
        break;
      case 1:
        return ExplorePage();
        break;
      case 2:
        return Container(
          child: Text('profile'),
        );
        break;
      default:
        return Container(
          child: Text('home'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyPage(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Donate'),
        ],
      ),
    );
  }
}
