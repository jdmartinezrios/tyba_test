// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:tyba_test/models/university_model.dart';

enum UniversityStatus { initial, success, failure }
enum LayoutStyle { GridView, ListView }

class UniversityState extends Equatable {
  final UniversityStatus status;
  final bool hasReachedMax;
  final LayoutStyle layout;
  final List<UniversityModel> universities;

  const UniversityState({
    this.status = UniversityStatus.initial,
    this.universities = const <UniversityModel>[],
    this.hasReachedMax = false,
    this.layout = LayoutStyle.ListView,
  });

  UniversityState copyWith({
    UniversityStatus? status,
    List<UniversityModel>? universities,
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
