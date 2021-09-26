import 'package:findflight/constant/constant.dart';
import 'package:findflight/provider/myproivder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Fiyat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyProvider myProvider = Provider.of<MyProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fiyat: ',
          style: title,
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text('En Düşük: ${myProvider.enDusuk}'),
              ],
            ),
            Row(
              children: [
                Text('En Yüksek: ${myProvider.enYuksek}'),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              child: RangeSlider(
                  values: myProvider.values,
                  min: myProvider.enDusukFiyat,
                  max: myProvider.enYuksekFiyat,
                  //divisions: 10,
                  onChanged: (RangeValues value) {
                    myProvider.values = value;
                    myProvider.enDusuk = value.start.toStringAsFixed(0);
                    myProvider.enYuksek = value.end.toStringAsFixed(0);
                  }),
            ),
          ],
        )
      ],
    );
  }
}
