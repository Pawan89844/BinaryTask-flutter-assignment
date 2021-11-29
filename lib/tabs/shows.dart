// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:binarytask/const/strings.dart';
import 'package:binarytask/model/new_movies.dart';
import 'package:binarytask/pages/movie_view.dart';
import 'package:binarytask/widget/category.dart';
import 'package:binarytask/widget/moviecard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class ShowsTab extends StatelessWidget {
  const ShowsTab({Key? key}) : super(key: key);

  Future _getData() async {
    final jsonString = await http.get(Uri.parse(apiUrl));
    final decode = jsonDecode(jsonString.body);
    List listData = decode['Search'];
    print(listData.length);
    return listData.map((e) => NewMovies.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Category(categoryName: newcategory),
          const SizedBox(height: 10.0),
          FutureBuilder(
              future: _getData(),
              builder: (ctx, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox(
                    height: 250.0,
                    child: ListView.builder(
                        padding: const EdgeInsets.only(left: 20.0),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (ctx, i) {
                          var data = snapshot.data[i];
                          return MoviesCard(
                            movies: data.poster,
                            category: newcategory,
                            chipPadding: 50.0,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      MovieView(movieName: data.title)));
                            },
                          );
                        }),
                  );
                }
              }),
          // Popular
          const Category(categoryName: popularcategory),
          const SizedBox(height: 10.0),
          FutureBuilder(
              future: _getData(),
              builder: (ctx, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox(
                    height: 250.0,
                    child: ListView.builder(
                        padding: const EdgeInsets.only(left: 20.0),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (ctx, i) {
                          var data = snapshot.data[i];
                          return MoviesCard(
                            movies: data.poster,
                            category: popularcategory,
                            chipPadding: 40.0,
                            onTap: () {
                              print('onTap');
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      MovieView(movieName: data.title)));
                            },
                          );
                        }),
                  );
                }
              }),
        ],
      ),
    );
  }
}
