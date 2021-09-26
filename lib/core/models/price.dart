class Price {
  String? currency;
  double? total;
  int? base;
  int? tax;
  int? fee;
  String? passengerCode;
  String? id;

  Price({
    this.currency,
    this.total,
    this.base,
    this.tax,
    this.fee,
    this.passengerCode,
    this.id,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        currency: json['currency'] as String?,
        total: (json['total'] as num?)?.toDouble(),
        base: json['base'] as int?,
        tax: json['tax'] as int?,
        fee: json['fee'] as int?,
        passengerCode: json['passengerCode'] as String?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'currency': currency,
        'total': total,
        'base': base,
        'tax': tax,
        'fee': fee,
        'passengerCode': passengerCode,
        'id': id,
      };
}
