// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:tyba_test/presentation/bloc/university_bloc.dart';
import 'package:tyba_test/presentation/bloc/university_event.dart';

// Project imports:

class UniversityScrollLayout extends StatefulWidget {
  final BoxScrollView child;
  const UniversityScrollLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  factory UniversityScrollLayout.listView({
    required ListView child,
  }) =>
      UniversityScrollLayout(child: child);

  factory UniversityScrollLayout.gridView({
    required GridView child,
  }) =>
      UniversityScrollLayout(child: child);

  @override
  State<UniversityScrollLayout> createState() => _UniversityScrollLayoutState();
}

class _UniversityScrollLayoutState extends State<UniversityScrollLayout> {
  @override
  void initState() {
    super.initState();
    widget.child.controller!.addListener(_onScroll);
  }

  void _onScroll() {
    if (isBottom) {
      context.read<UniversityBloc>().add(FetchedUniversity());
    }
  }

  bool get isBottom {
    if (!widget.child.controller!.hasClients) return false;
    final _maxScroll = widget.child.controller!.position.maxScrollExtent;
    final _currentScroll = widget.child.controller!.position.pixels;
    return _currentScroll == _maxScroll;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    widget.child.controller!
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}
