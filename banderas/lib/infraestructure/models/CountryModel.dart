// Modelo para la API de RestCountries

class CountriesModel {
  final Name name;
  final List<String> capital;
  final String region;
  final String subregion;
  final int population;
  final List<String> borders;
  final Flags flags;

  CountriesModel({
    required this.name,
    required this.capital,
    required this.region,
    required this.subregion,
    required this.population,
    required this.borders,
    required this.flags,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) {
    return CountriesModel(
      name: Name.fromJson(json['name']),
      capital: List<String>.from(json['capital'] ?? []),
      region: json['region'],
      subregion: json['subregion'] ?? '',
      population: json['population'],
      borders: List<String>.from(json['borders'] ?? []),
      flags: Flags.fromJson(json['flags']),
    );
  }
}

class Name {
  final String common;
  final String official;

  Name({
    required this.common,
    required this.official,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      common: json['common'],
      official: json['official'],
    );
  }
}

class Flags {
  final String png;
  final String svg;

  Flags({
    required this.png,
    required this.svg,
  });

  factory Flags.fromJson(Map<String, dynamic> json) {
    return Flags(
      png: json['png'],
      svg: json['svg'],
    );
  }
}
