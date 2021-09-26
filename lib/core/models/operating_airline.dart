class OperatingAirline {
  String? code;
  String? name;
  String? id;

  OperatingAirline({this.code, this.name, this.id});

  factory OperatingAirline.fromJson(Map<String, dynamic> json) =>
      OperatingAirline(
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
