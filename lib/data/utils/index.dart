// Project imports:
import 'package:tyba_test/data/models/university_model.dart';
import 'package:tyba_test/domain/entities/university_entity.dart';

List<University> universityRange(
  int min,
  int max,
  List<University> universities,
) =>
    universities.getRange(min, max).toList();

List<University> universityMap({
  required List<dynamic> universities,
}) =>
    universities.map((university) {
      return UniversityModel.fromJson(university).toEntity();
    }).toList();

int universityLength(List<dynamic> universities) => universities.length;

int universityLimit(int limit, int size) => limit <= size ? limit : size;
