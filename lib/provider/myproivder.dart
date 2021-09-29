import 'dart:convert';

import 'package:findflight/constant/constant.dart';
import 'package:findflight/core/models/ucak.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyProvider extends ChangeNotifier {
  String _buttonText = 'Sonuçları Görüntüle';
  String get buttonText => _buttonText;

  List<double> _fiyatListesi = [];
  List<double> get fiyatListesi => _fiyatListesi;
  List<String> _aktarmaKontrolListesiGidis = [];
  List<String> get aktarmaKontrolListesiGidis => _aktarmaKontrolListesiGidis;
  List<String> _aktarmaKontrolListesiVaris = [];
  List<String> get aktarmaKontrolListesiVaris => _aktarmaKontrolListesiVaris;
  //Data -> jsondan gelen tüm datanın tutulduğu liste
  List<dynamic> _data = [];
  List<dynamic> get data => _data;
  //DataFiltre -> Filtre seçeneklerine göre oluşturulan yeni liste
  List<dynamic> _dataFiltre = [];
  List<dynamic> get dataFiltre => _dataFiltre;

  //Uçuş Tipi
  bool _aktarmasiz = true;
  bool _aktarmali = true;
  //Uçuş Tipi - Get Metotları
  bool get aktarmasiz => _aktarmasiz;
  bool get aktarmali => _aktarmali;
  //Uçuş Tipi - Set Metotları
  set aktarmali(bool value) {
    _aktarmali = value;
    notifyListeners();
  }

  set aktarmasiz(bool value) {
    _aktarmasiz = value;
    notifyListeners();
  }

  //Fiyat Değişkenleri
  late var _values = RangeValues(_enDusukFiyat, _enYuksekFiyat);
  double _enDusukFiyat = 10.0;
  late String _enDusuk = _enDusukFiyat.toStringAsFixed(0);
  double _enYuksekFiyat = 90.0;
  late String _enYuksek = _enYuksekFiyat.toStringAsFixed(0);
  //Fiyat GET Metotları
  get values => _values;
  double get enDusukFiyat => _enDusukFiyat;
  String get enDusuk => _enDusuk;
  double get enYuksekFiyat => _enYuksekFiyat;
  String get enYuksek => _enYuksek;
  //Fiyat Set Metotları
  set values(value) {
    _values = value;
    notifyListeners();
  }

  set enDusukFiyat(value) {
    _enDusukFiyat = value;
    notifyListeners();
  }

  set enDusuk(value) {
    _enDusuk = value;
    notifyListeners();
  }

  set enYuksekFiyat(value) {
    _enYuksekFiyat = value;
    notifyListeners();
  }

  set enYuksek(value) {
    _enYuksek = value;
    notifyListeners();
  }

  //Havaalanı
  bool _adnanMenderes = true;
  bool _istanbul = true;
  bool _mainUluslararasi = true;
  bool _sabihaGokcen = true;
  bool _munih = true;
  bool _esenboga = true;
  //Havaalanı Get Metotları
  bool get adnanMenderes => _adnanMenderes;
  bool get istanbul => _istanbul;
  bool get mainUluslararasi => _mainUluslararasi;
  bool get sabihaGokcen => _sabihaGokcen;
  bool get munih => _munih;
  bool get esenboga => _esenboga;
  //Havaalanı Set Metotları
  set adnanMenderes(value) {
    _adnanMenderes = value;
    notifyListeners();
  }

  set istanbul(value) {
    _istanbul = value;
    notifyListeners();
  }

  set mainUluslararasi(value) {
    _mainUluslararasi = value;
    notifyListeners();
  }

  set sabihaGokcen(value) {
    _sabihaGokcen = value;
    notifyListeners();
  }

  set munih(value) {
    _munih = value;
    notifyListeners();
  }

  set esenboga(value) {
    _esenboga = value;
    notifyListeners();
  }

  //Havayolu
  bool _thy = true;
  bool _lufthansa = true;
  //Havayolu - Get Metotları
  bool get thy => _thy;
  bool get lufthansa => _lufthansa;
  //Havayolu - Set Metotları
  set thy(value) {
    _thy = value;
    notifyListeners();
  }

  set lufthansa(value) {
    _lufthansa = value;
    notifyListeners();
  }

  //İniş Saati
  late var _inisValues = RangeValues(_enDusukInSaat, _enYuksekInSaat);
  double _enDusukInSaat = 0.0;
  late String _inisEnDusuk = _enDusukInSaat.toStringAsFixed(0);
  double _enYuksekInSaat = 24.0;
  late String _inisEnYuksek = _enYuksekInSaat.toStringAsFixed(0);
  //İniş Saati - Get Metotları
  get inisValues => _inisValues;
  get enDusukInSaat => _enDusukInSaat;
  get inisEnDusuk => _inisEnDusuk;
  get enYuksekInSaat => _enYuksekInSaat;
  get inisEnYuksek => _inisEnYuksek;
  //İniş Saati - Set Metotları
  set inisValues(value) {
    _inisValues = value;
    notifyListeners();
  }

  set enDusukInSaat(value) {
    _enDusukInSaat = value;
    notifyListeners();
  }

  set inisEnDusuk(value) {
    _inisEnDusuk = value;
    notifyListeners();
  }

  set enYuksekInSaat(value) {
    _enYuksekInSaat = value;
    notifyListeners();
  }

  set inisEnYuksek(value) {
    _inisEnYuksek = value;
    notifyListeners();
  }

  //Kalkış Saati
  late var _kalkValues = RangeValues(_enDusukKalkSaat, _enYuksekKalkSaat);
  double _enDusukKalkSaat = 0;
  late String _kalkEnDusuk = _enDusukKalkSaat.toStringAsFixed(0);
  double _enYuksekKalkSaat = 24;
  late String _kalkEnYuksek = _enYuksekKalkSaat.toStringAsFixed(0);
  //Kalkış Saati - Get Metotları
  get kalkValues => _kalkValues;
  get enDusukKalkSaat => _enDusukKalkSaat;
  get kalkEnDusuk => _kalkEnDusuk;
  get enYuksekKalkSaat => _enYuksekKalkSaat;
  get kalkEnYuksek => _kalkEnYuksek;
  //Kalkış Saati - Set Metotları
  set kalkValues(value) {
    _kalkValues = value;
    notifyListeners();
  }

  set enDusukKalkSaat(value) {
    _enDusukKalkSaat = value;
    notifyListeners();
  }

  set kalkEnDusuk(value) {
    _kalkEnDusuk = value;
    notifyListeners();
  }

  set enYuksekKalkSaat(value) {
    _enYuksekKalkSaat = value;
    notifyListeners();
  }

  set kalkEnYuksek(value) {
    _kalkEnYuksek = value;
    notifyListeners();
  }

  //Get Data - Json Parse ve Liste Oluşturma Fonksiyonu
  Future getData() async {
    _buttonText = 'Yükleniyor..';
    var response = await http.get(Uri.parse(urlJson));
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      Ucak flight = Ucak.fromJson(responseJson);
      for (var i = 0; i < flight.offers!.length; i++) {
        fiyatListesi.add(flight.offers![i].price!.total!);
        _data.add([
          flight.offers![i].flights![0].marketingAirline!
              .code, // 0- Havayolu Kısaltma İsmi - Gidiş
          flight.offers![i].flights![0].segments![0]
              .flightNo, // 1- Uçuş Kodu - Gidiş
          flight.offers![i].flights![1].marketingAirline!
              .code, // 2- Havayolu Kısaltma İsmi - Dönüş
          flight.offers![i].flights![0].segments![1]
              .flightNo, // 3- Uçuş Kodu - Dönüş
          flight.offers![i].price!.total, // 4- Ücret Toplam Bedeli
          flight.offers![i].price!.currency, // 5- Ücret Birimi
          flight.offers![i].flights![0].segments![0]
              .cabin, // 6- Gidiş Kabin Türü - Economi vb.
          flight.offers![i].flights![1].segments![0]
              .cabin, // 7- Dönüş Kabin Türü - Economi vb.
          flight.offers![i].flights![0].segments![0].departure!
              .departureAirport!.code, // 8- Kalkış Havaalanı Kısaltması
          (flight.offers![i].flights![0].segments!.length > 2
              ? flight.offers![i].flights![0].segments![2].arrival!
                  .arrivalAirport!.code
              : flight.offers![i].flights![0].segments![1].arrival!
                  .arrivalAirport!.code),
          // 9- Varış Havaalanı Kısaltması
          flight
              .offers![i].flights![0].segments![0].departure!.departureDateTime
              .toString()
              .substring(10, 16), // 10- Gidiş - Kalkış Saati - String
          flight.offers![i].flights![0].segments![0].arrival!.arrivalDateTime
              .toString()
              .substring(10, 16), // 11- Gidiş - Varış Saati - String
          flight
              .offers![i].flights![1].segments![0].departure!.departureDateTime
              .toString()
              .substring(10, 16), // 12- Dönüş - Kalkış Saati - String
          flight.offers![i].flights![1].segments![0].arrival!.arrivalDateTime
              .toString()
              .substring(10, 16), // 13- Dönüş - Varış Saati - String
          [
            flight.offers![i].flights![1].segments![0].departure!
                .departureAirport!.code,
            (flight.offers![i].flights![1].segments!.length > 1
                ? flight.offers![i].flights![1].segments![1].departure!
                    .departureAirport!.code
                : null),
            (flight.offers![i].flights![1].segments!.length > 2
                ? flight.offers![i].flights![1].segments![2].departure!
                    .departureAirport!.code
                : null)
          ], // 14- Gidiş Tüm Havaalanı Kısaltması - Listesi
          [
            flight.offers![i].flights![0].segments![0].arrival!.arrivalAirport!
                .code,
            flight.offers![i].flights![0].segments![1].arrival!.arrivalAirport!
                .code,
            flight.offers![i].flights![0].segments!.length > 2
                ? flight.offers![i].flights![0].segments![2].arrival!
                    .arrivalAirport!.code
                : null
          ], // 15- Varış Tüm Havaalanı Kısaltması - Listesi
        ]);
        fiyatListesi.sort();
        _enDusukFiyat = fiyatListesi.first;
        _enYuksekFiyat = fiyatListesi.last;
        aktarmaKontrolListesiGidis.add(
            (flight.offers![i].flights![1].segments!.length - 1).toString());
        aktarmaKontrolListesiVaris.add(
            (flight.offers![i].flights![0].segments!.length - 1).toString());
      }
      _buttonText = 'Sonuçları Görüntüle';

      notifyListeners();
    } else {
      throw ('Hata: ${response.statusCode}');
    }
    _dataFiltre.addAll(_data);
  }

  Future kategoriFiltre() async {
    _dataFiltre.clear();
    List aktarmaListesi = [];
    List fiyatListesi = [];
    List kalkSaatListesi = [];
    List inSaatListesi = [];
    List havaalaniListesiAdnanMenderes = [];
    List havaalaniListesiIstanbul = [];
    List havaalaniListesiMain = [];
    List havaalaniListesiSabiha = [];
    List havaalaniListesiMunih = [];
    List havaalaniListesiEsenBoga = [];
    List havayoluListesiThy = [];
    List havayoluListesiLH = [];

    //---
    //Koşullara bağlı olarak _data listesi üzerinde kontrol ve yeni kontrol listeleri oluşturma
    _data.forEach((element) {
      //---
      //Aktarma Kontrolü
      if ((_aktarmasiz == true && _aktarmali == true) ||
          (_aktarmasiz == false && _aktarmali == true)) {
        aktarmaListesi.add(element);
      } else if (_aktarmasiz == true && _aktarmali == false) {
        if (element[14][1] == null) {
          aktarmaListesi.add(element);
        }
      }
      //---
      //Fiyat Kontrolü
      if (int.parse(element[4].toStringAsFixed(0)) >= int.parse(_enDusuk) &&
          int.parse(element[4].toStringAsFixed(0)) <= int.parse(_enYuksek)) {
        fiyatListesi.add(element);
      }
      //print('Fiyat Listesi: ' + fiyatListesi.length.toString());
      //---
      //Kalkış Saat Kontrolü
      if (int.parse(element[10].toString().substring(0, 3)) >
              int.parse(_kalkEnDusuk) &&
          int.parse(element[10].toString().substring(0, 3)) <
              int.parse(_kalkEnYuksek)) {
        kalkSaatListesi.add(element);
      }
      //print('Kalk Saat Listesi: ' + kalkSaatListesi.length.toString());
      //---
      //İniş Saat Kontrolü
      if (int.parse(element[12].toString().substring(0, 3)) >
              int.parse(_inisEnDusuk) &&
          int.parse(element[12].toString().substring(0, 3)) <
              int.parse(_inisEnYuksek)) {
        inSaatListesi.add(element);
      }
      //print('İniş Saat Listesi:' + inSaatListesi.length.toString());
      //---
      //Havaalanı Kontrolü
      if (_adnanMenderes == true &&
          (element[8] == 'ADB' || element[9] == 'ADB'))
        havaalaniListesiAdnanMenderes.add(element);
      //print('ADB: ' + havaalaniListesiAdnanMenderes.length.toString());
      if (_mainUluslararasi == true &&
          (element[8] == 'FRA' || element[9] == 'FRA'))
        havaalaniListesiMain.add(element);
      //print('MAİN: ' + havaalaniListesiMain.length.toString());
      if (_esenboga == true &&
          (element[14].contains('ESB') || element[15].contains('ESB')))
        havaalaniListesiEsenBoga.add(element);
      //print('ESB: ' + havaalaniListesiEsenBoga.length.toString());
      if (_istanbul == true &&
          (element[14].contains('IST') || element[15].contains('IST')))
        havaalaniListesiIstanbul.add(element);
      //print('IST: ' + havaalaniListesiIstanbul.length.toString());
      if (_munih == true &&
          (element[14].contains('MUC') || element[15].contains('MUC')))
        havaalaniListesiMunih.add(element);
      //print('MUC: ' + havaalaniListesiMunih.length.toString());
      if (_sabihaGokcen == true &&
          (element[14].contains('SAW') || element[15].contains('SAW')))
        havaalaniListesiSabiha.add(element);
      //print('SAW: ' + havaalaniListesiSabiha.length.toString());
      //---
      //Havayolo Kontrolü
      if (_thy == true && element[0] == 'TK') havayoluListesiThy.add(element);
      //print('TK: ' + havayoluListesiThy.length.toString());
      if (_lufthansa == true && element[0] == 'LH')
        havayoluListesiLH.add(element);
      //print('Lufthansa: ' + havayoluListesiLH.length.toString());
    });
    //---
    //Kontrol Listelerinin ortak kesişim kümesinin bulunması ve seçime bağlı _dataFilter listesinin oluşturulması.
    if (aktarmaListesi.isNotEmpty &&
        fiyatListesi.isNotEmpty &&
        kalkSaatListesi.isNotEmpty &&
        inSaatListesi.isNotEmpty &&
        (havaalaniListesiAdnanMenderes.isNotEmpty ||
            havaalaniListesiMain.isNotEmpty) &&
        (havayoluListesiLH.isNotEmpty || havayoluListesiThy.isNotEmpty)) {
      if (havaalaniListesiAdnanMenderes.isNotEmpty &&
          havaalaniListesiMain.isNotEmpty) {
        havaalaniListesiAdnanMenderes.addAll(havaalaniListesiMain);
        Set aktarmaHavaalanlari = {};
        if (havaalaniListesiEsenBoga.isNotEmpty)
          aktarmaHavaalanlari.addAll(havaalaniListesiEsenBoga);
        if (havaalaniListesiMunih.isNotEmpty)
          aktarmaHavaalanlari.addAll(havaalaniListesiMunih);
        if (havaalaniListesiSabiha.isNotEmpty)
          aktarmaHavaalanlari.addAll(havaalaniListesiSabiha);
        if (havaalaniListesiIstanbul.isNotEmpty)
          aktarmaHavaalanlari.addAll(havaalaniListesiIstanbul);
        Iterable havaalaniKesimiListesi = havaalaniListesiAdnanMenderes
            .toSet()
            .where((element) => aktarmaHavaalanlari.contains(element))
            .toList();
        if (havaalaniKesimiListesi.isNotEmpty) {
          havaalaniListesiAdnanMenderes.clear();
          havaalaniListesiAdnanMenderes.addAll(havaalaniKesimiListesi);
        }
      } else {
        havaalaniListesiAdnanMenderes.clear();
      }
      if (havayoluListesiThy.isNotEmpty || havayoluListesiLH.isNotEmpty) {
        havayoluListesiThy.addAll(havayoluListesiLH);
      } else {
        havayoluListesiThy.clear();
      }

      Iterable kesisimKumeListesi = aktarmaListesi
          .toSet()
          .where((element) => fiyatListesi.toSet().contains(element))
          .where((element) => kalkSaatListesi.toSet().contains(element))
          .where((element) => inSaatListesi.toSet().contains(element))
          .where((element) =>
              havaalaniListesiAdnanMenderes.toSet().contains(element))
          .where((element) => havayoluListesiThy.toSet().contains(element))
          .toList();
      //print('---- Kesisim: ' + kesisimKumeListesi.length.toString());
      if (kesisimKumeListesi.isNotEmpty) {
        dataFiltre.addAll(kesisimKumeListesi);
      } else {
        dataFiltre.clear();
        return dataFiltre;
      }
    } else {
      dataFiltre.clear();
      return dataFiltre;
    }
    notifyListeners();
  }
}
