import 'dart:math';

import 'package:despesas/components/chart.dart';
import 'package:despesas/components/transaction_form.dart';
import 'package:despesas/models/transaction.dart';
import 'package:flutter/material.dart';

import 'components/transaction_list.dart';

void main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        theme: ThemeData(
          textTheme: TextTheme(
              titleSmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )),
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                fontSize: 18,
              ),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            primary: Colors.green,
            onPrimary: Colors.white,
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(String title, double value, DateTime date) {
    final Transaction newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: date);

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(onSubmit: _addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _openTransactionFormModal(context);
            },
            icon: Icon(Icons.add),
          )
        ],
        title: Text('Despesas Pessoais'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(recentTransactions: _recentTransactions),
            TransactionList(transactions: _transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        onPressed: () {
          _openTransactionFormModal(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
