import 'package:despesas/models/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Transaction> _transactions = [
    Transaction(
        id: 't1', title: 'Fone de ouvido', value: 52.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Internet',
        value: 100,
        date: DateTime(2025, 1, 31, 10, 20)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
          title: Text('Despesas Pessoais'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 5,
              child: Text('Gráfico'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _transactions.map((tr) {
                return Card(
                  elevation: 5,
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 2)),
                        padding: EdgeInsets.all(10),
                        child: Text(tr.value.toString()),
                      ),
                      Column(
                        children: [Text(tr.title), Text(tr.date.toString())],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ));
  }
}
