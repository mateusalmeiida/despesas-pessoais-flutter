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
  const MyHomePage({super.key});

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
            Container(
              child: Card(
                elevation: 5,
                child: Text('Gráfico'),
              ),
            ),
            Container(
              child: Card(
                elevation: 5,
                child: Text('Lista de transações'),
              ),
            )
          ],
        ));
  }
}
