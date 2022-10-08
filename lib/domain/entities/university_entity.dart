// Package imports:
import 'package:equatable/equatable.dart';

class University extends Equatable {
  final String? alphaTwoCode;
  final List<String> domains;
  final String? country;
  final String? stateProvince;
  final List<String> webPages;
  final String? name;

  const University(
      {required this.alphaTwoCode,
      required this.domains,
      required this.country,
      required this.stateProvince,
      required this.name,
      required this.webPages});

  @override
  List<Object?> get props => [
        alphaTwoCode,
        domains,
        country,
        stateProvince,
        name,
        webPages,
      ];
}
