import 'package:binarytask/const/strings.dart';
import 'package:binarytask/tabs/movies.dart';
import 'package:binarytask/tabs/music.dart';
import 'package:binarytask/tabs/shows.dart';
import 'package:flutter/material.dart';

class Hom extends StatelessWidget {
  const Hom({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person),
            ),
          ),
          actions: const [
            SizedBox(
              width: 130.0,
              child: TextField(
                decoration: InputDecoration(
                    isDense: true,
                    hintText: hintText,
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)))),
              ),
            )
          ],
          title: const Text('Chelsie Brett'),
          bottom: const PreferredSize(
              child: TabBar(
                  indicator: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  tabs: [
                    Tab(
                      text: tabNameOne,
                    ),
                    Tab(
                      text: tabNameTwo,
                    ),
                    Tab(
                      text: tabNameThree,
                    ),
                  ]),
              preferredSize: Size(double.infinity, 100.0))),
      body: const TabBarView(children: [
        MoviesTab(),
        ShowsTab(),
        MusicTab(),
      ]),
    );
  }
}
