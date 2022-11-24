import 'package:flutter/material.dart';
import 'package:ioc_class_app/domain/model/exchange.model.dart';
import 'package:ioc_class_app/extension/double.extension.dart';

class ExchangeTile extends StatelessWidget {
  final Exchange exchange;
  final Color? backgroundColor;
  final Color? fontColor;
  final double baseValue;

  const ExchangeTile(
      {required this.exchange,
      required this.baseValue,
      this.backgroundColor,
      this.fontColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: ListTile(
          title: Text(
            exchange.coinCode,
            style: TextStyle(color: fontColor),
          ),
          subtitle: Text(
            exchange.coinName,
            style: TextStyle(color: fontColor),
          ),
          trailing: Text(
            _valueConverted,
            style: TextStyle(color: fontColor),
          ),
        ),
      ),
    );
  }

  String get _valueConverted => (exchange.bid! * baseValue).formatMoney;
}
