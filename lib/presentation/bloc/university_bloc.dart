// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:tyba_test/data/repositories/university_repository_impl.dart';
import 'package:tyba_test/domain/usecases/get_universities.dart';
import 'package:tyba_test/presentation/bloc/university_event.dart';
import 'package:tyba_test/presentation/bloc/university_state.dart';

const int LIMIT_SIZE = 20;

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  UniversityBloc() : super(const UniversityState()) {
    on<ChangeLayout>(_onChangeLayout);
    on<FetchedUniversity>(_onUniversityLoaded);
  }

  int _universityLimit = LIMIT_SIZE;

  final _getUniversities = new GetUniversities(
    new UniversityRepositoryImpl(http.Client()),
  );

  FutureOr<void> _onUniversityLoaded(
    FetchedUniversity event,
    Emitter<UniversityState> emit,
  ) async {
    emit(state.copyWith(status: event.from ?? state.status));
    if (state.hasReachedMax) return;
    try {
      if (state.status == UniversityStatus.initial) {
        final _universities =
            await _getUniversities.execute(limit: _universityLimit);
        if (_universities.isEmpty)
          return emit(UniversityState(hasReachedMax: true));
        return emit(state.copyWith(
          status: UniversityStatus.success,
          universities: _universities,
          hasReachedMax: false,
        ));
      }
      if (state.status == UniversityStatus.success) {
        final _universities = await _getUniversities.execute(
          start: _universityLimit,
          limit: _universityLimit + LIMIT_SIZE,
        );
        if (_universities.isEmpty)
          return emit(UniversityState(hasReachedMax: true));
        else {
          _universityLimit += LIMIT_SIZE;
          return emit(state.copyWith(
            status: UniversityStatus.success,
            universities: List.of(state.universities)..addAll(_universities),
            hasReachedMax: false,
          ));
        }
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
