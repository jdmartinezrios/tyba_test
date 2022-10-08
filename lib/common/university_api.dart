class UniversityResponse {
  final int status;
  final dynamic body;
  const UniversityResponse({
    required this.body,
    required this.status,
  });
}

abstract class UniversityApi {
  Future<UniversityResponse> fetchUniversities();
}
