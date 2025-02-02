import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() {
    return _TransactionUserState();
  }
}

class _TransactionUserState extends State<TransactionUser> {
  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions = [
      Transaction(
          id: 't1',
          title: 'Fone de ouvido',
          value: 52.99,
          date: DateTime.now()),
      Transaction(
          id: 't2',
          title: 'Internet',
          value: 1000,
          date: DateTime(2025, 1, 31, 10, 20)),
    ];
    return Column(
      children: [
        TransactionList(transactions: transactions),
        TransactionForm(),
      ],
    );
  }
}
