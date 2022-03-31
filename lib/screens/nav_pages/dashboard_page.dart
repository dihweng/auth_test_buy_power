import 'package:auth_test/screens/nav_pages/bar_item_page.dart';
import 'package:auth_test/screens/home_page.dart';
import 'package:auth_test/screens/nav_pages/profile_page.dart';
import 'package:auth_test/screens/nav_pages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  List pages = [
    HomePage(),
    SearchPage(),
    BarPage(),
    ProfilePage(),
  ];

  int currentIndex = 0;

  void onTap (int index){
    setState((){
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // backgroundColor: Colors.white,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            label: "HomePage",
            icon: Icon(Icons.apps)),
          BottomNavigationBarItem(
            label: "SearchPage",
            icon: Icon(Icons.search)),
          BottomNavigationBarItem(
            label: "BarPage",
            icon: Icon(Icons.stacked_bar_chart_sharp)),
          BottomNavigationBarItem(
            label: "ProfilePage",
            icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}