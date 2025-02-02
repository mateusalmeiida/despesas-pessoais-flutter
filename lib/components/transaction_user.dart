import 'dart:math';

import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'Fones de ouvido', value: 52.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Internet',
        value: 1000,
        date: DateTime(2025, 1, 31, 10, 20)),
  ];

  @override
  Widget build(BuildContext context) {
    void addTransaction(String title, double value) {
      final Transaction newTransaction = Transaction(
          id: Random().nextDouble().toString(),
          title: title,
          value: value,
          date: DateTime.now());

      setState(() {
        transactions.add(newTransaction);
      });
    }

    return Column(
      children: [
        TransactionList(transactions: transactions),
        TransactionForm(
          onSubmit: addTransaction,
        ),
      ],
    );
  }
}
