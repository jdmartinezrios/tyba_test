// Project imports:
import 'package:tyba_test/blocs/university_state.dart';

abstract class UniversityEvent {}

class FetchedUniversity extends UniversityEvent {}

class ChangeLayout extends UniversityEvent {
  final LayoutStyle layout;
  ChangeLayout(this.layout);
}
