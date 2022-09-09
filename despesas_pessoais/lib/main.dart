import 'package:despesas_pessoais/components/transaction_user.dart';
import 'package:despesas_pessoais/repositories/despesa_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'components/transaction_form.dart';
import 'config/custom_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  final DespesaRepository transactions = DespesaRepository();

  HomePage({super.key});

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return FractionallySizedBox(heightFactor: 0.90, child: TransactionForm(transactions.add));
      },
    );
  }

  void _changeChartOrList() {
    transactions.chatIsVisible = !transactions.chatIsVisible;
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    /*final appBar = AnimatedBuilder(
      animation: transactions,
      builder: (context, child) =>
    );*/

    final difHeight = AppBar().preferredSize.height + MediaQuery.of(context).padding.top;

    return AnimatedBuilder(
      animation: transactions,
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            if (!isPortrait)
              IconButton(
                  onPressed: _changeChartOrList,
                  icon: Icon(
                    !transactions.chatIsVisible ? Icons.bar_chart : Icons.list,
                  )),
            IconButton(
                onPressed: () => _openTransactionFormModal(
                      context,
                    ),
                icon: const Icon(Icons.add)),
          ],
          title: const Text('Despesas Pessoais'),
        ),
        body: TransactionUser(
          transactions: transactions,
          difHeight: difHeight,
        ),
      ),
    );
  }
}
