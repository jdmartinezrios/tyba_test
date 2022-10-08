// Project imports:
import 'package:tyba_test/models/university_model.dart';

List<UniversityModel> universityRange(
  int min,
  int max,
  List<UniversityModel> universities,
) =>
    universities.getRange(min, max).toList();

List<UniversityModel> universityMap({
  required List<dynamic> universities,
}) =>
    universities.map((u) => UniversityModel.fromJson(u)).toList();

int universityLength(List<dynamic> universities) => universities.length;

int universityLimit(int limit, int size) => limit <= size ? limit : size;
