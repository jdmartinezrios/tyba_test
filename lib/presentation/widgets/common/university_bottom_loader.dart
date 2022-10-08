// Flutter imports:
import 'package:flutter/material.dart';

class UniversityBottomLoader extends StatelessWidget {
  const UniversityBottomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _size = 24;
    return Center(
      child: SizedBox(
        height: _size,
        width: _size,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
