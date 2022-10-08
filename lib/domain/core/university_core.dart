// Project imports:
import 'package:tyba_test/domain/entities/university_entity.dart';

abstract class UniversityCore {
  Future<List<University>> execute({
    int start = 0,
    required int limit,
  });
}
