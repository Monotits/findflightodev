import 'city.dart';

class DepartureAirport {
  String? code;
  String? name;
  bool? isMultiple;
  String? cityId;
  int? order;
  City? city;
  String? id;

  DepartureAirport({
    this.code,
    this.name,
    this.isMultiple,
    this.cityId,
    this.order,
    this.city,
    this.id,
  });

  factory DepartureAirport.fromJson(Map<String, dynamic> json) =>
      DepartureAirport(
        code: json['code'] as String?,
        name: json['name'] as String?,
        isMultiple: json['isMultiple'] as bool?,
        cityId: json['cityId'] as String?,
        order: json['order'] as int?,
        city: json['city'] == null
            ? null
            : City.fromJson(json['city'] as Map<String, dynamic>),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'isMultiple': isMultiple,
        'cityId': cityId,
        'order': order,
        'city': city?.toJson(),
        'id': id,
      };
}
