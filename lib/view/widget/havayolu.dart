import 'package:findflight/constant/constant.dart';
import 'package:findflight/provider/myproivder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Havayolu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyProvider myProvider = Provider.of<MyProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hava Yolları : ',
          style: title,
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text('Türk Hava Yolları: '),
                Checkbox(
                    value: myProvider.thy,
                    onChanged: (value) {
                      myProvider.thy = value!;
                    })
              ],
            ),
            Row(
              children: [
                Text('Lufthansa: '),
                Checkbox(
                    value: myProvider.lufthansa,
                    onChanged: (value) {
                      myProvider.lufthansa = value!;
                    })
              ],
            ),
          ],
        ),
      ],
    );
  }
}
