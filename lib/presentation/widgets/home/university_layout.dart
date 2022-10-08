// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tyba_test/presentation/bloc/university_state.dart';
import 'package:tyba_test/presentation/widgets/filter/univerisity_filter.dart';
import 'package:tyba_test/presentation/widgets/home/university_grid_view.dart';
import 'package:tyba_test/presentation/widgets/home/university_list_view.dart';

// Project imports:

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
