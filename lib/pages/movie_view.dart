import 'package:flutter/material.dart';

class MovieView extends StatelessWidget {
  final String? movieName;
  const MovieView({Key? key, this.movieName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(movieName!),
      ),
    );
  }
}
