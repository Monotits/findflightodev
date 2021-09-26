import 'flight_leg.dart';

class Request {
  int? tripType;
  int? ticketDirection;
  int? cabinType;
  bool? onlyDirectFlights;
  int? adult;
  int? child;
  int? infant;
  int? senior;
  int? student;
  List<FlightLeg>? flightLegs;
  String? id;

  Request({
    this.tripType,
    this.ticketDirection,
    this.cabinType,
    this.onlyDirectFlights,
    this.adult,
    this.child,
    this.infant,
    this.senior,
    this.student,
    this.flightLegs,
    this.id,
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        tripType: json['tripType'] as int?,
        ticketDirection: json['ticketDirection'] as int?,
        cabinType: json['cabinType'] as int?,
        onlyDirectFlights: json['onlyDirectFlights'] as bool?,
        adult: json['adult'] as int?,
        child: json['child'] as int?,
        infant: json['infant'] as int?,
        senior: json['senior'] as int?,
        student: json['student'] as int?,
        flightLegs: (json['flightLegs'] as List<dynamic>?)
            ?.map((e) => FlightLeg.fromJson(e as Map<String, dynamic>))
            .toList(),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'tripType': tripType,
        'ticketDirection': ticketDirection,
        'cabinType': cabinType,
        'onlyDirectFlights': onlyDirectFlights,
        'adult': adult,
        'child': child,
        'infant': infant,
        'senior': senior,
        'student': student,
        'flightLegs': flightLegs?.map((e) => e.toJson()).toList(),
        'id': id,
      };
}
