// Flutter imports:
import 'package:flutter/material.dart';

class UniversityButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const UniversityButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(title),
      onPressed: onPressed,
    );
  }
}
