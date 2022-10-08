// Project imports:
import 'package:tyba_test/presentation/bloc/university_state.dart';

abstract class UniversityEvent {}

class FetchedUniversity extends UniversityEvent {
  final UniversityStatus? from;
  FetchedUniversity({this.from});
}

class ChangeLayout extends UniversityEvent {
  final LayoutStyle layout;
  ChangeLayout(this.layout);
}
