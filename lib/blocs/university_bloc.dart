// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:tyba_test/blocs/university_event.dart';
import 'package:tyba_test/blocs/university_state.dart';
import 'package:tyba_test/repository/university_repository.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  UniversityBloc() : super(const UniversityState()) {
    on<ChangeLayout>(_onChangeLayout);
    on<FetchedUniversity>(_onUniversityLoaded);
  }

  int _universityLimit = 20;
  final _universityRepository = new UniversityRepository(http.Client());

  FutureOr<void> _onUniversityLoaded(
    FetchedUniversity event,
    Emitter<UniversityState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == UniversityStatus.intial) {
        final _universities =
            await _universityRepository.getUniversities(_universityLimit);
        if (_universities.isEmpty)
          emit(UniversityState(hasReachedMax: true));
        else
          emit(state.copyWith(
            status: UniversityStatus.success,
            universities: List.of(state.universities)..addAll(_universities),
            hasReachedMax: false,
          ));
      }
    } catch (e) {
      emit(UniversityState(status: UniversityStatus.failure));
    }
  }

  void _onChangeLayout(
    ChangeLayout event,
    Emitter<UniversityState> emit,
  ) {
    emit(state.copyWith(layout: event.layout));
  }
}
