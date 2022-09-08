import 'dart:math';

import 'package:flutter/material.dart';

import '../../models/expense_model.dart';
import '../../utils/sub_date.dart';

class ChatIsVisible extends ValueNotifier<bool> {
  ChatIsVisible() : super(false);

  toggle() => value = !value;
}

class MainController extends ChangeNotifier {
  /// List of Expanse */
  final List<ExpenseModel> _list = [];

  void add(String title, double value, DateTime date) {
    final newTransaction = ExpenseModel(
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

  List<ExpenseModel> get items {
    return _list;
  }

  List<ExpenseModel> get recentTransactions {
    return _list.where((tr) => tr.date.isAfter(subDate(7))).toList();
  }

  ///End List Expanse */

  /// chartIsVisble */
  bool _chartIsVisible = false;
  bool get chatIsVisible => _chartIsVisible;

  set chatIsVisible(bool v) {
    _chartIsVisible = v;
    notifyListeners();
  }

  ///End chartIsVisble */

  @override
  void dispose() {
    super.dispose();
  }


}
