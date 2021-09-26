import 'flight.dart';
import 'marketing_airline.dart';
import 'passenger_price.dart';
import 'price.dart';

class Offer {
  bool? returnOffer;
  dynamic flightBookRequestId;
  dynamic flightBookRequest;
  String? requestId;
  int? provider;
  int? numberOfBookableSeats;
  MarketingAirline? marketingAirline;
  List<Flight>? flights;
  Price? price;
  List<PassengerPrice>? passengerPrices;
  String? id;

  Offer({
    this.returnOffer,
    this.flightBookRequestId,
    this.flightBookRequest,
    this.requestId,
    this.provider,
    this.numberOfBookableSeats,
    this.marketingAirline,
    this.flights,
    this.price,
    this.passengerPrices,
    this.id,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        returnOffer: json['returnOffer'] as bool?,
        flightBookRequestId: json['flightBookRequestId'] as dynamic?,
        flightBookRequest: json['flightBookRequest'] as dynamic?,
        requestId: json['requestId'] as String?,
        provider: json['provider'] as int?,
        numberOfBookableSeats: json['numberOfBookableSeats'] as int?,
        marketingAirline: json['marketingAirline'] == null
            ? null
            : MarketingAirline.fromJson(
                json['marketingAirline'] as Map<String, dynamic>),
        flights: (json['flights'] as List<dynamic>?)
            ?.map((e) => Flight.fromJson(e as Map<String, dynamic>))
            .toList(),
        price: json['price'] == null
            ? null
            : Price.fromJson(json['price'] as Map<String, dynamic>),
        passengerPrices: (json['passengerPrices'] as List<dynamic>?)
            ?.map((e) => PassengerPrice.fromJson(e as Map<String, dynamic>))
            .toList(),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'returnOffer': returnOffer,
        'flightBookRequestId': flightBookRequestId,
        'flightBookRequest': flightBookRequest,
        'requestId': requestId,
        'provider': provider,
        'numberOfBookableSeats': numberOfBookableSeats,
        'marketingAirline': marketingAirline?.toJson(),
        'flights': flights?.map((e) => e.toJson()).toList(),
        'price': price?.toJson(),
        'passengerPrices': passengerPrices?.map((e) => e.toJson()).toList(),
        'id': id,
      };
}
