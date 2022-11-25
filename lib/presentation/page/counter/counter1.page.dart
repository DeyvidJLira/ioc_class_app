import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:ioc_class_app/controller/counter.controller.dart';

class Counter1Page extends StatelessWidget {
  final _controller = GetIt.instance.get<CounterController>();

  Counter1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador 1"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/counter2"),
            icon: const Icon(Icons.arrow_circle_right_rounded),
          )
        ],
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
