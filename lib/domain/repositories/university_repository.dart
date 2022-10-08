// Project imports:
import 'package:tyba_test/domain/entities/university_entity.dart';

abstract class UniversityRepository {
  Future<List<University>> getUniversities({
    int start = 0,
    required int limit,
  });
}
