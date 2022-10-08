// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:tyba_test/blocs/university_bloc.dart';
import 'package:tyba_test/blocs/university_event.dart';
import 'package:tyba_test/blocs/university_state.dart';
import 'package:tyba_test/common/index.dart';
import 'package:tyba_test/widgets/university_filter_item.dart';

class UniversityFilter extends StatelessWidget {
  const UniversityFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _universityBloc = BlocProvider.of<UniversityBloc>(context);
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black26,
          ),
        ),
      ),
      child: Row(
        children: [
          ...<Map<String, LayoutStyle>>[
            {UniversityConstants.LIST_VIEW: LayoutStyle.ListView},
            {UniversityConstants.GRID_VIEW: LayoutStyle.GridView},
          ].map((filter) {
            final _filterName = filter.keys.first;
            final _filterValue = filter.values.first;
            final _iconCondition = _filterName == UniversityConstants.LIST_VIEW;
            final _filterIcon = _iconCondition ? Icons.list : Icons.grid_on;
            return Expanded(
              child: UniversityFilterItem(
                title: _filterName,
                icon: _filterIcon,
                onPressed: () => _universityBloc.add(
                  ChangeLayout(_filterValue),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
