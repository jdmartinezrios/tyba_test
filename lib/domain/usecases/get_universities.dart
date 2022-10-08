// Project imports:
import 'package:tyba_test/domain/core/university_core.dart';
import 'package:tyba_test/domain/entities/university_entity.dart';
import 'package:tyba_test/domain/repositories/university_repository.dart';

class GetUniversities implements UniversityCore {
  final UniversityRepository universityRepository;
  GetUniversities(this.universityRepository);

  @override
  Future<List<University>> execute({
    int start = 0,
    required int limit,
  }) {
    return universityRepository.getUniversities(
      start: start,
      limit: limit,
    );
  }
}
