// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:tyba_test/config/index.dart';
import 'package:tyba_test/presentation/bloc/university_bloc.dart';
import 'package:tyba_test/presentation/pages/university_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: UniversityConstants.APP_TITLE,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => UniversityBloc(),
        child: UniversityHomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
