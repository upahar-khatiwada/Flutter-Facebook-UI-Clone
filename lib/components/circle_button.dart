import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;

  const CircleButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6.0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon),
        iconSize: 30.0,
        color: Colors.white,
      ),
    );
  }
}
