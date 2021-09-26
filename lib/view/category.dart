import 'package:findflight/provider/myproivder.dart';
import 'package:findflight/view/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widget/aktarma.dart';
import 'widget/fiyat.dart';
import 'widget/havaalani.dart';
import 'widget/havayolu.dart';
import 'widget/inissaat.dart';
import 'widget/kalkissaat.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyProvider myProvider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori'),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 840,
                child: Column(
                  children: [
                    Aktarma(),
                    Fiyat(),
                    KalkSaat(),
                    InSaat(),
                    Havaalani(),
                    Havayolu(),
                    ElevatedButton(
                        onPressed: () {
                          myProvider.kategoriFiltre();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: Text('Filtrele'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
