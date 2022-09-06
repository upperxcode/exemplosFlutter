import 'package:despesas_pessoais/components/chart.dart';
import 'package:despesas_pessoais/components/transaction_user.dart';
import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'components/transaction_form.dart';
import 'config/custom_theme.dart';

void main() {
  runApp(const ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: customTheme(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
        Locale('en', 'US'),
      ],
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  //const HomePage({Key? key}) : super(key: key);

  final Transactions transactions = Transactions();

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(transactions.add);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => _openTransactionFormModal(
                    context,
                  ),
              icon: const Icon(Icons.add)),
        ],
        title: const Text('Despesas Pessoais'),
      ),
      body: TransactionUser(transactions: transactions),
    );
  }
}
