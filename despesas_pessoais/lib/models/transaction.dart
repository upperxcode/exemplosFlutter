import 'dart:math';

import 'package:flutter/material.dart';

class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;

  Transaction({required this.id, required this.title, required this.value, required this.date});
}

class Transactions extends ChangeNotifier {
  final List<Transaction> _list = [];

  void add(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );
    _list.add(newTransaction);

    notifyListeners();
  }

  void remove(String id) {
    _list.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  List<Transaction> get items {
    return _list;
  }

  List<Transaction> get recentTransactions {
    return _list.where((tr) => tr.date.isAfter(_subDate(7))).toList();
  }

  DateTime _subDate(int days) {
    return DateTime.now().subtract(Duration(days: days));
  }
}
