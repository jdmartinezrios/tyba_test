// Project imports:
import 'package:tyba_test/domain/entities/university_entity.dart';

class UniversityModel {
  final String? alphaTwoCode;
  final List<String> domains;
  final String? country;
  final String? stateProvince;
  final List<String> webPages;
  final String? name;

  UniversityModel(
      {required this.alphaTwoCode,
      required this.domains,
      required this.country,
      required this.stateProvince,
      required this.name,
      required this.webPages});

  factory UniversityModel.fromJson(Map<String, dynamic> data) {
    return UniversityModel(
      name: data['name'],
      country: data['country'],
      alphaTwoCode: data['alpha_two_code'],
      stateProvince: data['state-province'],
      domains: List<String>.from(data['domains']),
      webPages: List<String>.from(data['web_pages']),
    );
  }

  University toEntity() {
    return University(
      name: name,
      country: country,
      alphaTwoCode: alphaTwoCode,
      stateProvince: stateProvince,
      domains: domains,
      webPages: webPages,
    );
  }

  @override
  String toString() =>
      'name: $name, country: $country, alphaTwoCode: $alphaTwoCode, stateProvince: $stateProvince, domains: $domains, webPages: $webPages';
}
