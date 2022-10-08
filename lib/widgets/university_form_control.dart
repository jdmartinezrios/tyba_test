// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tyba_test/common/index.dart';

class UniversityFormControl extends StatelessWidget {
  final String placeholder;
  final TextEditingController? controller;
  const UniversityFormControl({
    Key? key,
    this.controller,
    required this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) {},
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: placeholder,
      ),
      validator: (value) {
        if (value!.isEmpty) return UniversityConstants.FIELD_REQUIRED;
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
