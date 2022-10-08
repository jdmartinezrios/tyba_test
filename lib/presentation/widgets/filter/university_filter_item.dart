// Flutter imports:
import 'package:flutter/material.dart';

class UniversityFilterItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  const UniversityFilterItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(title),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
