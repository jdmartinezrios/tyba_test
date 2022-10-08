// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tyba_test/common/index.dart';
import 'package:tyba_test/models/university_model.dart';
import 'package:tyba_test/widgets/university_detail_layout.dart';

class UniversityDetailPage extends StatefulWidget {
  final UniversityModel university;
  const UniversityDetailPage({
    Key? key,
    required this.university,
  }) : super(key: key);

  @override
  State<UniversityDetailPage> createState() => _UniversityDetailPageState();
}

class _UniversityDetailPageState extends State<UniversityDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(UniversityConstants.DETAIL_TITLE),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: UniversityDetailLayout(
        university: widget.university,
      ),
    );
  }
}
