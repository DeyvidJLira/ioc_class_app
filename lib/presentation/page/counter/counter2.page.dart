import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:ioc_class_app/controller/counter.controller.dart';

class Counter2Page extends StatelessWidget {
  final _controller = GetIt.instance.get<CounterController>();

  Counter2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador 2"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _controller.increment,
        child: const Icon(Icons.add),
      ),
      body: SizedBox(
        child: Center(
          child: Observer(builder: (_) => Text(_controller.counter.toString())),
        ),
      ),
    );
  }
}
