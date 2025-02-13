import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.tr,
    required this.onRemove,
  });

  final Transaction tr;
  final void Function(String p1) onRemove;

  @override
  Widget build(BuildContext context) {
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
            child: FittedBox(child: Text('R\$${tr.value.toStringAsFixed(2)}')),
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
                style: ButtonStyle(elevation: WidgetStatePropertyAll(0)),
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
  }
}
