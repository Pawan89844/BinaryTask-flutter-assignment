import 'package:flutter/material.dart';

class MoviesCard extends StatelessWidget {
  final String movies;
  final String category;
  final double chipPadding;
  final void Function()? onTap;
  const MoviesCard({
    Key? key,
    required this.movies,
    required this.category,
    required this.chipPadding,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          // ignore: deprecated_member_use
          overflow: Overflow.visible,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                child: Container(
                  height: 220.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(movies))),
                  child: null,
                ),
              ),
            ),
            Positioned(
              top: 196.0,
              left: chipPadding,
              child: Chip(
                  backgroundColor: Colors.green,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(5.0, 5.0))),
                  label: Text(category)),
            )
          ],
        ),
      ],
    );
  }
}
