import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:ioc_class_app/controller/exchanges.controller.dart';
import 'package:ioc_class_app/presentation/component/input_dialog.component.dart';
import 'package:ioc_class_app/presentation/component/progress_dialog.component.dart';
import 'package:ioc_class_app/presentation/component/search_field.component.dart';
import 'package:ioc_class_app/presentation/widget/exchange_tile.dart';

class ExchangesPage extends StatelessWidget {
  final _controller = GetIt.instance.get<ExchangesController>();
  final _progressDialog = ProgressDialog();

  ExchangesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Câmbio"),
        actions: [
          IconButton(
              onPressed: InputDialog(
                      titleText: "Valor de Referência",
                      hintText: "digite um valor",
                      buttonText: "Salvar",
                      onClick: _controller.changeValueBase)
                  .show,
              icon: const Icon(Icons.edit))
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Observer(
          builder: (_) => Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              SearchField(
                onSearch: _searchCoinCode,
              ),
              ExchangeTile(
                  backgroundColor: Colors.green,
                  fontColor: Colors.white,
                  baseValue: 1,
                  exchange: _controller.exchangeBase),
              const Divider(),
              Expanded(
                child: _controller.exchanges.isEmpty
                    ? const SizedBox(
                        child: Center(
                            child: Text("Nenhuma comparação adicionada!")),
                      )
                    : ListView.builder(
                        itemCount: _controller.exchanges.length,
                        itemBuilder: (_, index) => ExchangeTile(
                            baseValue: _controller.exchangeBase.bid!,
                            exchange: _controller.exchanges.elementAt(index))),
              )
            ],
          ),
        ),
      ),
    );
  }

  _searchCoinCode(String code) async {
    _progressDialog.show();
    await _controller.searchCoinCode(code);
    _progressDialog.hide();
  }
}
