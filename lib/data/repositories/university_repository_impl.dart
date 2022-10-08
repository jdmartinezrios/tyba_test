// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:tyba_test/data/datasources/university_data_source.dart';
import 'package:tyba_test/data/utils/index.dart';
import 'package:tyba_test/domain/entities/university_entity.dart';
import 'package:tyba_test/domain/repositories/university_repository.dart';

class UniversityRepositoryImpl implements UniversityRepository {
  final http.Client httpClient;
  UniversityRepositoryImpl(this.httpClient);

  @override
  Future<List<University>> getUniversities({
    int start = 0,
    required int limit,
  }) async {
    final _universityServices = new UniversityDataSourceImpl(httpClient);
    try {
      final _results = await _universityServices.fetchUniversities();
      final _universities = List<dynamic>.from(_results.body);
      final _universityList = universityMap(universities: _universities);
      final _universitySize = universityLength(_universityList);
      final _limit = universityLimit(limit, _universitySize);
      final _rangedValues = universityRange(start, _limit, _universityList);
      return (start <= _universitySize) ? _rangedValues : <University>[];
    } catch (e) {
      throw Exception('error fetching data $e');
    }
  }
}
