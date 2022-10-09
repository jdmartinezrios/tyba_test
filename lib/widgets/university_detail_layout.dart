// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tyba_test/models/university_model.dart';

class UniversityDetailLayout extends StatelessWidget {
  final UniversityModel university;
  const UniversityDetailLayout({
    Key? key,
    required this.university,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              title: Text(university.name as String),
              subtitle: Wrap(
                direction: Axis.vertical,
                children: [
                  Text(university.country ?? 'No country'),
                  Text(university.stateProvince ?? 'No province'),
                  Text(university.alphaTwoCode ?? 'No code'),
                  ...university.domains.map<Widget>((d) => Text(d)).toList(),
                  ...university.webPages.map<Widget>((d) => Text(d)).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
