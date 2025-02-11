import 'package:despesas/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(
      {required this.transactions, required this.onRemove, super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isNotEmpty
        ? ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FittedBox(
                          child: Text('R\$${tr.value.toStringAsFixed(2)}')),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                  trailing: MediaQuery.of(context).size.width > 400
                      ? ElevatedButton.icon(
                          onPressed: () {
                            onRemove(tr.id);
                          },
                          style:
                              ButtonStyle(elevation: WidgetStatePropertyAll(0)),
                          icon: Icon(Icons.delete),
                          label: Text('Excluir'),
                        )
                      : IconButton(
                          onPressed: () {
                            onRemove(tr.id);
                          },
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).primaryColor,
                        ),
                ),
              );
            },
          )
        : LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                Text(
                  'Nenhuma Transação Cadastrada!',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          });
  }
}
