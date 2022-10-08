// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tyba_test/blocs/university_state.dart';
import 'package:tyba_test/widgets/univerisity_filter.dart';
import 'package:tyba_test/widgets/university_grid_view.dart';
import 'package:tyba_test/widgets/university_list_view.dart';

class UniversityLayout extends StatelessWidget {
  final UniversityState state;
  const UniversityLayout({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UniversityFilter(),
        universityView,
      ],
    );
  }

  Expanded get universityView {
    if (state.layout == LayoutStyle.GridView)
      return Expanded(
        child: UniversityGridView(
          universities: state.universities,
          hasReachedMax: state.hasReachedMax,
        ),
      );
    return Expanded(
        child: UniversityListView(
      universities: state.universities,
      hasReachedMax: state.hasReachedMax,
    ));
  }
}
