import 'package:flutter/material.dart';
import 'package:ioc_class_app/navigator_key.dart';
import 'package:ioc_class_app/presentation/page/counter/counter1.page.dart';
import 'package:ioc_class_app/presentation/page/counter/counter2.page.dart';
import 'package:ioc_class_app/presentation/page/exchanges/exchanges.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      navigatorKey: navigatorKey,
      initialRoute: "/counter1",
      routes: {
        "/": (context) => ExchangesPage(),
        "/counter1": (context) => Counter1Page(),
        "/counter2": (context) => Counter2Page()
      },
    );
  }
}
