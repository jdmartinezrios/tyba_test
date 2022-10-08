// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tyba_test/config/constants/university_constants.dart';
import 'package:tyba_test/presentation/widgets/common/university_button.dart';
import 'package:tyba_test/presentation/widgets/detail/university_form_control.dart';

class UniversityForm extends StatelessWidget {
  const UniversityForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
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
    );
  }
}
