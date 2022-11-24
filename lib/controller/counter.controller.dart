import 'package:mobx/mobx.dart';

part 'counter.controller.g.dart';

class CounterController = CounterControllerBase with _$CounterController;

abstract class CounterControllerBase with Store {
  @readonly
  int _counter = 0;

  @action
  increment() {
    _counter++;
  }
}
