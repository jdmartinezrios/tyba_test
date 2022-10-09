// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:tyba_test/blocs/university_bloc.dart';
import 'package:tyba_test/blocs/university_event.dart';
import 'package:tyba_test/blocs/university_state.dart';
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
            color: Colors.black26,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: UniversityFilterItem(
              title: 'List',
              icon: Icons.list,
              onPressed: () => _universityBloc.add(
                ChangeLayout(LayoutStyle.ListView),
              ),
            ),
          ),
          Expanded(
            child: UniversityFilterItem(
              title: 'Grid',
              icon: Icons.grid_on,
              onPressed: () => _universityBloc.add(
                ChangeLayout(LayoutStyle.GridView),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
