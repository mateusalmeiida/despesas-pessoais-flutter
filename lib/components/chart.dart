import 'package:despesas/components/chart_bar.dart';
import 'package:despesas/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart({required this.recentTransactions, super.key});

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (Transaction tr in recentTransactions) {
        bool sameDay = tr.date.day == weekDay.day;
        bool sameMonth = tr.date.month == weekDay.month;
        bool sameYear = tr.date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += tr.value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: groupedTransactions.map(
            (tr) {
              return ChartBar(
                  label: tr['day'].toString(),
                  value: (tr['value'] as num).toDouble(),
                  percentage: 0.5);
            },
          ).toList(),
        ));
  }
}
