import 'package:flutter/material.dart';

class CircularAvatar extends StatelessWidget {
  final String backgroundImage;

  const CircularAvatar({super.key, required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(backgroundImage),
        ),
      ),
    );
  }
}
