import 'package:flutter/material.dart';

class ValidasyonProvider extends ChangeNotifier {
  //Cinsiyet Kontrolü => 1 - Kadın, 2- Erkek
  int _cinsiyet = 0;
  int get cinsiyet => _cinsiyet;
  set cinsiyet(int value) {
    _cinsiyet = value;
    notifyListeners();
  }

  //Ad Kontrolü
  bool _adValidator = false;
  bool get adValidator => _adValidator;
  set adValidator(bool value) {
    _adValidator = value;
  }

  //Soyad Kontrolü
  bool _soyadValidator = false;
  bool get soyadValidator => _soyadValidator;
  set soyadValidator(bool value) {
    _soyadValidator = value;
  }

  //Mail kontrolü
  bool _mailValidator = false;
  bool get mailValidator => _mailValidator;
  set mailValidator(bool value) {
    _mailValidator = value;
    notifyListeners();
  }

  // Tc vatancataşlık Kontrolü
  bool _tcVatandasi = false;
  bool get tcVatandasi => _tcVatandasi;
  set tcVatandasi(bool value) {
    _tcVatandasi = value;
    notifyListeners();
  }

  // Tc kimlik no kontrol
  bool _tcNo = false;
  bool get tcNo => _tcNo;
  set tcNo(bool value) {
    _tcNo = value;
    notifyListeners();
  }

  // Doğum Tarihi
  var _dogumTarihi = DateTime.now();
  DateTime get dogumTarihi => _dogumTarihi;
  set dogumTarihi(DateTime value) {
    _dogumTarihi = value;
    notifyListeners();
  }

  int _yas = 0;
  int get yas => calculateAge(_dogumTarihi);
  set yas(int value) {
    _yas = calculateAge(_dogumTarihi);
    notifyListeners();
  }

  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
}
