import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final double size;

  const IconText({
    super.key,
    required this.icon,
    required this.text,
    this.color = Colors.white,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: size),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: size * 0.8, // Adjust font size relative to icon size
          ),
        ),
      ],
    );
  }
}
