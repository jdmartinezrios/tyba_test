// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tyba_test/models/university_model.dart';

class UniversityTile extends StatelessWidget {
  final UniversityModel university;
  final VoidCallback onPressed;
  const UniversityTile({
    Key? key,
    required this.onPressed,
    required this.university,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(university.name as String),
      subtitle: Text(university.country as String),
      leading: Text(university.alphaTwoCode as String),
      trailing: Icon(Icons.chevron_right),
      onTap: onPressed,
    );
  }
}
