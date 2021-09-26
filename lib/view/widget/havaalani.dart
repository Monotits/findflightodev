import 'package:findflight/constant/constant.dart';
import 'package:findflight/provider/myproivder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Havaalani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyProvider myProvider = Provider.of<MyProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Havaalanı: ',
          style: title,
        ),
        Divider(),
        Column(
          children: [
            Row(
              children: [
                Text('Adnan Menderes : '),
                Checkbox(
                    value: myProvider.adnanMenderes,
                    onChanged: (value) {
                      myProvider.adnanMenderes = value!;
                    })
              ],
            ),
            Row(
              children: [
                Text('İstanbul: '),
                Checkbox(
                    value: myProvider.istanbul,
                    onChanged: (value) {
                      myProvider.istanbul = value!;
                    })
              ],
            ),
            Row(
              children: [
                Text('Main - Uluslararası: '),
                Checkbox(
                    value: myProvider.mainUluslararasi,
                    onChanged: (value) {
                      myProvider.mainUluslararasi = value!;
                    })
              ],
            ),
            Row(
              children: [
                Text('Sabiha Gökçen: '),
                Checkbox(
                    value: myProvider.sabihaGokcen,
                    onChanged: (value) {
                      myProvider.sabihaGokcen = value!;
                    })
              ],
            ),
            Row(
              children: [
                Text('Munih: '),
                Checkbox(
                    value: myProvider.munih,
                    onChanged: (value) {
                      myProvider.munih = value!;
                    })
              ],
            ),
            Row(
              children: [
                Text('Esenboga: '),
                Checkbox(
                    value: myProvider.esenboga,
                    onChanged: (value) {
                      myProvider.esenboga = value!;
                    })
              ],
            ),
          ],
        ),
      ],
    );
  }
}
