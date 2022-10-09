// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tyba_test/blocs/university_state.dart';
import 'package:tyba_test/models/university_model.dart';
import 'package:tyba_test/widgets/univeristy_filter.dart';
import 'package:tyba_test/widgets/university_grid_view.dart';
import 'package:tyba_test/widgets/university_list_view.dart';

class UniversityLayout extends StatelessWidget {
  final LayoutStyle layout;
  final List<UniversityModel> universities;
  const UniversityLayout({
    Key? key,
    required this.layout,
    required this.universities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UniversityFilter(),
        (layout == LayoutStyle.GridView)
            ? Expanded(
                child: UniversityGridView(universities: universities),
              )
            : Expanded(child: UniversityListView(universities: universities)),
      ],
    );
  }
}
