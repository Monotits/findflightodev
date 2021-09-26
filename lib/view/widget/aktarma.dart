import 'package:findflight/constant/constant.dart';
import 'package:findflight/provider/myproivder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Aktarma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyProvider myProvider = Provider.of<MyProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Uçuş Tipi: ',
          style: title,
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text('Aktarmasız: '),
                Checkbox(
                    value: myProvider.aktarmasiz,
                    onChanged: (value) {
                      myProvider.aktarmasiz = value!;
                    })
              ],
            ),
            Row(
              children: [
                Text('Aktarmalı: '),
                Checkbox(
                    value: myProvider.aktarmali,
                    onChanged: (value) {
                      myProvider.aktarmali = value!;
                    })
              ],
            ),
          ],
        ),
      ],
    );
  }
}
