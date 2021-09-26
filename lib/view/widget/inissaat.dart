import 'package:findflight/constant/constant.dart';
import 'package:findflight/provider/myproivder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InSaat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyProvider myProvider = Provider.of<MyProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'İniş Saati: ',
          style: title,
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text('En Düşük: ${myProvider.inisEnDusuk}'),
              ],
            ),
            Row(
              children: [
                Text('En Yüksek: ${myProvider.inisEnYuksek}'),
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
                  values: myProvider.inisValues,
                  min: myProvider.enDusukInSaat,
                  max: myProvider.enYuksekInSaat,
                  onChanged: (RangeValues value) {
                    myProvider.inisValues = value;
                    myProvider.inisEnDusuk = value.start.toStringAsFixed(0);
                    myProvider.inisEnYuksek = value.end.toStringAsFixed(0);
                  }),
            ),
          ],
        )
      ],
    );
  }
}
