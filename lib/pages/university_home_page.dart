// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:tyba_test/blocs/university_bloc.dart';
import 'package:tyba_test/blocs/university_event.dart';
import 'package:tyba_test/blocs/university_state.dart';
import 'package:tyba_test/widgets/university_error.dart';
import 'package:tyba_test/widgets/university_layout.dart';

class UniversityHomePage extends StatefulWidget {
  const UniversityHomePage({Key? key}) : super(key: key);

  @override
  State<UniversityHomePage> createState() => _UniversityHomePageState();
}

class _UniversityHomePageState extends State<UniversityHomePage> {
  late UniversityBloc _universityBloc;

  @override
  void initState() {
    super.initState();
    _universityBloc = BlocProvider.of<UniversityBloc>(context);
    _universityBloc.add(FetchedUniversity());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Universities'),
      ),
      body: BlocBuilder<UniversityBloc, UniversityState>(
        builder: (context, state) {
          if (state.status == UniversityStatus.intial)
            return Center(
              child: CircularProgressIndicator(),
            );
          if (state.status == UniversityStatus.failure)
            return Center(
              child: UniversityError(),
            );
          return UniversityLayout(
            layout: state.layout,
            universities: state.universities,
          );
        },
      ),
    );
  }
}
