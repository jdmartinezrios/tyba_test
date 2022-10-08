// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tyba_test/common/index.dart';
import 'package:tyba_test/models/university_model.dart';
import 'package:tyba_test/widgets/university_button.dart';
import 'package:tyba_test/widgets/university_form_control.dart';

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
        Form(
          child: Row(children: [
            Expanded(
              flex: 2,
              child: UniversityFormControl(
                placeholder: UniversityConstants.INPUT,
              ),
            ),
            Expanded(
              flex: 1,
              child: UniversityButton(
                onPressed: () {
                  // TODO: implement functionallity to upload images from gallery
                },
                title: UniversityConstants.UPLOAD,
              ),
            )
          ]),
        ),
      ]),
    ));
  }
}
