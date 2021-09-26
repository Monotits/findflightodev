class Country {
  String? name;
  dynamic twoLetterIsoCode;
  dynamic threeLetterIsoCode;
  int? numericIsoCode;
  dynamic phoneCode;
  List<dynamic>? cities;
  String? id;

  Country({
    this.name,
    this.twoLetterIsoCode,
    this.threeLetterIsoCode,
    this.numericIsoCode,
    this.phoneCode,
    this.cities,
    this.id,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json['name'] as String?,
        twoLetterIsoCode: json['twoLetterIsoCode'] as dynamic?,
        threeLetterIsoCode: json['threeLetterIsoCode'] as dynamic?,
        numericIsoCode: json['numericIsoCode'] as int?,
        phoneCode: json['phoneCode'] as dynamic?,
        cities: json['cities'] as List<dynamic>?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'twoLetterIsoCode': twoLetterIsoCode,
        'threeLetterIsoCode': threeLetterIsoCode,
        'numericIsoCode': numericIsoCode,
        'phoneCode': phoneCode,
        'cities': cities,
        'id': id,
      };
}
