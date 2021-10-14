import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  ActionButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
        ),
        Text(title),
      ],
    );
  }
}
