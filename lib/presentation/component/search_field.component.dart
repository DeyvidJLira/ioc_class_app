import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final _coinCodeFieldController = TextEditingController();

  Function(String code) onSearch;

  SearchField({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                  controller: _coinCodeFieldController,
                  decoration: const InputDecoration(
                      labelText: "Código da Moeda",
                      hintText: "BRL",
                      border: InputBorder.none)),
            ),
            IconButton(
                onPressed: () {
                  onSearch(_coinCodeFieldController.text);
                },
                icon: const Icon(
                  Icons.send,
                  color: Colors.green,
                ))
          ],
        ),
      ),
    );
  }
}
