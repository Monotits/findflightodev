import 'package:findflight/view/category.dart';
import 'package:findflight/constant/constant.dart';
import 'package:findflight/provider/myproivder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data1;
  // Uçuş Süre Hesabı Yapan Fonksiyon - Liste index: 0: gidiş saat, 1: Gidiş dakika, 2: Dönüş saat, 3: dönüş dakika
  List ucusSuresiHesapla(index) {
    List sure = [];
    String gitkalkisZamani = data1[index][10];
    String gitinisZamani = data1[index][11];
    String donkalkisZamani = data1[index][12];
    String doninisZamani = data1[index][13];
    sure.add(int.parse(gitinisZamani.substring(0, 3)) -
        int.parse(gitkalkisZamani.substring(0, 3)));
    sure.add(60 -
        int.parse(gitkalkisZamani.substring(4, 6)) +
        int.parse(gitinisZamani.substring(4, 6)));
    sure.add(int.parse(doninisZamani.substring(0, 3)) -
        int.parse(donkalkisZamani.substring(0, 3)));
    sure.add(60 -
        int.parse(donkalkisZamani.substring(4, 6)) +
        int.parse(doninisZamani.substring(4, 6)));
    if (sure[1] >= 60) {
      sure[0]++;
      sure[1] = sure[1] - 60;
    }
    if (sure[3] >= 60) {
      sure[2]++;
      sure[3] = sure[3] - 60;
    }
    return sure;
  }

  @override
  Widget build(BuildContext context) {
    MyProvider myProvider = Provider.of<MyProvider>(context);
    data1 = myProvider.dataFiltre;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: myProvider.data.length != 0
            ? FloatingActionButton.extended(
                icon: Icon(Icons.ballot_outlined),
                label: Text('Kategori'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Category()),
                  );
                },
              )
            : Container(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 23, top: 20, right: 23),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.shade400),
                    color: Colors.grey.shade200),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.local_airport, size: 15),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Nereden:',
                              style: title,
                            ),
                          ],
                        ),
                        Text('Izmir'),
                        Opacity(
                          opacity: 0,
                          child: SizedBox(
                            width: 50,
                          ),
                        ),
                        Opacity(
                          opacity: 0,
                          child: SizedBox(
                            width: 50,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.local_airport, size: 15),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Nereye:',
                              style: title,
                            ),
                          ],
                        ),
                        Text('Frankfurt'),
                        Opacity(
                          opacity: 0,
                          child: SizedBox(
                            width: 90,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.date_range, size: 15),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Tarih:',
                              style: title,
                            ),
                          ],
                        ),
                        Text('27.09.2021'),
                        Opacity(
                          opacity: 0,
                          child: SizedBox(
                            width: 60,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person_add, size: 15),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Yolcu:',
                              style: title,
                            ),
                          ],
                        ),
                        Text('1'),
                        Opacity(
                          opacity: 0,
                          child: SizedBox(
                            width: 50,
                          ),
                        ),
                        Opacity(
                          opacity: 0,
                          child: SizedBox(
                            width: 30,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.airline_seat_recline_normal, size: 15),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Sınıf:',
                              style: title,
                            ),
                          ],
                        ),
                        Text('Economy'),
                        Opacity(
                          opacity: 0,
                          child: SizedBox(
                            width: 70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            myProvider.data.length == 0
                ? Center(
                    child: ElevatedButton(
                        onPressed: () {
                          myProvider.getData();
                          setState(() {});
                        },
                        child: Text(myProvider.buttonText)),
                  )
                : Container(),
            myProvider.data.length != 0
                ? FutureBuilder(
                    future: Future.delayed(
                      Duration(seconds: 3),
                    ),
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '  Listenen Sonuç Sayısı: ' +
                                  myProvider.dataFiltre.length.toString(),
                            ),
                            Container(
                              height:
                                  myProvider.dataFiltre.length == 0 ? 450 : 485,
                              child: myProvider.dataFiltre.length != 0
                                  ? ListView.builder(
                                      itemCount: myProvider.dataFiltre.length,
                                      itemBuilder:
                                          (BuildContext ctxt, int index) {
                                        return Container(
                                          height: 160,
                                          child: Card(
                                            color: Colors.grey.shade300,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 2.0,
                                                  right: 2,
                                                  top: 0,
                                                  bottom: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: 220,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  child: myProvider.dataFiltre[index]
                                                                              [
                                                                              0] ==
                                                                          'TK'
                                                                      ? thyLogo
                                                                      : lufthansaLogo,
                                                                ),
                                                                myProvider.dataFiltre[index]
                                                                            [
                                                                            0] !=
                                                                        'TK'
                                                                    ? Text(
                                                                        'Lufthansa',
                                                                        style:
                                                                            card1,
                                                                      )
                                                                    : Text(
                                                                        'Turk Hava Yolları',
                                                                        style:
                                                                            card1,
                                                                      ),
                                                                Text(
                                                                  myProvider.dataFiltre[
                                                                              index]
                                                                          [0] +
                                                                      ' ' +
                                                                      myProvider
                                                                              .dataFiltre[
                                                                          index][1],
                                                                  style: card1,
                                                                ),
                                                                Text(
                                                                  myProvider
                                                                          .dataFiltre[
                                                                      index][6],
                                                                  style: card1,
                                                                )
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Text(myProvider
                                                                        .dataFiltre[
                                                                    index][10]),
                                                                Text(
                                                                  myProvider
                                                                          .dataFiltre[
                                                                      index][8],
                                                                  style: card1,
                                                                )
                                                              ],
                                                            ),
                                                            Column(children: [
                                                              Text(
                                                                ucusSuresiHesapla(index)[
                                                                            0]
                                                                        .toString() +
                                                                    ' sa ' +
                                                                    ucusSuresiHesapla(
                                                                            index)[1]
                                                                        .toString() +
                                                                    ' dak',
                                                                //'4 sa 35 dak',
                                                                style: card1,
                                                              ),
                                                              Icon(Icons
                                                                  .arrow_forward_sharp),
                                                              myProvider.dataFiltre[index]
                                                                              [
                                                                              14]
                                                                          [1] !=
                                                                      null
                                                                  ? Row(
                                                                      children: [
                                                                        Text(
                                                                          myProvider.aktarmaKontrolListesiGidis[index] +
                                                                              ' Aktarma',
                                                                          style:
                                                                              card1,
                                                                        ),
                                                                        Icon(
                                                                          Icons
                                                                              .info,
                                                                          size:
                                                                              10,
                                                                          color:
                                                                              Colors.red,
                                                                        )
                                                                      ],
                                                                    )
                                                                  : Text(
                                                                      'Direk Uçuş',
                                                                      style:
                                                                          card1,
                                                                    ),
                                                            ]),
                                                            Column(
                                                              children: [
                                                                Text(myProvider
                                                                        .dataFiltre[
                                                                    index][11]),
                                                                Text(
                                                                  myProvider
                                                                          .dataFiltre[
                                                                      index][9],
                                                                  style: card1,
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 1,
                                                        width: 220,
                                                        color: Colors.white,
                                                      ),
                                                      Container(
                                                        width: 220,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  child: myProvider.dataFiltre[index]
                                                                              [
                                                                              2] ==
                                                                          'TK'
                                                                      ? thyLogo
                                                                      : lufthansaLogo,
                                                                ),
                                                                myProvider.dataFiltre[index]
                                                                            [
                                                                            2] !=
                                                                        'TK'
                                                                    ? Text(
                                                                        'Lufthansa',
                                                                        style:
                                                                            card1,
                                                                      )
                                                                    : Text(
                                                                        'Turk Hava Yolları',
                                                                        style:
                                                                            card1,
                                                                      ),
                                                                Text(
                                                                  myProvider.dataFiltre[
                                                                              index]
                                                                          [2] +
                                                                      ' ' +
                                                                      myProvider
                                                                              .dataFiltre[
                                                                          index][3],
                                                                  style: card1,
                                                                ),
                                                                Text(
                                                                  myProvider
                                                                          .dataFiltre[
                                                                      index][7],
                                                                  style: card1,
                                                                )
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Text(myProvider
                                                                        .dataFiltre[
                                                                    index][12]),
                                                                Text(
                                                                  myProvider
                                                                          .data[
                                                                      index][9],
                                                                  style: card1,
                                                                )
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Text(
                                                                  ucusSuresiHesapla(index)[
                                                                              2]
                                                                          .toString() +
                                                                      ' sa ' +
                                                                      ucusSuresiHesapla(
                                                                              index)[3]
                                                                          .toString() +
                                                                      ' dak',
                                                                  //'4 sa 35 dak',
                                                                  style: card1,
                                                                ),
                                                                Icon(Icons
                                                                    .arrow_forward_sharp),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      myProvider
                                                                              .aktarmaKontrolListesiVaris[index] +
                                                                          ' Aktarma',
                                                                      style:
                                                                          card1,
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .info,
                                                                      size: 10,
                                                                      color: Colors
                                                                          .red,
                                                                    )
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Text(myProvider
                                                                        .dataFiltre[
                                                                    index][13]),
                                                                Text(
                                                                  myProvider
                                                                          .dataFiltre[
                                                                      index][8],
                                                                  style: card1,
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        myProvider
                                                            .dataFiltre[index]
                                                                [4]
                                                            .toString(),
                                                        style: title,
                                                      ),
                                                      Text(myProvider
                                                          .dataFiltre[index][5]
                                                          .toString()),
                                                      ElevatedButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            'Sec',
                                                          )),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      })
                                  : Column(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      //crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Icon(
                                          Icons.info,
                                          color: Colors.red,
                                          size: 50,
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Center(
                                          child: Text(
                                            'Arama kriterlerinize uygun\nsonuç bulunamamıştır!',
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                            ),
                          ],
                        ),
                      );
                    })
                : Center(
                    child: Text(''),
                  )
          ],
        ),
      ),
    );
  }
}
