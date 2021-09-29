import 'package:findflight/provider/myproivder.dart';
import 'package:findflight/provider/validasyon_provider.dart';
import 'package:findflight/view/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MyProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ValidasyonProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FindFlight',
        home: SafeArea(
          child: Scaffold(
            body: Home(),
          ),
        ),
      ),
    );
  }
}
