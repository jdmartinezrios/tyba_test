// Project imports:
import 'package:tyba_test/models/university_model.dart';

abstract class UniversityCore {
  Future<List<UniversityModel>> getUniversities(int page);
}