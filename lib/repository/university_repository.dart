// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:tyba_test/common/index.dart';
import 'package:tyba_test/models/university_model.dart';
import 'package:tyba_test/services/university_service.dart';

class UniversityRepository implements UniversityCore {
  final http.Client httpClient;
  UniversityRepository(this.httpClient);

  @override
  Future<List<UniversityModel>> getUniversities(int limit) async {
    final _universityServices = new UniversityServices(httpClient);
    try {
      final _results = await _universityServices.fetchUniversities(limit);
      final _universities = List<dynamic>.from(_results.body);
      final _universityList =
          _universities.map((u) => UniversityModel.fromJson(u)).toList();
      return _universityList;
    } catch (e) {
      throw Exception('error fetching data $e');
    }
  }
}
