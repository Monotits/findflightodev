import 'arrival_airport.dart';

class Arrival {
  ArrivalAirport? arrivalAirport;
  DateTime? arrivalDateTime;
  String? id;

  Arrival({this.arrivalAirport, this.arrivalDateTime, this.id});

  factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
        arrivalAirport: json['arrivalAirport'] == null
            ? null
            : ArrivalAirport.fromJson(
                json['arrivalAirport'] as Map<String, dynamic>),
        arrivalDateTime: json['arrivalDateTime'] == null
            ? null
            : DateTime.parse(json['arrivalDateTime'] as String),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'arrivalAirport': arrivalAirport?.toJson(),
        'arrivalDateTime': arrivalDateTime?.toIso8601String(),
        'id': id,
      };
}
