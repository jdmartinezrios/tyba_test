// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tyba_test/models/university_model.dart';
import 'package:tyba_test/pages/university_detail_page.dart';
import 'package:tyba_test/widgets/university_card.dart';

class UniversityGridView extends StatelessWidget {
  final List<UniversityModel> universities;
  const UniversityGridView({
    Key? key,
    required this.universities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        mainAxisExtent: 100,
      ),
      itemCount: universities.length,
      itemBuilder: (context, int index) {
        return UniversityCard(
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
