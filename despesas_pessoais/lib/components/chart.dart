import 'package:despesas_pessoais/components/chart_bar.dart';
import 'package:despesas_pessoais/repositories/despesa_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final DespesaRepository recentTransaction;

  const Chart(this.recentTransaction, {Key? key}) : super(key: key);

  List<Map<String, dynamic>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;

      for (var index in recentTransaction.recentTransactions() ) {
        if ((index.date!.day == weekDay.day) &&
            (index.date!.month == weekDay.month) &&
            (index.date!.year == weekDay.year)) {
          totalSum += index.value!;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransaction.fold(0.0, (sum, item) => sum + item['value']);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: recentTransaction,
      builder: (context, child) => Card(
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 110,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: groupedTransaction
                    .map(
                      (tr) => Flexible(
                        fit: FlexFit.tight,
                        child: ChartBar(
                          tr['day'],
                          tr['value'],
                          _weekTotalValue == 0 ? 0 : (tr['value'] as double) / _weekTotalValue,
                        ),
                      ),
                    )
                    .toList()),
          ),
        ),
      ),
    );
  }
}
