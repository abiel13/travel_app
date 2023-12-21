import 'package:flutter/material.dart';
import 'package:travel_app/pages/nav_pages/bar_itempage.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/pages/nav_pages/my_page.dart';
import 'package:travel_app/pages/nav_pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;
  List pages = [
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const MyPage(),
  ];

  void onpageChange(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
    
      bottomNavigationBar: BottomNavigationBar( 
          onTap: onpageChange,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          currentIndex: _index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined),
              label: 'Bar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Me',
            ),
          ]),
    );
  }
}
