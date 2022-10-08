// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tyba_test/common/index.dart';
import 'package:tyba_test/widgets/university_button.dart';

class UniversityError extends StatelessWidget {
  final VoidCallback onPressed;
  const UniversityError({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(UniversityConstants.ERROR_FETCHING),
        UniversityButton(
          onPressed: onPressed,
          title: UniversityConstants.TRY_AGAIN,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}
