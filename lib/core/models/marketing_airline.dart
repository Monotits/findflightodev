class MarketingAirline {
  String? code;
  String? name;
  String? id;

  MarketingAirline({this.code, this.name, this.id});

  factory MarketingAirline.fromJson(Map<String, dynamic> json) =>
      MarketingAirline(
        code: json['code'] as String?,
        name: json['name'] as String?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'id': id,
      };
}
