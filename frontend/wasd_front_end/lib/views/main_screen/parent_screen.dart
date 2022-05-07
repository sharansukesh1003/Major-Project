import 'package:flutter/material.dart';
import 'package:wasd_front_end/constants/constants.dart';
import 'package:wasd_front_end/views/home_view/homeview.dart';
import 'package:wasd_front_end/views/news_view/news.dart';
import 'package:wasd_front_end/views/profile_view/profile_view.dart';
import 'package:wasd_front_end/views/search_view/search_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 1;

  var options = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.search,
          size: 30,
      ),
      label: 'Search'),
  const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
          size: 30,
      ),
      label: 'Home'),
  const BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
          size: 30,
      ),
      label: 'Proflie'),
  const BottomNavigationBarItem(
      icon: Icon(
        Icons.article_outlined,
          size: 30,
      ),
      label: 'News'),
  ];

  List<Widget> tabPages = [
    const SearchView(),
    HomeView(),
    const ProfileView(),
    const NewsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ConstantColors.primaryColor,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          unselectedItemColor: Colors.grey[700],
          fixedColor: Colors.white,
          currentIndex: _pageIndex,
          onTap: onPageChanged,
          backgroundColor: ConstantColors.primaryColor,
          items: options,
        ),
        body: tabPages.elementAt(_pageIndex),
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      _pageIndex = page;
    });
  }
}