// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:tyba_test/config/index.dart';

class UniversityResponse {
  final int status;
  final dynamic body;
  const UniversityResponse({
    required this.body,
    required this.status,
  });
}

abstract class UniversityDataSource {
  Future<UniversityResponse> fetchUniversities();
}

class UniversityDataSourceImpl implements UniversityDataSource {
  final http.Client httpClient;
  UniversityDataSourceImpl(this.httpClient);

  @override
  Future<UniversityResponse> fetchUniversities() async {
    final _endpoint = UniversityEndpoints.GETALL;
    final _url = Uri.parse(UniversityConstants.SERVICES[_endpoint]);

    final _response = await httpClient.get(_url);
    final _jsonBody = jsonDecode(_response.body);

    return new UniversityResponse(
        body: _jsonBody, status: _response.statusCode);
  }
}
