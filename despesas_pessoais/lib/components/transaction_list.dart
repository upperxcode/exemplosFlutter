import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final Transactions transactions;

  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: transactions,
      builder: (context, child) {
        return Container(
          height: 600,
          child: transactions.items.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Sem dados de transação!',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Image.asset('assets/images/empty-folder.png'),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: transactions.items.length,
                  itemBuilder: (ctx, index) {
                    final tr = transactions.items[index];
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 5,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: FittedBox(child: Text('${tr.value}')),
                          ),
                        ),
                        title: Text(
                          tr.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                        trailing: IconButton(
                          onPressed: () => transactions.remove(transactions.items[index].id),
                          icon: const Icon(Icons.delete),
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    );
                  }),
        );
      },
    );
  }
}
