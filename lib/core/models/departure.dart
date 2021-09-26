import 'departure_airport.dart';

class Departure {
  DepartureAirport? departureAirport;
  DateTime? departureDateTime;
  String? id;

  Departure({this.departureAirport, this.departureDateTime, this.id});

  factory Departure.fromJson(Map<String, dynamic> json) => Departure(
        departureAirport: json['departureAirport'] == null
            ? null
            : DepartureAirport.fromJson(
                json['departureAirport'] as Map<String, dynamic>),
        departureDateTime: json['departureDateTime'] == null
            ? null
            : DateTime.parse(json['departureDateTime'] as String),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'departureAirport': departureAirport?.toJson(),
        'departureDateTime': departureDateTime?.toIso8601String(),
        'id': id,
      };
}
