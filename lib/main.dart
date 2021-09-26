import 'package:findflight/provider/myproivder.dart';
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
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: SafeArea(
          child: Scaffold(
            body: Home(),
          ),
        ),
      ),
    );
  }
}
