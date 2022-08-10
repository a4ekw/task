import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task/di/injector.dart';
import 'home_page/home_screen/view/home_view.dart';

void main() {
  AppInjector().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Suisse Intl',
      ),
      home: HomeView(GetIt.I.get()),
    );
  }
}
