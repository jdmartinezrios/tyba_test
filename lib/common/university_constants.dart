enum UniversityEndpoints { GETALL }

class UniversityConstants {
  static const String API_URL =
      'https://tyba-assets.s3.amazonaws.com/FE-Engineer-test';
  static const Map<UniversityEndpoints, dynamic> SERVICES = {
    UniversityEndpoints.GETALL: '$API_URL/universities.json'
  };
}
