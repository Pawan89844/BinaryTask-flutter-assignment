import 'package:binarytask/pages/bookmark.dart';
import 'package:binarytask/pages/fav.dart';
import 'package:binarytask/pages/hom.dart';
import 'package:binarytask/pages/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late List<Map<String, Object>> _pages;
  int i = 0;

  // void _openDrawer() {
  //   _scaffoldKey.currentState!.openDrawer();
  // }

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': const Hom()},
      {'page': const Fav()},
      {'page': const BookMark()},
      {'page': const Menu()}
    ];
  }

  void _selectedIndex(int index) {
    index == 4
        ? _scaffoldKey.currentState!.openDrawer()
        : setState(() {
            i = index;
          });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const Menu(),
        body: _pages[i]['page'] as Widget?,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: i,
            onTap: _selectedIndex,
            backgroundColor: Colors.grey.shade900.withOpacity(0.5),
            selectedItemColor: Colors.pink,
            unselectedItemColor: Colors.grey,
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.house_fill), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.star_fill), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.bookmark_fill), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.bars), label: ''),
            ]),
      ),
    );
  }
}
