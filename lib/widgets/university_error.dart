// Flutter imports:
import 'package:flutter/material.dart';

class UniversityError extends StatelessWidget {
  const UniversityError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Error fetching data from server!'),
    );
  }
}
