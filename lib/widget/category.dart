import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final dynamic categoryName;
  const Category({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, left: 25.0),
      alignment: Alignment.centerLeft,
      child: Text(
        categoryName,
        style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}