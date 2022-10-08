// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tyba_test/config/index.dart';
import 'package:tyba_test/domain/entities/university_entity.dart';
import 'package:tyba_test/presentation/widgets/detail/university_form.dart';

class UniversityDetailLayout extends StatelessWidget {
  final University university;
  const UniversityDetailLayout({
    Key? key,
    required this.university,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          title: Text(university.name as String),
          subtitle: Wrap(
            direction: Axis.vertical,
            children: [
              Text(university.country ?? UniversityConstants.NO_COUNTRY),
              Text(university.stateProvince ?? UniversityConstants.NO_PROVINCE),
              Text(university.alphaTwoCode ?? UniversityConstants.NO_CODE),
              ...university.webPages.map<Widget>((web) => Text(web)).toList(),
              ...university.domains.map<Widget>((dom) => Text(dom)).toList(),
            ],
          ),
        ),
        UniversityForm(),
      ]),
    ));
  }
}
