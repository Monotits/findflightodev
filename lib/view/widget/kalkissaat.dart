import 'package:findflight/constant/constant.dart';
import 'package:findflight/provider/myproivder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KalkSaat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyProvider myProvider = Provider.of<MyProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kalkış Saati: ',
          style: title,
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text('En Düşük: ${myProvider.kalkEnDusuk}'),
              ],
            ),
            Row(
              children: [
                Text('En Yüksek: ${myProvider.kalkEnYuksek}'),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: RangeSlider(
                  values: myProvider.kalkValues,
                  min: myProvider.enDusukKalkSaat,
                  max: myProvider.enYuksekKalkSaat,
                  onChanged: (RangeValues value) {
                    myProvider.kalkValues = value;
                    myProvider.kalkEnDusuk = value.start.toStringAsFixed(0);
                    myProvider.kalkEnYuksek = value.end.toStringAsFixed(0);
                  }),
            ),
          ],
        )
      ],
    );
  }
}
