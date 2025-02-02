import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  TransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _valueController,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),
            TextButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_valueController.text);
                },
                child: Text(
                  'Nova transação',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
