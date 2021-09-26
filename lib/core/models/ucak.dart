import 'offer.dart';
import 'request.dart';

class Ucak {
  bool? status;
  Request? request;
  int? provider;
  dynamic log;
  List<Offer>? offers;
  String? id;

  Ucak({
    this.status,
    this.request,
    this.provider,
    this.log,
    this.offers,
    this.id,
  });

  factory Ucak.fromJson(Map<String, dynamic> json) => Ucak(
        status: json['status'] as bool?,
        request: json['request'] == null
            ? null
            : Request.fromJson(json['request'] as Map<String, dynamic>),
        provider: json['provider'] as int?,
        log: json['log'] as dynamic?,
        offers: (json['offers'] as List<dynamic>?)
            ?.map((e) => Offer.fromJson(e as Map<String, dynamic>))
            .toList(),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'request': request?.toJson(),
        'provider': provider,
        'log': log,
        'offers': offers?.map((e) => e.toJson()).toList(),
        'id': id,
      };
}
