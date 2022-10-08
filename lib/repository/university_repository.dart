// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:tyba_test/common/index.dart';
import 'package:tyba_test/models/university_model.dart';
import 'package:tyba_test/services/university_service.dart';
import 'package:tyba_test/utils/index.dart';

class UniversityRepository implements UniversityCore {
  final http.Client httpClient;
  UniversityRepository(this.httpClient);

  @override
  Future<List<UniversityModel>> getUniversities({
    int start = 0,
    required int limit,
  }) async {
    final _universityServices = new UniversityServices(httpClient);
    try {
      final _results = await _universityServices.fetchUniversities();
      final _universities = List<dynamic>.from(_results.body);
      final _universityList = universityMap(universities: _universities);
      final _universitySize = universityLength(_universityList);
      final _limit = universityLimit(limit, _universitySize);
      final _rangedValues = universityRange(start, _limit, _universityList);
      return (start <= _universitySize) ? _rangedValues : <UniversityModel>[];
    } catch (e) {
      throw Exception('error fetching data $e');
    }
  }
}
