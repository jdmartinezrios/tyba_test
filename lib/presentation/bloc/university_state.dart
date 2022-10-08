// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:tyba_test/domain/entities/university_entity.dart';

enum UniversityStatus { initial, success, failure }
enum LayoutStyle { GridView, ListView }

class UniversityState extends Equatable {
  final UniversityStatus status;
  final bool hasReachedMax;
  final LayoutStyle layout;
  final List<University> universities;

  const UniversityState({
    this.status = UniversityStatus.initial,
    this.universities = const <University>[],
    this.hasReachedMax = false,
    this.layout = LayoutStyle.ListView,
  });

  UniversityState copyWith({
    UniversityStatus? status,
    List<University>? universities,
    bool? hasReachedMax,
    LayoutStyle? layout,
  }) {
    return UniversityState(
      status: status ?? this.status,
      universities: universities ?? this.universities,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      layout: layout ?? this.layout,
    );
  }

  @override
  List<Object?> get props => [
        status,
        universities,
        hasReachedMax,
        layout,
      ];
}
