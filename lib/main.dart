import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ioc_class_app/controller/counter.controller.dart';
import 'package:ioc_class_app/controller/exchanges.controller.dart';
import 'package:ioc_class_app/navigator_key.dart';
import 'package:ioc_class_app/presentation/page/counter/counter1.page.dart';
import 'package:ioc_class_app/presentation/page/counter/counter2.page.dart';
import 'package:ioc_class_app/presentation/page/exchanges/exchanges.page.dart';
import 'package:ioc_class_app/repository/exchange.respository_impl.dart';
import 'package:ioc_class_app/service/exchange.service_impl.dart';

void main() {
  final getIt = GetIt.instance;

  getIt.registerSingleton(CounterController());
  getIt.registerFactory(
      () => ExchangesController(ExchangeRepositoryImpl(ExchangeService())));

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
      initialRoute: "/",
      routes: {
        "/": (context) => ExchangesPage(),
        "/counter1": (context) => Counter1Page(),
        "/counter2": (context) => Counter2Page()
      },
    );
  }
}
