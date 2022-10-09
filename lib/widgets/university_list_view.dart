// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tyba_test/models/university_model.dart';
import 'package:tyba_test/pages/university_detail_page.dart';
import 'package:tyba_test/widgets/university_tile.dart';

class UniversityListView extends StatelessWidget {
  final List<UniversityModel> universities;
  const UniversityListView({
    Key? key,
    required this.universities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: universities.length,
      itemBuilder: (context, int index) {
        return UniversityTile(
          university: universities[index],
          onPressed: () =>
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return UniversityDetailPage(university: universities[index]);
          })),
        );
      },
    );
  }
}
