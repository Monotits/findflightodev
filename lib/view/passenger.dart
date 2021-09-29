import 'package:findflight/constant/constant.dart';
import 'package:findflight/provider/validasyon_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

class Passengers extends StatefulWidget {
  @override
  _PassengersState createState() => _PassengersState();
}

class _PassengersState extends State<Passengers> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool cinsiyetKontrol = true;
  @override
  Widget build(BuildContext context) {
    ValidasyonProvider validasyonProvider =
        Provider.of<ValidasyonProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Yolcu Bilgisi'),
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    yetiskinYolcu(validasyonProvider, context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Form yetiskinYolcu(
      ValidasyonProvider validasyonProvider, BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1- Yetişkin Yolcu: ',
                style: title,
              ),
              Divider(),
              Text(
                'Cinsiyet: ',
                style: titleYolcu,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: ListTile(
                      title: Text("Kadin"),
                      leading: Radio(
                        value: 1,
                        groupValue: validasyonProvider.cinsiyet,
                        onChanged: (value) {
                          setState(() {
                            cinsiyetKontrol = false;
                            validasyonProvider.cinsiyet =
                                int.parse(value.toString());
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: ListTile(
                      title: Text("Erkek"),
                      leading: Radio(
                        value: 2,
                        groupValue: validasyonProvider.cinsiyet,
                        onChanged: (value) {
                          setState(() {
                            cinsiyetKontrol = false;
                            validasyonProvider.cinsiyet =
                                int.parse(value.toString());
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: (validasyonProvider.cinsiyet == 0)
                          ? Icon(
                              Icons.warning,
                              color: cinsiyetKontrol
                                  ? Colors.transparent
                                  : Colors.red,
                            )
                          : Icon(Icons.check, color: Colors.green))
                ],
              )
            ],
          ),
          Divider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Adı: ',
                style: titleYolcu,
              ),
              Row(
                children: [
                  Flexible(
                      flex: 4,
                      child: TextFormField(
                        validator: (value) {
                          if (value != null &&
                              value.isNotEmpty &&
                              value.length > 1) {
                            validasyonProvider.adValidator = true;
                            return null;
                          } else {
                            return 'Lütfen adınızı girin..';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Adınız..',
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                      )),
                  Flexible(
                      flex: 1,
                      child: Icon(Icons.check,
                          color: validasyonProvider.adValidator == false
                              ? Colors.transparent
                              : Colors.green)),
                ],
              ),
            ],
          ),
          Divider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\nSoyadı: ',
                style: titleYolcu,
              ),
              Row(
                children: [
                  Flexible(
                      flex: 4,
                      child: TextFormField(
                        validator: (value) {
                          if (value != null &&
                              value.isNotEmpty &&
                              value.length > 1) {
                            validasyonProvider.soyadValidator = true;
                            return null;
                          } else {
                            return 'Lütfen soyadınızı girin..';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Soyadınız..',
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                      )),
                  Flexible(
                      flex: 1,
                      child: Icon(Icons.check,
                          color: validasyonProvider.soyadValidator == false
                              ? Colors.transparent
                              : Colors.green)),
                ],
              ),
            ],
          ),
          Divider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '\nDoğum Tarihi: ',
                            style: titleYolcu,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            validasyonProvider.dogumTarihi.day.toString() +
                                '.' +
                                validasyonProvider.dogumTarihi.month
                                    .toString() +
                                '.' +
                                validasyonProvider.dogumTarihi.year.toString(),
                          ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime(DateTime.now().year - 12),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(DateTime.now().year - 12),
                              initialDatePickerMode: DatePickerMode.year,
                            ).then((date) {
                              if (date != null) {
                                setState(() {
                                  validasyonProvider.dogumTarihi = date;
                                });
                              }
                            });
                          },
                          child: Text('Doğum Tarihi Sec')),
                    ],
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Column(
                    children: [
                      Text(
                        'Yas: ' + validasyonProvider.yas.toString(),
                        style: titleYolcu,
                      ),
                      (validasyonProvider.yas == 0)
                          ? Icon(
                              Icons.warning,
                              color: cinsiyetKontrol
                                  ? Colors.transparent
                                  : Colors.red,
                            )
                          : Icon(Icons.check, color: Colors.green)
                    ],
                  ),
                ],
              ),
            ],
          ),
          Divider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\nMail: ',
                style: titleYolcu,
              ),
              Row(
                children: [
                  Flexible(
                      flex: 4,
                      child: TextFormField(
                        validator: (value) {
                          if (!EmailValidator.validate(value!)) {
                            return 'Lütfen mail adresinizi kontrol edin..';
                          } else {
                            validasyonProvider.mailValidator = true;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Mail adresiniz..',
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                      )),
                  Flexible(
                      flex: 1,
                      child: Icon(Icons.check,
                          color: validasyonProvider.mailValidator == false
                              ? Colors.transparent
                              : Colors.green)),
                ],
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Checkbox(
                  value: validasyonProvider.tcVatandasi,
                  onChanged: (value) {
                    setState(() {
                      validasyonProvider.tcVatandasi = value!;
                    });
                  }),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      validasyonProvider.tcVatandasi =
                          !validasyonProvider.tcVatandasi;
                    });
                  },
                  child: Text('TC Vatandaşı Değil')),
            ],
          ),
          validasyonProvider.tcVatandasi == false
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\nTC Kimlik No: ',
                      style: titleYolcu,
                    ),
                    Row(
                      children: [
                        Flexible(
                            flex: 4,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.length > 10 && value.length < 12) {
                                  validasyonProvider.tcNo = true;
                                  return null;
                                } else {
                                  return 'Lütfen TC Kimlik numarasını kontrol edin.';
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'TC kimlik numarasını giriniz..',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                              ),
                            )),
                        Flexible(
                            flex: 1,
                            child: Icon(Icons.check,
                                color: validasyonProvider.tcNo == false
                                    ? Colors.transparent
                                    : Colors.green)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                )
              : Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\nPasaport No: ',
                          style: titleYolcu,
                        ),
                        Row(
                          children: [
                            Flexible(flex: 4, child: TextField()),
                            Flexible(flex: 1, child: Container()),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\nPasaport Vatandaşlık: ',
                          style: titleYolcu,
                        ),
                        Row(
                          children: [
                            Flexible(flex: 4, child: TextFormField()),
                            Flexible(flex: 1, child: Container()),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\nPasaport Geçerlilik Tarihi: ',
                          style: titleYolcu,
                        ),
                        Row(
                          children: [
                            Flexible(flex: 4, child: TextFormField()),
                            Flexible(flex: 1, child: Container()),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  if (validasyonProvider.cinsiyet == 0) {
                    cinsiyetKontrol = false;
                  }
                });
                if (_formkey.currentState?.validate() == true &&
                    cinsiyetKontrol == false &&
                    validasyonProvider.yas >= 12) {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: Text(
                              'Validasyon Kontrolü',
                              textAlign: TextAlign.center,
                            ),
                            content: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.check_box, color: Colors.green),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'BAŞARILI',
                                ),
                              ],
                            ),
                          ));
                  return;
                }
              },
              child: Text('Validasyonu Kontrol Et')),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
