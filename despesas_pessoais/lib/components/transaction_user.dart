import 'dart:math';

import 'package:despesas_pessoais/components/transaction_form.dart';
import 'package:despesas_pessoais/components/transaction_list.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'chart.dart';

class TransactionUser extends StatefulWidget {
  final Transactions transactions;

  TransactionUser({Key? key, required this.transactions}) : super(key: key);

  @override
  _TransactionUserState createState() => _TransactionUserState();
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
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Chart(widget.transactions),
          TransactionList(widget.transactions),
        ],
      ),
    );
  }
}
