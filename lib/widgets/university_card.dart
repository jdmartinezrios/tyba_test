// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tyba_test/models/university_model.dart';

class UniversityCard extends StatelessWidget {
  final UniversityModel university;
  final VoidCallback onPressed;
  const UniversityCard({
    Key? key,
    required this.onPressed,
    required this.university,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        child: ListTile(
          title: Text(university.name as String),
          subtitle: Text(university.country as String),
          onTap: onPressed,
        ),
      ),
    );
  }
}
