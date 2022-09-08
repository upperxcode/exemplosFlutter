import 'package:despesas_pessoais/components/transaction_list.dart';
import 'package:despesas_pessoais/repositories/despesa_repository.dart';
import 'package:flutter/material.dart';
import 'chart.dart';

class TransactionUser extends StatefulWidget {
  final DespesaRepository transactions;
  final double difHeight;

  const TransactionUser({Key? key, required this.transactions, required this.difHeight}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  /*
  final List<Transaction> _transactions = [
    Transaction(id: 't1', title: 'Tênis Ardidas', Value: 19140.54, date: subDate(6)),
    Transaction(id: 't2', title: 'Camisa Mike', Value: 4410.65, date: subDate(4)),
    Transaction(id: 't3', title: 'Luvas Tiadora', Value: 324.84, date: subDate(3)),
    Transaction(id: 't4', title: 'Shorts Pulman', Value: 290.57, date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      Value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }


  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) => tr.date.isAfter(subDate(7))).toList();
  }
  */

  @override
  Widget build(BuildContext context) {
    final availableHeight = MediaQuery.of(context).size.height - widget.difHeight;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if ((!isPortrait && widget.transactions.chatIsVisible) || isPortrait)
          SizedBox(height: availableHeight * (isPortrait ? 0.27 : 1), child: Chart(widget.transactions)),
        if ((!isPortrait && !widget.transactions.chatIsVisible) || isPortrait)
          SizedBox(height: availableHeight * (isPortrait ? 0.73 : 1), child: TransactionList(widget.transactions)),
      ],
    );
  }
}
