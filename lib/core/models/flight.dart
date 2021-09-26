import 'marketing_airline.dart';
import 'segment.dart';

class Flight {
  int? direction;
  dynamic cabin;
  MarketingAirline? marketingAirline;
  List<Segment>? segments;
  String? id;

  Flight({
    this.direction,
    this.cabin,
    this.marketingAirline,
    this.segments,
    this.id,
  });

  factory Flight.fromJson(Map<String, dynamic> json) => Flight(
        direction: json['direction'] as int?,
        cabin: json['cabin'] as dynamic?,
        marketingAirline: json['marketingAirline'] == null
            ? null
            : MarketingAirline.fromJson(
                json['marketingAirline'] as Map<String, dynamic>),
        segments: (json['segments'] as List<dynamic>?)
            ?.map((e) => Segment.fromJson(e as Map<String, dynamic>))
            .toList(),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'direction': direction,
        'cabin': cabin,
        'marketingAirline': marketingAirline?.toJson(),
        'segments': segments?.map((e) => e.toJson()).toList(),
        'id': id,
      };
}
