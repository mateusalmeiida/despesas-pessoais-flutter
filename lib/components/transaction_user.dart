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
    Transaction(id: 't3', title: 'Sapatos', value: 100, date: DateTime.now()),
    Transaction(
        id: 't4', title: 'Smartphone', value: 1200.99, date: DateTime.now()),
    Transaction(
        id: 't5',
        title: 'Placa de vídeo',
        value: 2900.00,
        date: DateTime.now()),
    Transaction(id: 't6', title: 'Lanche', value: 30, date: DateTime.now()),
    Transaction(
        id: 't7',
        title: 'Bola de Basquete',
        value: 250.99,
        date: DateTime.now()),
    Transaction(
        id: 't8', title: 'Capinha de celular', value: 20, date: DateTime.now()),
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
        TransactionForm(
          onSubmit: addTransaction,
        ),
        TransactionList(transactions: transactions),
      ],
    );
  }
}
