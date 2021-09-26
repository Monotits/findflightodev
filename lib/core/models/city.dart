import 'country.dart';

class City {
  String? code;
  String? name;
  String? countryId;
  Country? country;
  List<dynamic>? airports;
  String? id;

  City({
    this.code,
    this.name,
    this.countryId,
    this.country,
    this.airports,
    this.id,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        code: json['code'] as String?,
        name: json['name'] as String?,
        countryId: json['countryId'] as String?,
        country: json['country'] == null
            ? null
            : Country.fromJson(json['country'] as Map<String, dynamic>),
        airports: json['airports'] as List<dynamic>?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'countryId': countryId,
        'country': country?.toJson(),
        'airports': airports,
        'id': id,
      };
}
