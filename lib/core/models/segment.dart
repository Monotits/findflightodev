import 'arrival.dart';
import 'departure.dart';
import 'operating_airline.dart';

class Segment {
  String? flightNo;
  Departure? departure;
  Arrival? arrival;
  OperatingAirline? operatingAirline;
  String? cabin;
  String? segmentClass;
  int? baggage;
  String? id;

  Segment({
    this.flightNo,
    this.departure,
    this.arrival,
    this.operatingAirline,
    this.cabin,
    this.segmentClass,
    this.baggage,
    this.id,
  });

  factory Segment.fromJson(Map<String, dynamic> json) => Segment(
        flightNo: json['flightNo'] as String?,
        departure: json['departure'] == null
            ? null
            : Departure.fromJson(json['departure'] as Map<String, dynamic>),
        arrival: json['arrival'] == null
            ? null
            : Arrival.fromJson(json['arrival'] as Map<String, dynamic>),
        operatingAirline: json['operatingAirline'] == null
            ? null
            : OperatingAirline.fromJson(
                json['operatingAirline'] as Map<String, dynamic>),
        cabin: json['cabin'] as String?,
        segmentClass: json['class'] as String?,
        baggage: json['baggage'] as int?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'flightNo': flightNo,
        'departure': departure?.toJson(),
        'arrival': arrival?.toJson(),
        'operatingAirline': operatingAirline?.toJson(),
        'cabin': cabin,
        'class': segmentClass,
        'baggage': baggage,
        'id': id,
      };
}
