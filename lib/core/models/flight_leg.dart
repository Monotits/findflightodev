class FlightLeg {
  String? from;
  bool? fromIsCity;
  String? to;
  bool? toIsCity;
  DateTime? ddate;
  String? id;

  FlightLeg({
    this.from,
    this.fromIsCity,
    this.to,
    this.toIsCity,
    this.ddate,
    this.id,
  });

  factory FlightLeg.fromJson(Map<String, dynamic> json) => FlightLeg(
        from: json['from'] as String?,
        fromIsCity: json['fromIsCity'] as bool?,
        to: json['to'] as String?,
        toIsCity: json['toIsCity'] as bool?,
        ddate: json['ddate'] == null
            ? null
            : DateTime.parse(json['ddate'] as String),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'from': from,
        'fromIsCity': fromIsCity,
        'to': to,
        'toIsCity': toIsCity,
        'ddate': ddate?.toIso8601String(),
        'id': id,
      };
}
